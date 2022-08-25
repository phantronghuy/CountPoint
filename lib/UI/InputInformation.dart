import 'package:flutter/material.dart';
import 'package:flutter_counter/objects/Player.dart';
class InputInformation extends StatefulWidget{
   
  // final Player player;
  // const InputInformation(this.player) ;
  @override
  State<InputInformation> createState() => _InputInformationState();
}

class _InputInformationState extends State<InputInformation> with WidgetsBindingObserver{

  TextEditingController nameController=TextEditingController();
  //Player player=Player.Default();
  final Player player=Player(0, '');
 // _InputInformationState(this.player);
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('Thông tin người chơi'),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child:Center(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Tên Người Chơi'),
                    controller: nameController,
                    //onChanged: (text)=> widget.player.setName(text),
                    onChanged: (text)=> player.setName(text),
                  ),
                  FlatButton(
                  
                    onPressed: () {
                      //Navigator.of(context).pop(player);
                      // Navigator.pop(context,widget.player);
                      Navigator.pop(context,player);
                    },
                    child: Text('OKE'),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}