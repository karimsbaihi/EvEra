import 'package:cryptography/cryptography.dart';
import 'dart:math';
import 'dart:convert';

class PasswordHasher {
  // Secure password hashing using Argon2
  static Future<String> hashPassword(String password) async {
    // Generate salt manually
    final salt = List.generate(16, (_) => Random.secure().nextInt(256));

    final algorithm = Argon2id(
        memory: 19456, // Memory usage in KiB
        iterations: 2, // Number of iterations
        parallelism: 2, // Parallel threads
        hashLength: 32 // 256-bit hash
    );

    // Perform hashing
    final secretKey = await algorithm.deriveKey(
        secretKey: SecretKey(utf8.encode(password)),
        nonce: salt
    );

    // Extract key bytes
    final keyBytes = await secretKey.extractBytes();

    // Combine salt and hash for storage
    final hashedPassword = base64Encode(
        [...salt, ...keyBytes]
    );

    return hashedPassword;
  }

  // Verify a password against a stored hash
  static Future<bool> verifyPassword(
      String inputPassword,
      String storedHash
      ) async {
    final algorithm = Argon2id(
        memory: 19456,
        iterations: 2,
        parallelism: 2,
        hashLength: 32
    );

    // Decode the stored hash
    final combinedBytes = base64Decode(storedHash);

    // Split salt and hash (assuming 16-byte salt)
    final salt = combinedBytes.sublist(0, 16);
    final originalHash = combinedBytes.sublist(16);

    // Derive key for input password
    final inputSecretKey = await algorithm.deriveKey(
        secretKey: SecretKey(utf8.encode(inputPassword)),
        nonce: salt
    );

    // Extract input password hash
    final inputHashBytes = await inputSecretKey.extractBytes();

    // Compare hashes
    return inputHashBytes.length == originalHash.length &&
        List.generate(
            originalHash.length,
                (i) => originalHash[i] == inputHashBytes[i]
        ).every((element) => element);
  }
}