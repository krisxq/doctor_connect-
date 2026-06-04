import 'package:flutter/material.dart';
import 'package:just_try/pages/upcoming_card.dart';

void main(){
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi, Krish"),
                Text("How are you feeling today?",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300
                ),)
              ],
            ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none),iconSize: 33,),
            IconButton(onPressed: (){}, icon: Icon(Icons.search), iconSize: 34,)
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(14),
          children: [
            //upcoming card
            UpcomingCard()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home,size: 35,), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_month, size: 35,), label: "Calender"),
              BottomNavigationBarItem(icon: Icon(Icons.mark_chat_unread_outlined, size: 35,), label: "Message"),
              BottomNavigationBarItem(icon: Icon(Icons.person, size: 35,), label: "User"),
            ]),
      ),
    );
  }
}
