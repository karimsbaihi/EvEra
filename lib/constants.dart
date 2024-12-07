// final RegExp nameRegEx = RegExp(
//   r'^[a-zA-Z]+$',
// );

final RegExp emailRegExp = RegExp(
  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
);

String? validateEmail(value){
  if (value == null|| value == '') {
    return 'Please enter your Email';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}
// String? validateName(value){
//   if (value == null|| value == '') {
//     return 'Please enter your Email';
//   } else if (!emailRegExp.hasMatch(value)) {
//     return 'Please enter a valid email address';
//   }
//   return null;
// }
