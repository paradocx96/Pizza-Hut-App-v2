import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(20, 209, 207, 207),

      body: getBody(),
    );
  }

  Widget getBody(){
      return Scaffold(
       body: Container(
         padding: EdgeInsets.only(left: 0, top: 20, right: 0),
           child: ListView(
             children: [
               Text(
                 'Track Order',
                 textAlign: TextAlign.center,
                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black87),
               ),
               SizedBox(height: 30),
               // Padding(
               //   padding: EdgeInsets.only(left: 40, top: 0, right: 0),
               //   child: Row(
               //     children: [
               //       Text(
               //         'Primary Address',
               //         textAlign: TextAlign.center,
               //         style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black87,   decoration: TextDecoration.underline),
               //       ),
               //     ],
               //   ),
               // ),
               buildRectangleModel("Ref : 1020202020","Date : 2021-10-10:19:00"),
               //SizedBox(height: 30),
               // Padding(
               //   padding: EdgeInsets.only(left: 40, top: 10, right: 0),
               //   child: Row(
               //     children: [
               //       Text(
               //         'Other Addresses',
               //         textAlign: TextAlign.left,
               //         style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black87,   decoration: TextDecoration.underline),
               //       ),
               //     ],
               //   ),
               // ),
               buildRectangleModel("Ref : 1020202020","Date : 2021-10-10:19:00"),
               buildRectangleModel2("Ref : 1020202020","Date : 2021-10-10:19:00"),
             ],
           )
         ),
      );
  }

  Widget buildRectangleModel(String labelText, String labelText2){
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 35, top: 20, right: 35),
      height: 150.0,
      width: 450,
      color: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: size.width * 0.03),
                  Container(
                    padding: EdgeInsets.only(left: 14, top: 0, right: 0),
                    child: Text(
                      labelText,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.1),
                  Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.pending),
                        label: Text('Pending'),
                        style:  ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          padding: EdgeInsets.only(left: 0,top: 0,right: 0,bottom: 0),
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                      )),
                  SizedBox(width: size.width * 0.03),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left:0 , top: 0, right: 110),
                    child: Text(
                      labelText2,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  )
                ],
              ),
             // SizedBox(height: size.height * 0.0),
            ],
          ),
      ),
    );
  }

  Widget buildRectangleModel2(String labelText, String labelText2){
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 35, top: 20, right: 35),
      height: 150.0,
      width: 450,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: size.width * 0.03),
                Container(
                  padding: EdgeInsets.only(left: 14, top: 0, right: 0),
                  child: Text(
                    labelText,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.1),
                Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_alarm),
                      label: Text('Preparing'),
                      style:  ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        padding: EdgeInsets.only(left: 0,top: 0,right: 0,bottom: 0),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    )),
                SizedBox(width: size.width * 0.03),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left:0 , top: 0, right: 110),
                  child: Text(
                    labelText2,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                )
              ],
            ),
            // SizedBox(height: size.height * 0.0),
          ],
        ),
      ),
    );
  }

  Widget sampleRectange(){
    return Container(
      width: 500 / 7,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Text(
              '6',
              style: TextStyle(
                  color: Colors.red[500],
                  fontSize: 25),
            ),
            Text(
              'sep',
              style: TextStyle(
                  color: Colors.red[500]),
            )
          ],
        ),
      ),
    );
  }
}

