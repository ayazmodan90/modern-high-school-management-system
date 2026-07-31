import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'login_page.dart';
import '../../data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/repositories/firestore_repository.dart';
import 'package:modern_high_school/features/auth/data/models/user_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  bool hidePassword = true;
  bool hideConfirmPassword = true;

  String selectedRole = "Student";


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }
  final AuthRepository _authRepository = AuthRepository();
  final FirestoreRepository _firestoreRepository = FirestoreRepository();

  bool isLoading = false;


  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential =
      await _authRepository.registerUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      UserModel user = UserModel(
        uid: userCredential.user!.uid,
        fullName: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        role: selectedRole,
        profileImage: "",
        isActive: true,

        // New Fields
        studentClass: "",
        section: "",
        rollNo: "",
        fatherName: "",
        motherName: "",
        address: "",
        gender: "",
        dob: "",

        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _firestoreRepository.saveUser(user);

      // Yaha baad me Firestore me user save karenge

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration Successful"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Create Account"),
        centerTitle: true,
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Form(

          key: _formKey,

          child: Column(

            children: [


              const SizedBox(height:20),


              CircleAvatar(
                radius:45,
                backgroundColor: Colors.blue.shade100,

                child: const Icon(
                  Icons.person,
                  size:50,
                  color: Colors.blue,
                ),
              ),


              const SizedBox(height:30),



              CustomTextField(
                controller: nameController,
                hintText: "Full Name",
                prefixIcon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter name";
                  }
                  return null;
                },
              ),


              const SizedBox(height:15),



              CustomTextField(

                controller: emailController,

                hintText: "Email Address",
                prefixIcon: Icons.email_outlined,

                validator: (value){

                  if(value == null || value.isEmpty){

                    return "Please enter email";

                  }

                  if(!value.contains("@")){

                    return "Enter valid email";

                  }

                  return null;

                },

              ),




              const SizedBox(height:15),



              CustomTextField(

                controller: phoneController,

                hintText: "Mobile Number",
                prefixIcon: Icons.phone_outlined,

                keyboardType: TextInputType.phone,

                validator: (value){

                  if(value == null || value.isEmpty){

                    return "Please enter mobile number";

                  }


                  if(value.length != 10){

                    return "Enter valid mobile number";

                  }


                  return null;

                },


              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                initialValue: selectedRole,
                decoration: InputDecoration(
                  hintText: "Select Role",
                  prefixIcon: const Icon(Icons.school_outlined),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Color(0xFF1565C0),
                      width: 2,
                    ),
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Student",
                    child: Text("Student"),
                  ),
                  DropdownMenuItem(
                    value: "Teacher",
                    child: Text("Teacher"),
                  ),
                  DropdownMenuItem(
                    value: "Parent",
                    child: Text("Parent"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                },
              ),




              const SizedBox(height:15),




              CustomTextField(

                controller: passwordController,

                hintText: "Password",
                prefixIcon: Icons.lock_outline,

                obscureText: hidePassword,


                suffixIcon: IconButton(

                  icon: Icon(

                    hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility,

                  ),

                  onPressed: (){

                    setState(() {

                      hidePassword = !hidePassword;

                    });

                  },

                ),



                validator: (value){

                  if(value == null || value.isEmpty){

                    return "Please enter password";

                  }


                  if(value.length < 6){

                    return "Password must be 6 characters";

                  }


                  return null;

                },


              ),





              const SizedBox(height:15),




              CustomTextField(

                controller: confirmPasswordController,

                hintText: "Confirm Password",
                prefixIcon: Icons.lock_outline,


                obscureText: hideConfirmPassword,



                suffixIcon: IconButton(

                  icon: Icon(

                    hideConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,

                  ),


                  onPressed: (){

                    setState(() {

                      hideConfirmPassword =
                      !hideConfirmPassword;

                    });

                  },


                ),



                validator: (value){

                  if(value == null || value.isEmpty){

                    return "Confirm your password";

                  }


                  if(value != passwordController.text){

                    return "Password not matched";

                  }


                  return null;

                },


              ),





              const SizedBox(height:30),





              CustomButton(
                text: "Register",
                isLoading: isLoading,
                onPressed: registerUser,
              ),




              const SizedBox(height:20),




              Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [


                  const Text(
                      "Already have account?"
                  ),



                  TextButton(

                    onPressed: (){

                      Navigator.pushReplacement(

                        context,

                        MaterialPageRoute(

                          builder: (context)=> const LoginPage(),

                        ),

                      );

                    },


                    child: const Text(
                        "Login"
                    ),

                  )



                ],

              )




            ],


          ),

        ),

      ),


    );

  }

}