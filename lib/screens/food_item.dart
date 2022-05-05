import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({Key? key}) : super(key: key);

  static const String title = 'SINIGANG NA BAKA';

  static const String description =
      "Sinigang na Baka is a tamarind-flavored soup made with beef ribs, "
      "kangkong, radish and gabi.\n\nIn this final step, arrange all of the "
      "elements in a ListView, rather than a Column, because a ListView "
      "supports app body scrolling when the app is run on a small device.";

  @override
  Widget build(BuildContext context) {
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
      ],
    );

    var titleText = const Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    var descriptionText = SizedBox(
      height: 175,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                description,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    var reviewText = Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          const Text(
            '502M reviews',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              fontSize: 20.0,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );

    var iconList = Container(
      padding: const EdgeInsets.all(10),
      child: DefaultTextStyle.merge(
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          height: 1.5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                Icon(
                  Icons.kitchen,
                  color: Colors.green,
                ),
                Text('PREP:'),
                Text('25 min'),
              ],
            ),
            Column(
              children: const [
                Icon(
                  Icons.timer,
                  color: Colors.green,
                ),
                Text('COOK:'),
                Text('1 hr'),
              ],
            ),
            Column(
              children: const [
                Icon(
                  Icons.restaurant,
                  color: Colors.green,
                ),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    var foodImage = Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      width: 250,
      height: 250,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ImageScreen(title: title,);
              },
            ),
          );
        },
        child: Hero(
          tag: 'imageHero',
          child: Image.asset(
            'assets/images/bakasinigang4a-1-500x500.jpg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          titleText,
          reviewText,
          iconList,
          foodImage,
          descriptionText,
        ],
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  final String title;
  const ImageScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'imageHero',
                child: Image.asset(
                  'assets/images/bakasinigang4a-1-500x500.jpg',
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  height: 2,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
