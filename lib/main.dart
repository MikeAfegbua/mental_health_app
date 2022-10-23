import 'package:flutter/material.dart';
import 'green_face.dart';
import 'blue_face.dart';
import 'yellow_face.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> answer = ['Not good!', 'Fine!', 'Awesome!'];
  List<Color> col = [
    const Color(0xFF5BF0A0),
    Colors.blue.shade200,
    const Color(0xFFFFD751)
  ];
  List<Widget> faces = [
    const Green(),
    const Blue(),
    const Yellow(),
  ];

  var val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: col[val],
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                'How was your day?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                answer[val],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),

              faces[val], //fyftydrjdtrsjtrsjrdrdtdtkrfgh
              const SizedBox(
                height: 50,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white,
                  trackHeight: 15,
                  thumbColor: col[val],
                  overlayColor: const Color(0x29EB1555),
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: val.toDouble(),
                  min: 0,
                  max: 2,
                  divisions: 2,
                  label: answer[val],
                  onChanged: (double newVal) {
                    setState(() {
                      val = newVal.round();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
