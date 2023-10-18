import 'package:chatapp/models/ChatModel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show =false;
  FocusNode focusNode=FocusNode();
  TextEditingController _controller= TextEditingController();


  @override
  void initState(){
    super.initState();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
       setState(() {
         show = false;
       });
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Color(0xFF075e54),
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 24,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  widget.chatModel.isGroup ? "asset/groups_black_36dp.svg" : "asset/person_black_36dp.svg",
                  color: Colors.white,
                  height: 37,
                  width: 37,
                ),
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: (){},
          child:Container(
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: TextStyle( // <-- Added parentheses for the constructor
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                Text("last seen today at 12.05",style: TextStyle(
                  fontSize: 13,
                ),)
              ],
            ) ,
          ),
        ),
        actions: [
          IconButton(icon:Icon(Icons.video_call ),  onPressed: () {  },),
          IconButton(icon:Icon(Icons.call ),  onPressed: () {  },),
          PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context){
                return[
                  PopupMenuItem(child:Text("View Contact"), value: "View Contact",),
                  PopupMenuItem(child:Text("Media,links and Docs"), value: "Media,links and Docs",),
                  PopupMenuItem(child:Text("Search"), value: "Search",),
                  PopupMenuItem(child:Text("Mute Notifications"), value: "Mute Notifications",),
                  PopupMenuItem(child:Text("Disappearing Message"), value: "Disappearing Message",),
                  PopupMenuItem(child:Text("Wall Paper"), value: "Wall Paper",),
                  PopupMenuItem(child:Text("More"), value: "More",),
                ];
              }),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(child:
         Stack(
          children: [
            ListView(),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width-60,
                          child: Card(
                            margin: EdgeInsets.only(left: 2,right: 2,bottom: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                hintText: "Type a message",
                                prefixIcon:IconButton(
                                  onPressed: () {
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                    setState(() {
                                    show = !show;
                                    });
                                   },
                                 icon: Icon(Icons.emoji_emotions),
                                 ),



                            suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(onPressed: (){},
                                        icon: Icon(Icons.attach_file)),

                                    IconButton(onPressed: (){},
                                        icon: Icon(Icons.camera_alt)),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(5),
                              ),

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 5,
                            right: 5,
                            left: 2,
                          ),
                          child:  CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xF112BC7E),
                            child:
                            IconButton(onPressed: (){},
                                icon: Icon(Icons.mic,
                                  color: Colors.white,
                                )),
                          ),
                        )

                      ],
                    ),
                    show ? emojiSelect() : Container(),

                  ],
                )



            ),
          ],
        ), onWillPop:(){
          if(show){
            setState(() {
              show=false;
            });
          }
          else{
            Navigator.pop(context);
          }
          return Future.value(false);
        }
        )

        
        

      ),

    );

  }
  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (Category? category, Emoji? emoji) {
        if (emoji != null) {
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.emoji;
          });
        }
      },
    );
  }
  // Function that returns an EmojiPicker widget
  }


