import 'package:flutter/material.dart';
import 'package:aibro_client/services/chat_service.dart';
import 'package:aibro_client/models/message.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final List<Message> messages = [];
  final TextEditingController _controller = TextEditingController();
  late ChatService _chatService;

  @override
  void initState() {
    print("Initializing chat screen");

    super.initState();
    _chatService = ChatService();

    // receive message from server
    _chatService.chatStream().listen((response) {
      setState(() {
        messages.add(Message(
          userId: 'server',
          message: response.message,
        ));
      });
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      final message = _controller.text;

      _chatService.sendMessage('userId', message);
      setState(() {
        messages.add(Message(
          userId: 'user1',
          message: message,
        ));
      });
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _chatService.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(
                    message.message,
                    style: TextStyle(
                      color: message.userId == 'user1'
                          ? Colors.indigo
                          : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(labelText: 'Enter a message'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
