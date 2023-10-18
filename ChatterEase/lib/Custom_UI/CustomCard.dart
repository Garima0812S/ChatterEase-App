import 'package:chatapp/models/ChatModel.dart';
import 'package:chatapp/pages/Individual_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key,required this.chatModel}) : super(key: key);
   final ChatModel chatModel;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context) => IndividualPage(
            chatModel:chatModel)));
        
      },
      child:  Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                chatModel.isGroup?"asset/groups_black_36dp.svg":chatModel.icon,
                color: Colors.white,
                height: 37,
                width: 37,),
            ),
            title: Text(chatModel.name,
              style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 3,),
                Text(chatModel.currentMessage,
                  style: TextStyle(
                      fontSize: 13
                  ),),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          Padding(
            padding:EdgeInsets.only(left: 80,right: 20) ,
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),

    );


  }
}
