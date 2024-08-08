import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<int> selectedAnswers = List.generate(20, (index) => -1);
  int yesCount = 0;

  // List of questions
  List<String> questions = [
    "I generally feel down and unhappy.",
    "I have less interest in other people than I used to.",
    "It takes a lot of effort to get myself to start working on something new.",
    "I don't get as much satisfaction out of things as I used to.",
    "I have headaches, back pain, or other pains for no apparent reason.",
    "I easily get impatient, frustrated, or angry with people.",
    "I feel lonely, and that people aren't that interested in me.",
    "I feel like I have nothing to look forward to.",
    "I have episodes of crying that are hard to stop.",
    "I have trouble getting to sleep or I sleep in too late.",
    "I feel like my life has generally been a failure or a disappointment.",
    "I have trouble staying focused on what I'm supposed to be doing.",
    "I blame myself for my faults and mistakes.",
    "I feel like I've slowed down; sometimes it feels like I don't have the energy to get anything done.",
    "I have trouble finishing books, movies, or TV shows.",
    "I put off making decisions more often than I used to.",
    "When I feel down, friends and family can't cheer me up.",
    "I think about death, or about people being better off without me.",
    "My appetite has changed; I'm eating much less (or much more) than is normal for me and it's affecting my weight.",
    "I have less interest in sex than I used to."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Depression Test'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            questions[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var i = 0; i < 3; i++)
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedAnswers[index] = i;
                                      // Update yesCount based on selection
                                      if (i == 0) {
                                        yesCount++;
                                      } else if (selectedAnswers[index] == 0) {
                                        yesCount--;
                                      }
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                        return null;
                                      },
                                    ),
                                    foregroundColor: MaterialStateProperty
                                        .resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                        return Colors.black;
                                      },
                                    ),
                                    side: MaterialStateProperty.resolveWith<
                                        BorderSide?>(
                                      (Set<MaterialState> states) {
                                        return BorderSide(
                                          color: selectedAnswers[index] == i
                                              ? Colors.green
                                              : Colors.black,
                                        );
                                      },
                                    ),
                                  ),
                                  child: Text(
                                    i == 0
                                        ? 'Yes'
                                        : (i == 1 ? 'Neutral' : 'No'),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    String result = '';
                    if (yesCount >= 7 && yesCount < 10)
                      result = 'Seasonal Affective Disorder';
                    else if (yesCount >= 10 && yesCount < 13)
                      result = 'Perinatal Depression';
                    else if (yesCount >= 13 && yesCount < 17)
                      result = 'Persistent Depressive Disorder (Dysthymia)';
                    else if (yesCount >= 17)
                      result = 'Major Depressive Disorder';

                    return AlertDialog(
                      title: Text('Test Result'),
                      content: Text(result),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TestPage(),
  ));
}
