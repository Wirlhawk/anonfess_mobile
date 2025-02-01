import 'package:anonfess_mobile/models/message.dart';
import 'package:anonfess_mobile/services/message_service.dart';
import 'package:anonfess_mobile/style/style.dart';
import 'package:anonfess_mobile/views/components/neu_button.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagePage extends StatelessWidget {
  final String id;
  MessagePage({super.key, required this.id});

  //get message berdasarkan id
  final MessageService _messageService = MessageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Message",
          style: GoogleFonts.lexend(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Style.border),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder(
        future: _messageService.getMessage(id),
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // Error
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // Empty Message
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No messages found."));
          }

          final data = snapshot.data;
          final Message message = Message(
            id: data['id'],
            userId: data['user_id'],
            message: data['message'],
            from: data['from'],
            to: data['to'],
            music: data['music'],
            // createdAt: data['created_at'],
          );

          debugPrint(message.toString());

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                spacing: 25,
                children: [
                  const DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 5.0,
                    dashLength: 25.0,
                    dashColor: Colors.black,
                    dashRadius: 5.0,
                    dashGapLength: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "06:14 AM",
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Style.muted,
                        ),
                      ),
                      Text(
                        "01/02/2015",
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Style.muted,
                        ),
                      ),
                    ],
                  ),
                  _buildMessageList(message),
                  const SizedBox(),
                  const DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 5.0,
                    dashLength: 25.0,
                    dashColor: Colors.black,
                    dashRadius: 5.0,
                    dashGapLength: 10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMessageList(message) {
    return Column(
      spacing: 18,
      children: [
        if (message.from != '') _buildMessageItem("From", message.from),
        if (message.to != '') _buildMessageItem("To", message.to),
        _buildMessageItem("Message", message.message),
        if (message.music != '') _buildMessageItem("Music", message.music),
      ],
    );
  }

  Widget _buildMessageItem(String label, messageItem) {
    return Column(
      spacing: 7,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.lexend(
            fontWeight: FontWeight.bold,
            color: Style.primary,
            fontSize: 25,
          ),
        ),
        NeuButton(
          label: messageItem,
          padding: 15,
          alignment: Alignment.topLeft,
        ),
      ],
    );
  }
}
