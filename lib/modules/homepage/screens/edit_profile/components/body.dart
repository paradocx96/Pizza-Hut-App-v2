
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzahut/modules/Cart/screens/Cart.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses//components/view_addresses_link.dart';
import 'package:pizzahut/modules/homepage/screens/login/login_screen.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses/view_addresses.dart';
import 'package:pizzahut/modules/homepage/screens/view_profile/view_profile.dart';

import 'background.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  Widget pizzaHutLogo_image = Container(
    height: 50,
    child: Image.asset("images/pizza_hut_logo.png"),
  );

  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pizzaHutLogo_image,
        leading: IconButton(
          icon: Icon(Icons.navigate_before_sharp),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delivery_dining),
            onPressed: (){
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context){
                    return CupertinoAlertDialog(
                      title: const Text("Need to change deliver address?"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text("Your order will be delivered "),
                            Text("211/G Niwandama south ja-ela?",style: TextStyle( decoration: TextDecoration.underline, color: Colors.redAccent),),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Keep")),
                        TextButton(
                            onPressed: () {
                              //Navigator.of(context).pop();
                              //Navigator.pushNamed(context, ViewAddresses.routeName);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ViewAddresses()));
                            },
                            child: const Text("Change"))
                      ],
                    );
                  });
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.pushNamed(context, Cart.routeName,
              );
            },
          ),
        ],
      ),
      body: getProfile(),
    );
  }

    // Widget getBody(){
    //   Size size = MediaQuery.of(context).size;
    //   // This size provide us total height and width of our screen
    //   return Background(
    //     child: SingleChildScrollView(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //         // Container(
    //         //   child: getProfile(),
    //         // )
    //         ],
    //       ),
    //     ),
    //   );
    // }

    Widget getProfile(){
      //Size size = MediaQuery.of(context).size;
      return Scaffold(
        body: Container(
            padding: EdgeInsets.only(left: 35, top: 20, right: 35),
            child: GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        // Container(
                        //   child: Image.asset(
                        //     'assets/images/view_profile_page/view_profile_top_design.png',
                        //     alignment: Alignment.center,
                        //   ),
                        // ),
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1)
                                )
                              ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/11/07/11/49/boy-1031527_960_720.jpg'
                                )
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Colors.white
                                ),
                                color: Colors.blue
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  getEmailTextField("Email", "anderson@gmail.com", false),
                  getPhoneTextField("Phone", "0777-1212-12 ", false),
                  getAddressTextField("Address", "211/G Niwandama south, Ja-ela", false),

                  getUsernameTextField("Username", "Anderson", false),
                  getPasswordTextField("Password", "**********", true),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //     context,
                            //     PageTransition(
                            //         type: PageTransitionType.rightToLeftWithFade,
                            //         child: ViewProfile()
                            //     )
                            // );

                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => ViewProfile(),
                              ),
                            );

                          },
                          child: Text("Save Changes", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.white
                            )),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.only(left: 10,top: 15,right: 10,bottom: 15),
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
        ),
      );
    }

    Widget getEmailTextField(String labelText, String placeholder, bool isPasswordTextField){
    final IconData icon;
      return Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: TextField(
            obscureText: isPasswordTextField ? isObscurePassword : false,
            decoration: InputDecoration(
              icon: Icon(
                icon = Icons.email,
              ),
              suffixIcon: isPasswordTextField ?
                  IconButton(
                      icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                      onPressed: (){
                        setState(() {
                          isObscurePassword = !isObscurePassword;
                        });
                      }
                  ): null,
              contentPadding: EdgeInsets.only(bottom: 5),
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                  color: Colors.black
              ),
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              )
            ),
          ),
      );
    }

  Widget getPhoneTextField(String labelText, String placeholder, bool isPasswordTextField){
    final IconData icon;
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        keyboardType: TextInputType.phone,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            icon: Icon(
              icon = Icons.phone,
            ),
            suffixIcon: isPasswordTextField ?
            IconButton(
                icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                onPressed: (){
                  setState(() {
                    isObscurePassword = !isObscurePassword;
                  });
                }
            ): null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black
            ),
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            )
        ),
      ),
    );
  }
  Widget getAddressTextField(String labelText, String placeholder, bool isPasswordTextField){
    final IconData icon;
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ViewAddressesLink(press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ViewAddresses();
                    },
                  ),
                );
              })
            ],
          ),
          Container(
            child: TextField(
              obscureText: isPasswordTextField ? isObscurePassword : false,
              decoration: InputDecoration(
                  icon: Icon(
                    icon = Icons.home,
                  ),
                  suffixIcon: isPasswordTextField ?
                  IconButton(
                      icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                      onPressed: (){
                        setState(() {
                          isObscurePassword = !isObscurePassword;
                        });
                      }
                  ): null,
                  contentPadding: EdgeInsets.only(bottom: 5),
                  labelText: labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                  ),
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  )
              ),
            ),
          ),
        ],
      ),
      // padding: EdgeInsets.only(bottom: 30),
      // child: TextField(
      //   obscureText: isPasswordTextField ? isObscurePassword : false,
      //   decoration: InputDecoration(
      //       icon: Icon(
      //         icon = Icons.home,
      //       ),
      //       suffixIcon: isPasswordTextField ?
      //       IconButton(
      //           icon: Icon(Icons.remove_red_eye, color: Colors.grey),
      //           onPressed: (){
      //             setState(() {
      //               isObscurePassword = !isObscurePassword;
      //             });
      //           }
      //       ): null,
      //       contentPadding: EdgeInsets.only(bottom: 5),
      //       labelText: labelText,
      //       floatingLabelBehavior: FloatingLabelBehavior.always,
      //       hintText: placeholder,
      //       labelStyle: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.normal,
      //           color: Colors.black
      //       ),
      //       hintStyle: TextStyle(
      //           fontSize: 16,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.grey
      //       )
      //   ),
      // ),
    );
  }
  Widget getUsernameTextField(String labelText, String placeholder, bool isPasswordTextField){
    final IconData icon;
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            icon: Icon(
              icon = Icons.person,
            ),
            suffixIcon: isPasswordTextField ?
            IconButton(
                icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                onPressed: (){
                  setState(() {
                    isObscurePassword = !isObscurePassword;
                  });
                }
            ): null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black
            ),
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            )
        ),
      ),
    );
  }

  Widget getPasswordTextField(String labelText, String placeholder, bool isPasswordTextField){
    final IconData icon;
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            icon: Icon(
              icon = Icons.lock,
            ),
            suffixIcon: isPasswordTextField ?
            IconButton(
                icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                onPressed: (){
                  setState(() {
                    isObscurePassword = !isObscurePassword;
                  });
                }
            ): null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black
            ),
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            )
        ),
      ),
    );
  }
  }

