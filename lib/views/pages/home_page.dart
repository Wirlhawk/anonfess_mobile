import 'package:anonfess_mobile/services/message_service.dart';
import 'package:anonfess_mobile/style/style.dart';
import 'package:anonfess_mobile/views/components/message_card.dart';
import 'package:anonfess_mobile/views/components/neu_button.dart';
import 'package:anonfess_mobile/views/pages/message_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "AnonFess",
            style: GoogleFonts.lexend(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NeuButton(label: "Share Link", padding: 15),
              const SizedBox(height: 25),
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
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    "Inbox",
                    style: GoogleFonts.lexend(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Style.primary,
                      border: Border.all(
                        color: Style.border,
                        width: 3,
                      ),
                    ),
                    child: Text(
                      "9+",
                      style: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildMessageGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageGrid(BuildContext context) {
    final MessageService messageService = MessageService();
    double itemWidth = (MediaQuery.of(context).size.width / 2) - 50;
    return FutureBuilder(
      future: messageService.getAllMessage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No messages found."));
        }

        final messages = snapshot.data!;
        debugPrint(messages.toString());

        return Wrap(
          spacing: 25,
          runSpacing: 25,
          children: List.generate(messages.length, (index) {
            final message = messages[index];
            return SizedBox(
              width: itemWidth,
              child: AspectRatio(
                aspectRatio: 1,
                child: MessageCard(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MessagePage(
                              id: message['id'],
                            )));
                  },
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
