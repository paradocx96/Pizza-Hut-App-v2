import 'package:flutter/material.dart';
import 'package:pizzahut/modules/promos/models/custom_model.dart';

class CustomSelectOne extends StatefulWidget {
  final List<CustomModel> list;

  const CustomSelectOne({Key? key, required this.list}) : super(key: key);

  @override
  _CustomSelectOneState createState() => _CustomSelectOneState();
}

class _CustomSelectOneState extends State<CustomSelectOne> {
  late int tappedIndex;

  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 440,
      child: ListView.builder(
          itemCount: widget.list.length,
          itemExtent: 100,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    color: tappedIndex == index ? Colors.redAccent : Colors.white,
                    child: ListTile(
                      minLeadingWidth: 100,
                      onTap: () {
                        setState(() {
                          tappedIndex = index;
                        });
                      },
                      title: Text(widget.list[index].name),
                      subtitle: Text(widget.list[index].size),
                      leading:
                      Image(image: AssetImage(widget.list[index].flag)),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
