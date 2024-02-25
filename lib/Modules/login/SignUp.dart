import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plants_app/Modules/login/SignIn.dart';

import '../../shared/components.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final f = GlobalKey<FormState>();
    var email;
    var pass;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child:
          Form(
            key:f,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('asset/images/signup.png'),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                validate: (String? value) {
                  if(value!.isEmpty){
                    return"this field can't be empty ";
                  }
                  return null;
                }  ,
                onChanged: (data){
                  email = data;
                },
                type: TextInputType.emailAddress,
                obscureText: false,
                hintText: 'Enter Email',
                icon: Icons.alternate_email,
              ),
            //  CustomTextfield(
               // validate: (String? value) {
               //   if(value!.isEmpty){
                  //  return"this field can't be empty ";
                 // }
                 // return null;
                //}  ,
                //type: TextInputType.text,
               // obscureText: false,
                //hintText: 'Enter Full name',
                //icon: Icons.person,
             // ),
              CustomTextfield(
                validate: (String? value) {
                  if(value!.isEmpty){
                    return"this field can't be empty ";
                  }
                  return null;
                }  ,
                onChanged: (data){
                  pass = data;
                },
                type: TextInputType.visiblePassword,
                obscureText: true,
                hintText: 'Enter Password',
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async{
                  if(f.currentState!.validate()){
                    try {
                      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email,
                        password: pass,
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content:
                      Text("success")),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content:
                             Text("weak-password"))

                        );
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content:
                             Text("The account already exists for that email.") )
                        );

                      }
                    }


                  }

                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff296e48),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff296e48)),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('asset/images/google.png'),
                    ),
                    const Text(
                      'Sign Up with Google',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                 Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context)=>SignIn(),)
                 );
                },
                child: const Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Have an Account? ',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Color(0xff296e48),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}