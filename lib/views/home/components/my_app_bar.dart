import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: size.width,
        height: size.height / 3.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
            image: const AssetImage("assets/1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text(
                  "What would you like\n to find?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(225, 228, 228, 228),
                      contentPadding: const EdgeInsets.only(top: 5),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Color.fromARGB(225, 146, 146, 146),
                      ),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(225, 131, 131, 131),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
