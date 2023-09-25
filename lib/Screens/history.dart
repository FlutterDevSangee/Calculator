import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  List<Map<String, String>> history;

  HistoryPage({super.key, required this.history});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // backgroundColor: Color(0xFF282828),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
              itemCount: widget.history.length,
              itemBuilder: (BuildContext context, int i) {
                String input = widget.history[i]['input']!;
                String output = widget.history[i]['output']!;
                return ListTile(
                  title: Text(
                    '$input = $output',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            color: Color(0xFF202020),
            child: Center(
              child: Container(
                width: 200,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
