import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'login_page.dart';

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


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }


  void registerUser(){

    if(_formKey.currentState!.validate()){

      String name = nameController.text.trim();
      String email = emailController.text.trim();

      print("Name : $name");
      print("Email : $email");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration Successful"),
        ),
      );

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