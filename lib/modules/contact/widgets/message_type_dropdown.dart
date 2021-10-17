import 'package:flutter/material.dart';

class MessageTypeDropdown extends StatefulWidget {
  const MessageTypeDropdown({Key? key}) : super(key: key);

  @override
  _MessageTypeDropdownState createState() => _MessageTypeDropdownState();
}

class _MessageTypeDropdownState extends State<MessageTypeDropdown> {

  final List<String> types = ['Message Type','Contact', 'Order Inquiry', 'Appreciation', 'Complaint'];

  late String _selectedType = 'Message Type';


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: _selectedType,
        items: types.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e),
          );
        }).toList(),
      onChanged: (String? val) {
          setState(() {
            _selectedType = val!;
          });
        }
        );
  }
}
