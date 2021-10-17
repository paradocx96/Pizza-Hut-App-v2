import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/contact/screens/contact.dart';
import 'package:pizzahut/modules/homepage/screens/edit_profile/edit_profile.dart';
import 'package:pizzahut/modules/homepage/screens/view_profile/view_profile.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {

  static const double linkFontSize = 25;
  static const double linkPadding = 8;

  @override
  Widget build(BuildContext context) {

    Widget pizzaHutLogo_image = Container(
      height: 100,
      child: Image.asset("images/pizza_hut_logo2.png"),
    );


    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pizzaHutLogo_image,
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(linkPadding),
                  child: GestureDetector(
                    onTap: (){},
                    child: Text("Sign In / Register",style: TextStyle(fontSize: linkFontSize),),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(linkPadding),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, ViewProfile.routeName);
                    },
                    child: Text("View Profile",style: TextStyle(fontSize: linkFontSize),),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(linkPadding),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, EditProfile.routeName);
                    },
                    child: Text("Edit Profile",style: TextStyle(fontSize: linkFontSize),),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(linkPadding),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Contact.routeName);
                    },
                    child: Text("Contact Us",style: TextStyle(fontSize: linkFontSize),),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(linkPadding),
                  child: GestureDetector(
                    onTap: (){},
                    child: Text("Terms and conditions",style: TextStyle(fontSize: linkFontSize),),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(linkPadding),
                  child: GestureDetector(
                    onTap: (){},
                    child: Text("Privacy",style: TextStyle(fontSize: linkFontSize),),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(linkPadding),
                  child: GestureDetector(
                    onTap: (){},
                    child: Text("Store Locator",style: TextStyle(fontSize: linkFontSize),),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
