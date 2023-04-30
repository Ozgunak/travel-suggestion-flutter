import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/models/country-model.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key, required this.selectedCountry})
      : super(key: key);

  static const routeName = '/detail';

  final CountryModel selectedCountry;

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String selectedHotelCategory = 'All';
  String selectedAttractionCategory = 'All';
  String selectedActivityCategory = 'All';
  late CountryModel selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.selectedCountry;
  }

  @override
  Widget build(BuildContext context) {
    // CountryModel selectedCountry = widget.selectedCountry;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double topPadding = MediaQuery.of(context).padding.top;
              double percentage =
                  (constraints.maxHeight - topPadding - kToolbarHeight) /
                      (300 - topPadding - kToolbarHeight);
              double opacity = (1 - percentage).clamp(0, 1);

              return FlexibleSpaceBar(
                title: AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    selectedCountry.name,
                    style: GoogleFonts.neucha(color: Colors.black),
                  ),
                ),
                background: Hero(
                  tag: selectedCountry.name,
                  child: Image.asset(
                    selectedCountry.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionTitle('Attractions'),
                    filterChips(
                        selectedCountry.attractions, selectedAttractionCategory,
                        (value) {
                      setState(() {
                        selectedAttractionCategory = value;
                      });
                    }),
                    SizedBox(height: 8),
                    ...buildAttractionList(),
                    SizedBox(height: 8),
                    sectionTitle('Hotels'),
                    filterChips(selectedCountry.hotels, selectedHotelCategory,
                        (value) {
                      setState(() {
                        selectedHotelCategory = value;
                      });
                    }),
                    SizedBox(height: 8),
                    ...buildHotelList(),
                    SizedBox(height: 8),
                    sectionTitle('Activities'),
                    filterChips(
                        selectedCountry.activities, selectedActivityCategory,
                        (value) {
                      setState(() {
                        selectedActivityCategory = value;
                      });
                    }),
                    SizedBox(height: 8),
                    ...buildActivityList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Text sectionTitle(String title) =>
      Text(title, style: TextStyle(fontSize: 24));

  SingleChildScrollView filterChips(Map<String, List<String>> categories,
      String selectedCategory, Function(String) onSelected) {
    int totalCount =
        categories.values.fold(0, (count, items) => count + items.length);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChip(
            label: Text('All ($totalCount)'),
            selected: selectedCategory == 'All',
            onSelected: (_) => onSelected('All'),
          ),
          ...categories.entries
              .map(
                (entry) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FilterChip(
                    label: Text('${entry.key} (${entry.value.length})'),
                    selected: selectedCategory == entry.key,
                    onSelected: (_) => onSelected(entry.key),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  List<Widget> buildAttractionList() => buildFilteredList(
      selectedCountry.attractions, selectedAttractionCategory);

  List<Widget> buildHotelList() =>
      buildFilteredList(selectedCountry.hotels, selectedHotelCategory);

  List<Widget> buildActivityList() =>
      buildFilteredList(selectedCountry.activities, selectedActivityCategory);

  List<Widget> buildFilteredList(
      Map<String, List<String>> items, String selectedCategory) {
    List<String> filteredItems;

    if (selectedCategory == 'All') {
      filteredItems = items.values.expand((e) => e).toList();
    } else {
      filteredItems = items[selectedCategory]!;
    }

    return filteredItems.map((item) => ListTile(title: Text(item))).toList();
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
    );
  }
}
