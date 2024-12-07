import 'dart:io';

import 'package:evera/styles/colors.dart';
import 'package:evera/components/goBack.dart';
import 'package:evera/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';



class SignUpProfile extends StatefulWidget {
  const SignUpProfile({super.key});

  @override
  State<SignUpProfile> createState() => _SignUpProfileState();
}

class _SignUpProfileState extends State<SignUpProfile> {


  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  final RegExp usernameRegEx = RegExp(
    r'^[a-zA-Z0-9]+',
  );
  final RegExp phoneRegEx = RegExp(
    r'^0([675])[0-9]{8}',
  );


  // final RegExp nameRegEx = RegExp(r"^[a-zA-Z\u00C0-\u017F]+(?:[-\'\s][a-zA-Z\u00C0-\u017F]+)*$", unicode: true);

  final fullNameRegex = RegExp(
      r"(^[A-Za-z]{3,16})([ ]{0,1})([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})",
      // r"^[a-zA-ZÀ-ÿ]+(?:[-\'\s][a-zA-ZÀ-ÿ]+)*$",
    unicode: true
  );

  final formKey = GlobalKey<FormState>();


  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.dark(
              primary: mainGreen,
              // onPrimary: secondBlack,
              surface: secondBlack,
              onSurface: inputHint,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await showDialog<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titleTextStyle: TextStyle(color: inputHint,fontSize: 24),
          backgroundColor: mainBlack,
          title: const Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text('Camera',style: TextStyle(color: inputHint),),
                onTap: () async {
                  Navigator.of(context).pop(await picker.pickImage(source: ImageSource.camera));
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: Text('Gallery',style: TextStyle(color: inputHint)),
                onTap: () async {
                  Navigator.of(context).pop(await picker.pickImage(source: ImageSource.gallery));
                },
              ),
            ],
          ),
        );
      },
    );

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        leading:  goBack(),
        title: Row(
          children: [
            // const Text("Profile",style: TextStyle(fontSize: 25,color: Colors.white),),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){

                },
                child: Text("Skip",style: TextStyle(color: mainGreen,),textAlign: TextAlign.right,),
              ),
            ),
          ],
        ),
        backgroundColor: mainBlack,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Column(
                  children: [
                    _image == null
                        ? ClipRRect(
                      borderRadius:BorderRadius.circular(100),
                      child: Container(
                        height:MediaQuery.sizeOf(context).width*0.32,
                        width:MediaQuery.sizeOf(context).width*0.32,
                        color: secondBlack,
                      ),
                    )
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                        child: SizedBox(height:120,width:120,child: FittedBox(fit:BoxFit.cover,child: Image.file(_image!)))
                    ),
                    GestureDetector(
                      onTap: _pickImage,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                          child: Text('Add Photo',style: TextStyle(color: mainGreen,fontSize: 16),),
                        )
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        onTapOutside: (PointerDownEvent event) {
                          // Remove focus when tapped outside
                          FocusScope.of(context).unfocus();
                        },
                        style: const TextStyle(color: Colors.white),
                        cursorColor: mainGreen,
                        validator: (value){
                          if (value == null|| value == '') {
                            return 'Please enter your Name';
                          } else if (!fullNameRegex.hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                        decoration: InputDeco("Full Name")

                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 8),
                    //   child: TextFormField(
                    //     autovalidateMode: AutovalidateMode.onUnfocus,
                    //     onTapOutside: (PointerDownEvent event) {
                    //       // Remove focus when tapped outside
                    //       FocusScope.of(context).unfocus();
                    //     },
                    //     validator: (value){
                    //       if (value == null || value == '') {
                    //         return 'Please enter your Username';
                    //       } else if (!usernameRegEx.hasMatch(value)) {
                    //         return 'Username must not contain special characters';
                    //       }
                    //       return null;
                    //     },
                    //     style: const TextStyle(color: Colors.white),
                    //     cursorColor: mainGreen,
                    //     decoration: InputDeco('Username')
                    //
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        onTapOutside: (PointerDownEvent event) {
                          // Remove focus when tapped outside
                          FocusScope.of(context).unfocus();
                        },
                        style: const TextStyle(color: Colors.white),
                        cursorColor: mainGreen,
                        validator:(value) => validateEmail(value),
                        decoration: InputDeco("Email"),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        onTapOutside: (PointerDownEvent event) {
                          // Remove focus when tapped outside
                          FocusScope.of(context).unfocus();
                        },
                        style: const TextStyle(color: Colors.white),
                        cursorColor: mainGreen,
                        validator:(value) {
                          if (value == null|| value == '') {
                            return 'Please enter your phone number';
                          } else if (!phoneRegEx.hasMatch(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                        decoration: InputDeco("Phone Number"),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DropdownButtonFormField(
                        autovalidateMode: AutovalidateMode.disabled,
                        elevation: 3,
                        validator: (value){
                          if(value == null|| value == ''){
                            return 'Please select Gender';
                          }
                          return null;
                        },
                        borderRadius: BorderRadius.circular(10),
                        style: const TextStyle(fontSize: 16,color: Colors.white),
                        decoration: InputDecoration(
                          isDense: false,
                          fillColor: secondBlack,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                        ),
                        dropdownColor: secondBlack,
                        items: const [
                          DropdownMenuItem(
                            value: 'Male',
                            child: Text("Male"),
                          ),
                          DropdownMenuItem(
                            value: 'Female',
                            child: Text("Female"),
                          ),
                        ],
                        onChanged: (value){},
                        hint: Text("Gender",style: TextStyle(fontSize: 16,color: inputHint)),


                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            readOnly: true,
                            controller: TextEditingController(
                              text: _selectedDate?.toString().substring(0, 10).replaceAll('-', '/') ?? '',
                            ),
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: Icon(Icons.calendar_today_outlined,color: inputHint,),
                              ),
                              hintText: "Date of Birth",
                              hintStyle: TextStyle(fontSize: 16,color: inputHint),
                              filled: true,
                              fillColor: secondBlack,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: mainGreen,width: 1.5)
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 35, 0, 10),
                      child: GestureDetector(
                        onTap: (){
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            Navigator.pushNamed(context, '/signup2');
                          }
                        },
                        child: Container(
                          // width: 180,
                          height: 60,
                          decoration: BoxDecoration(
                            color: mainGreen,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              "Continue",
                              style: TextStyle(fontSize: 24,color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
