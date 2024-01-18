import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> arr = [];

  void method() {
    for (int i = 1; i <= 10; i++) {
      arr.add(i.toString()); // Add the correct number to the list
    }
  }

  @override
  void initState() {
    super.initState();
    method();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 189, 128),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 800, // Set a fixed height for the Container
              width: 500,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container_(
                            color_: Colors.blue,
                            number: arr[index * 2], // Pass the correct number
                          ),
                          Container_(
                            color_: Colors.blue,
                            number:
                                arr[index * 2 + 1], // Pass the correct number
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Container_ extends StatefulWidget {
  Color color_;
  String number;
  Container_({required this.color_, required this.number});

  @override
  State<Container_> createState() => _Container_State();
}

class _Container_State extends State<Container_> {
  int _numberOfDouble = 0;

  void _decrementDouble() {
    setState(() {
      if (_numberOfDouble > 0) {
        _numberOfDouble--;
      }
    });
  }

  void _incrementDouble() {
    setState(() {
      if (_numberOfDouble > 4) {
        // Do nothing when _numberOfDouble is greater than 4
      } else {
        _numberOfDouble++;
      }
      // Check if the increment hits 4 and change the color to red
      widget.color_ = _numberOfDouble == 4 ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: Colors.white70,
            width: 1.5,
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 240, 231, 131), Colors.white],
            stops: [0.3, 1.0], // Adjust the stops as needed
          ),
          // color: widget.color_,
        ),
        height: 100,
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.number,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _decrementDouble,
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  _numberOfDouble.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                  onPressed: _incrementDouble,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
