import 'package:flutter/material.dart';
import 'package:listview_builder/model/contact.dart';

class ListDemo extends StatefulWidget {
  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  late TextEditingController _nameController;
  late TextEditingController _numberController;

  List<Contact> list = [];

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _numberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _nameController,
          ),
          TextField(
            controller: _numberController,
          ),
          InkWell(
            onTap: () {
              String name = _nameController.text;
              String number = _numberController.text;

              list.add(Contact(nm: name, number: number));

              print("Added : ${list.length}");

             setState(() {});
            },
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.lightBlue,
              child: Text(
                "Save Contact",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {

                    if(index==0)
                      {
                        return getItem1(list[index]);
                      }

                    return getItem(list[index]);
                  }))
        ],
      ),
    ));
  }

  Widget getItem(Contact contact)
  {
    return ListTile(
      onTap: (){
        print("Contact name : ${contact.nm}");

      },
      title: Text(contact.nm,style: TextStyle(color: Colors.deepPurple),),
      subtitle: Text(contact.number),
    );
  }

  Widget getItem1(Contact contact)
  {
    return ListTile(
      onTap: (){

        print("Contact name : ${contact.nm}");

      },
      title: Text(contact.nm,style: TextStyle(color: Colors.red)),
      subtitle: Text(contact.number),
    );
  }


}
