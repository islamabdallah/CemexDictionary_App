import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentTap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Questions',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildTab('Payment', 0),
                    SizedBox(
                      width: 8,
                    ),
                    buildTab('Coupons', 1),
                    SizedBox(
                      width: 8,
                    ),
                    buildTab('Coupons',2),
                    SizedBox(
                      width: 8,
                    ),
                    buildTab('Coupons', 3),
                    SizedBox(
                      width: 8,
                    ),
                    buildTab('Coupons', 4),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.704,
                child: SingleChildScrollView(child: Column(
                  children: [
                    buildQuestion(
                      'What methods of payment does Cemex accept?',
                    ),
                    Divider(),buildQuestion(
                      'What methods of payment does Cemex accept?',
                    ),
                    Divider(),buildQuestion(
                      'What methods of payment does Cemex accept?',
                    ),
                    Divider(),buildQuestion(
                      'What methods of payment does Cemex accept?',
                    ),
                    Divider(),buildQuestion(
                      'What methods of payment does Cemex accept?',
                    ),
                    Divider(),buildQuestion(
                      'What methods of payment does Cemex accept?',
                    ),
                    Divider(), buildQuestion(
                      'What methods of payment does Cemex accept?',
                    ),
                  ],
                )),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuestion(String question) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
              child: Text(
            question,
            style: TextStyle(fontSize: 18),
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }

  Widget buildTab(String title, int index) {
    final isCurrent = currentTap==index;
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
          setState(() {
            currentTap=index;
          });
        },
        child: Ink(
          width: 90,
          height: 40,
          decoration: BoxDecoration(
              gradient: isCurrent
                  ? LinearGradient(
                      colors: [Color(0xFFFF7D7D), Color(0xFFFE4747)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              border: isCurrent ? null : Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isCurrent ? Colors.white : Colors.black54),
          )),
        ),
      );
  }
}
