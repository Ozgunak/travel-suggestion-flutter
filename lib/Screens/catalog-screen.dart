import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/helper/constants.dart' as constants;
import 'package:travel/models/catalog-model.dart';
import 'package:travel/models/country-model.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  int selectedIndex = 0;

  void onSelectedIndexChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: CatalogAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              constants.catalogTitle,
              style: GoogleFonts.neucha(
                fontSize: 58,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            categoryWidget(),
            const SizedBox(height: 20),
            // countryWidget(),
            GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              shrinkWrap: true,
              itemCount: CountryData.countries.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                  ),
                  elevation: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                          child: Image.asset(
                            CountryData.countries[index].imagePath,
                            fit: BoxFit.cover,
                            // height: 250,
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
              },
            )
          ],
        ),
      ),
    );
  }

  Widget categoryWidget() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CatalogData.categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: index == selectedIndex
                    ? Colors.white
                    : const Color(0xFFA6CDC3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: OutlinedButton(
                onPressed: () {
                  onSelectedIndexChange(index);
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        CatalogData.categories[index].icon,
                        color: index == selectedIndex
                            ? Colors.black87
                            : Colors.white,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        CatalogData.categories[index].title,
                        style: GoogleFonts.neucha(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: index == selectedIndex
                              ? Colors.black87
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget countryWidget() {
  return SizedBox(
    height: 300,
    child: ListView.builder(
        itemCount: CountryData.countries.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
              ),
            ),
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    child: Image.asset(
                      CountryData.countries[index].imagePath,
                      fit: BoxFit.cover,
                      // height: 250,
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
        }),
  );
}

class CatalogAppBar extends StatelessWidget {
  const CatalogAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black87,
        ),
      ),
      //  action profile image
      actions: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://png.pngtree.com/png-vector/20220709/ourmid/pngtree-businessman-user-avatar-wearing-suit-with-red-tie-png-image_5809521.png'),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
