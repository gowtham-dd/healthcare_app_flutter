import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AiPage extends StatefulWidget {
  const AiPage({Key? key}) : super(key: key);

  @override
  State<AiPage> createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];
  List<String> _aiResponses = [
    'How can I help you?',
    'Please describe your symptoms.',
    'It seems like a skin allergy. Can you send some more details of it?'
  ];
  int _currentAiResponseIndex = 0;
  File? _pickedImage;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _messages.clear(); // Clear messages when leaving the page
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('AI Chat'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  if (_isMessageFromUser(index)) {
                    // User message
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue[200]!,
                                    Colors.blue[100]!,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _messages[index],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // AI message
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.pink[200]!,
                                  Colors.pink[100]!,
                                ],
                              ),
                            ),
                            child: Image.network(
                              'https://static.vecteezy.com/system/resources/previews/022/976/585/original/chat-bot-icon-with-artificial-intelligence-illustration-of-a-cute-robot-in-flat-style-on-a-blue-background-vector.jpg', // Replace with your bot image URL
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.pink[200]!,
                                    Colors.pink[100]!,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: _messages[index].startsWith('http')
                                  ? Image.network(_messages[index])
                                  : Text(
                                      _messages[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              _pickedImage != null ? _buildImageMessage() : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {
                        _openCamera();
                      },
                    ),
                    ElevatedButton(
                      onPressed: _messageController.text.isEmpty
                          ? null
                          : () async {
                              String message = _messageController.text;
                              _messageController.clear();
                              _messages.add(message); // Add user's message
                              setState(() {});
                              await Future.delayed(Duration(seconds: 3));
                              if (_currentAiResponseIndex < _aiResponses.length) {
                                _messages.add(_aiResponses[_currentAiResponseIndex]); // Add AI response
                                _currentAiResponseIndex++;
                              }
                              setState(() {});
                            },
                      child: Text('Send'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  bool _isMessageFromUser(int index) {
    return index % 2 == 0; // User messages are at even indices
  }

  Widget _buildImageMessage() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.pink[200]!,
                  Colors.pink[100]!,
                ],
              ),
            ),
            child: Image.file(
              _pickedImage!,
              width: 40,
              height: 40,
            ),
          ),
          SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink[200]!,
                    Colors.pink[100]!,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Photo from camera',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AiPage(),
  ));
}
