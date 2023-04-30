import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/Screens/catalog-screen.dart';
import 'package:travel/helper/constants.dart' as constants;
import 'package:travel/models/travel-model.dart';
import 'package:travel/models/country-model.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SliverAppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   expandedHeight: 200,
      //   flexibleSpace: const FlexibleSpaceBar(
      //     title: Text(
      //       constants.welcomeTitleText,
      //       style: TextStyle(
      //         color: Colors.black87,
      //         fontSize: 28,
      //         fontWeight: FontWeight.w700,
      //       ),
      //     ),
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                constants.welcomeTitleText,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
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
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: CountryData.countries.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            print('tapped $index');
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
          ),
        ],
      ),
    );
  }
}

Widget countryCardWidget(int index) {
  return Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(100),
        topRight: Radius.circular(100),
      ),
    ),
    elevation: 0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
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
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            CountryData.countries[index].name,
            style: GoogleFonts.neucha(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 30),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/catalog',
                  arguments: TravelModels.list[index].title);
            },
            child: CategoryWidget(title: TravelModels.list[index].title),
          );
        },
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
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
              left: 40.0, right: 10.0, top: 10, bottom: 30),
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
