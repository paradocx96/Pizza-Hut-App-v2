import 'package:flutter/material.dart';

class SpecialInstructions extends StatefulWidget {
  const SpecialInstructions({Key? key,required this.onChanged}) : super(key: key);

  final ValueChanged<String> onChanged;

  @override
  _SpecialInstructionsState createState() => _SpecialInstructionsState();
}

class _SpecialInstructionsState extends State<SpecialInstructions> {

  final _text = TextEditingController();
  bool isValid = false;

  String instruction = "none";

  void changeInstructions(String ins){
    setState(() {
      instruction = ins;
    });
  }

  void removeInstruction(){
    widget.onChanged("none");
  }

  void saveInstruction(){
    if(_text.text.isEmpty){
      setState(() {
        isValid = false;
      });
      widget.onChanged("none");
    }
    else{
      setState(() {
        isValid = true;
      });
      //send the text to parent widget
      widget.onChanged(_text.text);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Instructions (optional)',
                hintText: 'Enter instructions',
                //errorText: isValid? null : 'This cannot be empty'
              ),
            ),
          ),

          Row(
            children: [
              Container(
                width: 188,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: (){
                        removeInstruction();
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                        //minimumSize: Size(double.infinity, 30)
                        minimumSize: MaterialStateProperty.all(Size(180, 40)),

                      ),

                      child: Text("Remove")),
                ),
              ),
              Container(
                width: 188,
                child: ElevatedButton(
                    onPressed: (){
                      saveInstruction();
                    },
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      minimumSize: MaterialStateProperty.all(Size(180, 40)),
                    ),
                    child: Text("Save")),
              ),
            ],
          )
        ],
      ),
    );
  }
}
