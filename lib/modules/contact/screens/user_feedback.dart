import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Cart/screens/Cart.dart';
import 'package:pizzahut/modules/contact/models/feedback_model.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses/view_addresses.dart';
import 'package:pizzahut/utils/services/FeedbackService.dart'
    as FeedbackService;

class UserFeedback extends StatefulWidget {
  const UserFeedback({Key? key}) : super(key: key);

  @override
  _UserFeedbackState createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserFeedback> {
  //image asset for logog
  Widget pizzaHutLogo_image = Container(
    height: 50,
    child: Image.asset("images/pizza_hut_logo.png"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pizzaHutLogo_image,
        leading: IconButton(
          icon: Icon(Icons.navigate_before_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delivery_dining),
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text("Need to change deliver address?"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text("Your order will be delivered "),
                            Text(
                              "211/G Niwandama south ja-ela?",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.redAccent),
                            ),
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ViewAddresses()));
                            },
                            child: const Text("Change"))
                      ],
                    );
                  });
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, Cart.routeName);
            },
          ),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    final List<String> types = [
      'Message Type',
      'Contact',
      'Order Inquiry',
      'Appreciation',
      'Complaint'
    ];

    final _messageTypeController = TextEditingController();
    final _messageBodyController = TextEditingController();
    final snackBar = SnackBar(
      content: const Text('Should filled Subject & Message!'),
    );

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFFF4EFEF)),
        child: Column(
          children: [
            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'FEEDBACK',
                style: TextStyle(height: 1.5, fontSize: 20),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              width: 300,
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: _messageTypeController,
                cursorColor: Colors.black54,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.subject,
                    color: Colors.black54,
                  ),
                  hintText: "Subject",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              width: 300,
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: _messageBodyController,
                minLines: 10,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: Colors.black54,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.comment,
                    color: Colors.black54,
                  ),
                  hintText: "Type your message here..",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFFECE00)),
                ),
                onPressed: () async {
                  final value = FeedbackModel(
                      user: 'Anonymous',
                      message_type: _messageTypeController.text,
                      description: _messageBodyController.text);
                  if (_messageTypeController.text != '' &&
                      _messageBodyController.text != '') {
                    final result = await FeedbackService.sendFeedback(value);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text(result),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const <Widget>[],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('SEND'),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 24.0,
                        semanticLabel: 'SEND',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
