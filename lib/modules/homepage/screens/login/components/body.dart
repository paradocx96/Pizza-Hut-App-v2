
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Landing/screens/LandingPage.dart';
import 'package:pizzahut/modules/homepage/models/authentication.dart';
//import 'package:pizzahut/modules/homepage/screens/login/components/forgot_password_check.dart';
import 'package:pizzahut/modules/homepage/screens/login/components/rounded_button_red.dart';
import 'package:pizzahut/modules/homepage/screens/login/components/rounded_button_white.dart';
import 'package:pizzahut/modules/homepage/screens/login/components/rounded_input_field.dart';
import 'package:pizzahut/modules/homepage/screens/login/components/rounded_password_field.dart';
import 'package:pizzahut/modules/homepage/screens/login/components/signin_button_red.dart';
import 'package:pizzahut/modules/homepage/screens/login/components/signup_button_white.dart';
import 'package:pizzahut/modules/homepage/screens/register/register_screen.dart';
import 'package:pizzahut/modules/homepage/screens/view_profile/view_profile.dart';
import 'package:provider/provider.dart';
//import 'package:pizzahut/modules/homepage/screens/gets_started/gets_started_screen.dart';
//import 'package:pizzahut/modules/homepage/screens/splash/splash_screen.dart';

import '../login_screen.dart';
import 'background.dart';
import 'forgot_password_check.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isObscurePassword = true;
  Map<String, String> _authData = {
    'email' : '',
    'password': ''
  };

  void _showErrorDialog(String msg)
  {
    // showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //       title: Text('Email or Password Incorrect!'),
    //       content: Text(msg),
    //       actions: <Widget>[
    //         FlatButton(
    //           child: Text('Okay'),
    //           onPressed: (){
    //             Navigator.of(ctx).pop();
    //           },
    //         )
    //       ],
    //     )
    // );

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return CupertinoAlertDialog(
            title: const Text("Email or Password Incorrect!"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(msg),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Try again")),
            ],
          );
        });
  }

  Future<void> _submit() async
  {
    if(!_formKey.currentState!.validate())
    {
      return;
    }
    _formKey.currentState!.save();

    String email = _authData['email'].toString();
    String password = _authData['password'].toString();

    try{
      await Provider.of<Authentication>(context, listen: false).logIn(
          email,
          password
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) {
      //       return LandingPage();
      //     },
      //   ),
      // );

      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => LandingPage(),
        ),
      );

    } catch (error)
    {
      var errorMessage = 'Authentication Failed, Please try again later!';
      _showErrorDialog(errorMessage);
    }

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final ValueChanged<String> onChanged;
    IconData icon;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.28),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: size.width * 0.01),
                  SignInButtonRed(
                    text: "Sign In",
                    press: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return LoginScreen();
                      //     },
                      //   ),
                      // );
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => LoginScreen(),
                        ),
                      );
                    }
                ),
                SizedBox(width: size.width * 0.01),
                SignUpButtonWhite(
                    text: "Sign Up",
                    press: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return RegisterScreen();
                      //     },
                      //   ),
                      // );
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => RegisterScreen(),
                        ),
                      );
                    }
                  ),
                  SizedBox(width: size.width * 0.02),
                ],
              ),
              SizedBox(height: size.height * 0.12),
              Padding(
                  padding: EdgeInsets.only(left: 38, top: 0, right: 38),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const Icon(Icons.email, color: Colors.grey),
                                labelText: 'Email',
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  )
                              ),
                            validator: (value) {
                              if(value!.isEmpty)
                              {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                            onSaved: (value)
                            {
                              _authData['email'] = value!;
                            },
                          )
                      )
                  ),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: EdgeInsets.only(left: 38, top: 0, right: 38),
                child: Stack(
                  alignment: const Alignment(0, 0),
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                            padding:
                            EdgeInsets.only(left: 15, right: 15, top: 0),
                            child: TextFormField(
                                obscureText: true ? isObscurePassword : false,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: const Icon(Icons.lock, color: Colors.grey,),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Colors.grey
                                  ),
                                ),
                              validator: (value)
                              {
                                if(value!.isEmpty || value.length<=5)
                                {
                                  return 'Invalid password!';
                                }
                                return null;
                              },
                              onSaved: (value)
                              {
                                _authData['password'] = value!;
                              },
                            ),
                        )
                    ),
                    Positioned(
                        right: 15,
                        child: IconButton(
                            icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                            onPressed: (){
                              setState(() {
                                isObscurePassword = !isObscurePassword;
                              });
                            }
                        ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                  padding: EdgeInsets.only(left: 25, top: 0, right: 25),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          //borderRadius : new BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: RaisedButton(
                          color: Colors.redAccent,
                          splashColor: Colors.white,
                          onPressed: () {
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a Snackbar.
                              _submit();
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Checking Credentials!',textAlign: TextAlign.center,),
                                    backgroundColor: Colors.grey,
                                  )
                              );
                            }
                          },
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w700),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.white)
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(height: size.height * 0.015),
              Text(
                "OR",
                style: TextStyle(fontWeight: FontWeight.normal,fontSize: 25),

              ),
              SizedBox(height: size.height * 0.01),
              RoundedButtonWhite(
                text: "Sign up with Google",
                press: () {},
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//       child: SingleChildScrollView(
//         //Add padding to managed UI
//         //padding: new EdgeInsets.all(33.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: size.height * 0.28),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SignInButtonRed(
//                     text: "Sign In",
//                     press: (){
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return LoginScreen();
//                           },
//                         ),
//                       );
//                     }
//                 ),
//                 SizedBox(width: size.width * 0.01),
//                 SignUpButtonWhite(
//                     text: "Sign Up",
//                     press: (){
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return RegisterScreen();
//                           },
//                         ),
//                       );
//                     }
//                 ),
//                 SizedBox(width: size.width * 0.01),
//               ],
//             ),
//             SizedBox(height: size.height * 0.1),
//             RoundedInputField(
//               hintText: "Username",
//               onChanged: (value) {},
//             ),
//             RoundedPasswordField(
//               onChanged: (value) {
//               },
//             ),
//             SizedBox(height: size.height * 0.02),
//             RoundedButtonRed(
//               text: "SIGN IN",
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return RegisterScreen();
//                     },
//                   ),
//                 );
//               },
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 0,bottom: 0,left: 200,top: 0), // give some padding
//                     child: Column(
//                       children: [
//                         ForgotPasswordCheck(
//                           press: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   return LoginScreen();
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: size.height * 0.02),
//              Text(
//                 "OR",
//                 style: TextStyle(fontWeight: FontWeight.normal,fontSize: 25),
//
//             ),
//             SizedBox(height: size.height * 0.02),
//             RoundedButtonWhite(
//               text: "Sign in with Google",
//               press: () {},
//             ),
//             SizedBox(height: size.height * 0.05),
//           ],
//         ),
//       ),
//     );
//   }
// }