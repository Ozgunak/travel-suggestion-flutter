import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/helper/constants.dart' as constants;

class CataglogCategory {
  final String title;
  final IconData icon;

  CataglogCategory({
    required this.title,
    required this.icon,
  });
}

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  int selectedIndex = 0;
  List<CataglogCategory> categories = [
    CataglogCategory(
      title: 'Quiet place',
      icon: Icons.home,
    ),
    CataglogCategory(
      title: 'Romantic trip',
      icon: Icons.favorite,
    ),
    CataglogCategory(
      title: 'Adventure trip',
      icon: Icons.directions_bike,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: CatalogAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quiet place',
              style: GoogleFonts.neucha(
                fontSize: 58,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: index == selectedIndex
                            ? const Color(0xFFA6CDC3)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
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
                                categories[index].icon,
                                color: index == selectedIndex
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                categories[index].title,
                                style: GoogleFonts.neucha(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: index == selectedIndex
                                      ? Colors.white
                                      : Colors.black87,
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
            ),
          ],
        ),
      ),
    );
  }
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
