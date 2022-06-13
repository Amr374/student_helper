import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:studenthelper/auth/register.dart';
import 'package:studenthelper/screens/home_page.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {



   TextEditingController _emailTextController =
   TextEditingController(text: '');
    TextEditingController _passTextController =
   TextEditingController(text: '');
   FocusNode _passFocusNode = FocusNode();
   bool _obscureText = true;
   bool _isLoading = false;
   final _loginFormKey = GlobalKey<FormState>();




  final FirebaseAuth _auth = FirebaseAuth.instance;


   void _submitFormOnLogin() async {
     final isValid = _loginFormKey.currentState.validate();
     if (isValid) {
       setState(() {
         _isLoading = true;
       });
       try {
         await _auth.signInWithEmailAndPassword(
             email: _emailTextController.text.trim().toLowerCase(),
             password: _passTextController.text.trim());
         Navigator.of(context,).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
       } catch (errorrr) {
         setState(() {
           _isLoading = false;
         });
         // GlobalMethod.showErrorDialog(error: errorrr.toString(), ctx: context);
         print('error occured $errorrr');
       }
     }
   }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/sdf.jpg",
                fit: BoxFit.fill,),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          TextSpan(text: '    '),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              ),
                            text: 'Register',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue.shade300,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                FocusScope.of(context).requestFocus(_passFocusNode),
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailTextController,
                            validator: (value) {
                              if (value.isEmpty || !value.contains("@") || !value.contains(".com")) {
                                return "Please enter a valid Email adress";
                              } else {
                                return null;
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //Password

                          TextFormField(
                            focusNode: _passFocusNode,
                            obscureText: _obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passTextController,
                            validator: (value) {
                              if (value.isEmpty || value.length < 7) {
                                return "Please enter a valid password";
                              } else {
                                return null;
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: TextButton(
                    //     onPressed: () {
                    //       // Navigator.push(
                    //       //   context,
                    //       //   MaterialPageRoute(
                    //       //     builder: (context) => ForgetPasswordScreen(),
                    //       //   ),
                    //       // );
                    //     },
                    //     child: Text(
                    //       'Forget password?',
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 17,
                    //           decoration: TextDecoration.underline,
                    //           fontStyle: FontStyle.italic),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 40,
                    ),
                    !_isLoading ?   MaterialButton(
                      onPressed: _submitFormOnLogin,
                      color: Colors.purple[900] ,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ):Center(child:CircularProgressIndicator())
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
