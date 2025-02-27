import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFirstImage = true;

  void toggleImage() {
    setState(() {
      isFirstImage = !isFirstImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Lab 3")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack қолдану: фон сурет + қараңғы контейнер + мәтін
            Stack(
              children: [
                Image.asset(
                  'assets/image1.jpg',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.black.withOpacity(0.5), // Қараңғылау
                ),
                Positioned(
                  top: 100,
                  left: 50,
                  child: Text(
                    "Welcome to Flutter",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // BoxFit эксперименті
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Image.asset(
                'assets/image1.jpg',
                fit: BoxFit.cover, // Мұнда әртүрлі BoxFit мәндерін тексеруге болады
              ),
            ),

            SizedBox(height: 20),

            // ElevatedButton (SnackBar көрсету)
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Hello, this is a SnackBar!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(200, 50),
              ),
              child: Text("Show SnackBar", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),

            SizedBox(height: 20),

            // TextButton (Екінші экранға өту)
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              style: TextButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
              child: Text("Go to Second Screen", style: TextStyle(fontSize: 16, color: Colors.green)),
            ),

            SizedBox(height: 20),

            // Кескінді ауыстыратын OutlinedButton
            Image.asset(
              isFirstImage ? 'assets/image1.jpg' : 'assets/image2.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 20),

            OutlinedButton(
              onPressed: toggleImage,
              style: OutlinedButton.styleFrom(
                minimumSize: Size(200, 50),
                side: BorderSide(color: Colors.black),
              ),
              child: Text("Toggle Image", style: TextStyle(fontSize: 16, color: Colors.black)),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Екінші экран
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: Text(
          "Welcome to the Second Screen!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
