import 'package:flutter/material.dart';

class UpcomingCard extends StatelessWidget {
  const UpcomingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: EdgeInsets.symmetric(vertical: 22, horizontal: 13),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/doctor.png',
              // height: 150,
              // width: 160,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: Text(
                  "Dr. krish Chaudhary",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
              Text(
                "Neurology Subspecialties",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 20, color: Colors.white,),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        "Today",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 7),
                      child: Icon(Icons.access_time_outlined, size: 20, color: Colors.white,),
                    ),
                    Text(
                      "14:30 - 15:30", style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                    ),

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
