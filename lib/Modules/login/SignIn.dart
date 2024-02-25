import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plants_app/Modules/HomeLayout.dart';
import 'package:plants_app/Modules/HomePage.dart';
import 'package:plants_app/Modules/login/SignUp.dart';

import '../../shared/components.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
       final f = GlobalKey<FormState>();
       var email;
       var pass;
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: f,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('asset/images/signin.png'),
                const Text(
                  'Sign In',
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
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email,
                            password: pass,
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context)=>const HomeLayout(),)
                        );
                      } on FirebaseAuthException catch (ex) {
                        ScaffoldMessenger.of(context)
                                    .showSnackBar( SnackBar(
                                    content: Text(ex.toString()))
                                );

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
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: const Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'Forgot Password? ',
                          style: TextStyle(
                            //color: //Constants.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Reset Here',
                          style: TextStyle(
                            color: Color(0xff296e48),
                          ),
                        ),
                      ]),
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
                      border: Border.all(color: const Color(0xff296e48),),
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset('asset/images/google.png'),
                      ),
                      const Text(
                        'Sign In with Google',
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>const SignUp(),)
                    );
                  },
                  child: const Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'New to Planty? ',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        TextSpan(
                          text: 'Register',
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

