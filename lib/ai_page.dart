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
  List<dynamic> _messages = [];
  List<String> _aiResponses = [
    'How can I help you?',
    ' Of course, I\'d be glad to help. Can you describe the symptoms you\'re experiencing? Also, if you have any reports or images of the affected area, those would be really helpful.',
    ' Thank you for sharing that. The symptoms you\'re describing sound like they could be consistent with Pemphigus, but it\'s important to consider all possibilities. Could you upload an image of the affected area? This will help me give you a more informed suggestion',
    ' Based on the image and the symptoms you\'ve described, it does seem like Pemphigus could be a possibility. HS is a chronic skin condition characterized by the symptoms you\'ve mentioned. However, diagnosing skin conditions accurately through this medium can be challenging, and it\'s crucial to consult a dermatologist for a definitive diagnosis.'
        'As for remedies, treatments for Pemphigus can vary based on the severity of the condition but often include medications to reduce inflammation, pain management, and sometimes surgical options for more severe cases. Antibiotics can help manage infections and anti-inflammatory medications may reduce swelling and pain.',
    'Kovai Medical Center and Hospital (KMCH): They have a dedicated dermatology department that deals with a wide range of skin conditions, including complex ones like Hidradenitis Suppurativa.'
        'Thank you for sharing the image. Based on what I can see, your skin appears to be clear and I can\'t identify any obvious signs of the conditions we discussed.'
        ' Based on the image and the symptoms you\'ve described, it does seem likePemphigus could be a possibility. Pemphigus is a chronic skin condition characterized by the symptoms you\'ve mentioned. However, diagnosing skin conditions accurately through this medium can be challenging, and it\'s crucial to consult a dermatologist for a definitive diagnosis.'
  ];
  int _currentAiResponseIndex = 0;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Chat'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index] is String
                    ? _buildTextMessage(_messages[index], index)
                    : _buildImageMessage(_messages[index]);
              },
            ),
          ),
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
                  onPressed: _openCamera,
                ),
                IconButton(
                  icon: Icon(Icons.add_photo_alternate),
                  onPressed: _openGallery,
                ),
                ElevatedButton(
                  onPressed: _messageController.text.isEmpty
                      ? null
                      : () async {
                          String message = _messageController.text;
                          _messageController.clear();
                          _messages.add(message); // Add user's message
                          setState(() {});
                          await Future.delayed(Duration(seconds: 1));
                          if (_currentAiResponseIndex < _aiResponses.length) {
                            _messages.add(_aiResponses[
                                _currentAiResponseIndex]); // Add AI response
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
    );
  }

  Widget _buildTextMessage(String text, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment: _isMessageFromUser(index)
            ? MainAxisAlignment.end // Align user messages to the right
            : MainAxisAlignment.start, // Align AI responses to the left
        children: [
          if (!_isMessageFromUser(index))
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.network(
                'https://img.freepik.com/free-vector/ai-technology-robot-cyborg-illustrations_24640-134419.jpg',
                width: 24, // Adjust the size as needed
                height: 24,
              ),
            ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: _isMessageFromUser(index)
                    ? LinearGradient(
                        colors: [
                          Colors.blue[200]!,
                          Colors.blue[100]!,
                        ],
                      )
                    : LinearGradient(
                        colors: [
                          Colors.pink[200]!,
                          Colors.pink[100]!,
                        ],
                      ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color:
                      _isMessageFromUser(index) ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
          if (_isMessageFromUser(index))
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.network(
                'https://img.freepik.com/premium-vector/young-man-face-avater-vector-illustration-design_968209-13.jpg',
                width: 24, // Adjust the size as needed
                height: 24,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImageMessage(dynamic image) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Align to right side
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.memory(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  void _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // Send the image to AI for analysis
      String aiResponse = await analyzeImage(File(pickedFile.path));
      // Add user's image and AI response to the messages list
      setState(() {
        _messages.add(File(pickedFile.path).readAsBytesSync());
        _messages.add(aiResponse);
      });
    }
  }

  void _openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Send the image to AI for analysis
      String aiResponse = await analyzeImage(File(pickedFile.path));
      // Add user's image and AI response to the messages list
      setState(() {
        _messages.add(File(pickedFile.path).readAsBytesSync());
        _messages.add(aiResponse);
      });
    }
  }

  bool _isMessageFromUser(int index) {
    return index % 2 == 0; // User messages are at even indices
  }

  Future<String> analyzeImage(File imageFile) {
    // Implement AI analysis logic here
    // For now, returning a specific response for images
    return Future.delayed(Duration(seconds: 2), () {
      return "This looks like a skin disease. Would you like me to find the nearest dermatologist for you?";
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: AiPage(),
  ));
}
