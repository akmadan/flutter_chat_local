import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/utils/colors.dart';
import 'package:flutter_chat_ui/utils/constants.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Chat Messages'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
                    width: double.infinity,
                    // color: Colors.red,
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: messages[index]['uid'] == 1234
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              messages[index]['uid'] == 1234
                                  ? giveTime(messages[index]['time'])
                                  : Container(),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(
                                            messages[index]['uid'] == 1234
                                                ? 0
                                                : 20),
                                        topLeft: Radius.circular(
                                            messages[index]['uid'] == 1234
                                                ? 20
                                                : 0)),
                                    color: messages[index]['uid'] == 1234
                                        ? Colors.grey.shade800
                                        : Colors.grey.shade900
                                            .withOpacity(0.8)),
                                constraints:
                                    BoxConstraints(maxWidth: w * 2.3 / 3),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 14),
                                child: Text(messages[index]['text']),
                              ),
                              messages[index]['uid'] != 1234
                                  ? giveTime(messages[index]['time'])
                                  : Container(),
                            ],
                          ),
                        );
                      },
                    ))),

            /////////// ENTER TEXT MESSAGE TEXT FIELD ////////////
            Container(
              height: 80,
              // color: Colors.green,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter a Message',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send,
                        size: 30,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget giveTime(DateTime dateTime) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          DateFormat('kk:mm').format(dateTime),
          style: TextStyle(
              color: Colors.grey.shade600, fontStyle: FontStyle.italic),
        ));
  }
}
