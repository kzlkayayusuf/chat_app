import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi Yusuf'),
        actions: [
          IconButton(
              onPressed: () {
                print("Button clicked");
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hi! This is your text',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Image.network(
                    'https://th.bing.com/th/id/OIP.FsGhfXy7oinbrRqBwcWeigHaEj?w=294&h=181&c=7&r=0&o=5&pid=1.7'),
              ],
            ),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hi! This is your text',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Image.network(
                    'https://th.bing.com/th/id/OIP.FsGhfXy7oinbrRqBwcWeigHaEj?w=294&h=181&c=7&r=0&o=5&pid=1.7'),
              ],
            ),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hi! This is your text',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Image.network(
                    'https://th.bing.com/th/id/OIP.FsGhfXy7oinbrRqBwcWeigHaEj?w=294&h=181&c=7&r=0&o=5&pid=1.7'),
              ],
            ),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hi! This is your text',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Image.network(
                    'https://th.bing.com/th/id/OIP.FsGhfXy7oinbrRqBwcWeigHaEj?w=294&h=181&c=7&r=0&o=5&pid=1.7'),
              ],
            ),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),

          Container(
            height: 100,
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.add),color: Colors.white,),
                IconButton(onPressed: (){}, icon: Icon(Icons.send),color: Colors.white,)
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
