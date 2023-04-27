import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/helper/constants.dart';

class TravelModel {
  String title;

  TravelModel({required this.title});
}

class TravelModels {
  static List<TravelModel> list = [
    TravelModel(title: 'Quiet place'),
    TravelModel(title: 'Romantic trip'),
    TravelModel(title: 'Adventure trip'),
  ];
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA6CDC3),
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Constants.welcomeImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(context, route);
            },
            child: Container(
              height: 250,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 30),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CategoryWidget(title: TravelModels.list[index].title);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        width: 200,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 40.0, right: 10.0, top: 20, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.neucha(
                  fontSize: 38,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.start,
              ),
              const Icon(Icons.arrow_downward),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.flag),
                  Icon(Icons.flag),
                  Icon(Icons.flag),
                  Icon(Icons.flag),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
