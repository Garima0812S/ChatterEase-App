import 'package:chatapp/pages/ChatPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

 late TabController _controller;
  @override
  void initState()
  {
    super.initState();
    _controller = TabController(length: 4, vsync: this , initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        backgroundColor: Color(0xFF075e54),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value){
              print(value);
            },
              itemBuilder: (BuildContext context){
          return[
            PopupMenuItem(child:Text("New group"), value: "New group",),
            PopupMenuItem(child:Text("New Broadcast"), value: "New Broadcast",),
            PopupMenuItem(child:Text("Whatsapp web"), value: "Whatsapp Web",),
            PopupMenuItem(child:Text("Starred Message"), value: "Starred Message",),
            PopupMenuItem(child:Text("Settings"), value: "Settings",)

          ];
          })
          //IconButton(onPressed: (){}, icon:Icon(Icons.more_vert))
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white, // Optional: You can set the indicator color
          labelColor: Colors.white,     // Set the text color of selected tab label
          unselectedLabelColor: Colors.white.withOpacity(0.7), // Set the text color of unselected tab labels
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHAT"
            ),
            Tab(
                text:"STATUS"
            ),Tab(
                text:"CALL"
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller:_controller,
        children:[
          Text("Camera"),
          //Text("Chat"),
          ChatPage(),
          Text("Status"),
          Text("Call"),
        ],

      ),
    );
  }
}
