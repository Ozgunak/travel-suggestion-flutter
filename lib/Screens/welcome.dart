import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/Screens/catalog-screen.dart';
import 'package:travel/helper/constants.dart' as constants;
import 'package:travel/models/country-model.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  constants.welcomeTitleText,
                  style: GoogleFonts.neucha(color: Colors.black, fontSize: 38),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(constants.welcomeImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: CountryData.countries.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CatalogScreen.routeName,
                            arguments: CountryData.countries[index],
                          );
                        },
                        child: countryCardWidget(index));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget countryCardWidget(int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(100),
        topRight: Radius.circular(100),
      ),
      child: Hero(
        tag: CountryData.countries[index].name,
        child: Image.asset(
          CountryData.countries[index].imagePath,
          fit: BoxFit.cover,
          // height: 250,
        ),
      ),
    ),
  );
}
