import 'package:flutter/material.dart';

void main() {
  runApp(const StudyQuestApp());
}

class StudyQuestApp extends StatelessWidget {
  const StudyQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyQuest',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int xp = 0;
  int level = 1;
  int sessions = 0;
  int studyMinutes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StudyQuest')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Level $level', style: TextStyle(fontSize: 32)),
            const SizedBox(height: 10),
            Text('XP: $xp / 100', style: const TextStyle(fontSize: 20)),

            LinearProgressIndicator(value: xp / 100),
            const SizedBox(height: 30),
            const Text("Today's Study", style: TextStyle(fontSize: 24)),
            Text('$studyMinutes min', style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  xp += 10;
                  sessions += 1;

                  if (xp >= 100) {
                    xp = 0;
                    level += 1;
                    studyMinutes += 5;
                  }
                });
              },
              child: const Text('Start Study'),
            ),
            const SizedBox(height: 30),

            Text(
              'Study Sessions: $sessions',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            const Text('Current Streak', style: TextStyle(fontSize: 20)),
            const Text('0 Days', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
