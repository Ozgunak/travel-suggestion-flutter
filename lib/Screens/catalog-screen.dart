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
  List<bool> expandedStatus = List.filled(3, false);

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.selectedCountry;
  }

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 8),
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
                    const SizedBox(height: 8),
                    ...buildAttractionList(),
                    const SizedBox(height: 8),
                    sectionTitle('Hotels'),
                    filterChips(selectedCountry.hotels, selectedHotelCategory,
                        (value) {
                      setState(() {
                        selectedHotelCategory = value;
                      });
                    }),
                    const SizedBox(height: 8),
                    ...buildHotelList(),
                    const SizedBox(height: 8),
                    sectionTitle('Activities'),
                    filterChips(
                        selectedCountry.activities, selectedActivityCategory,
                        (value) {
                      setState(() {
                        selectedActivityCategory = value;
                      });
                    }),
                    const SizedBox(height: 8),
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

  void onExpansionChanged(int index, bool isExpanded) {
    setState(() {
      for (int i = 0; i < expandedStatus.length; i++) {
        expandedStatus[i] = (i == index) ? isExpanded : !isExpanded;
      }

      switch (index) {
        case 0:
          selectedAttractionCategory = isExpanded ? '' : 'All';
          break;
        case 1:
          selectedHotelCategory = isExpanded ? '' : 'All';
          break;
        case 2:
          selectedActivityCategory = isExpanded ? '' : 'All';
          break;
      }
    });
  }

  Text sectionTitle(String title) =>
      Text(title, style: const TextStyle(fontSize: 24));

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

    return filteredItems
        .map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 4.0, top: 2, bottom: 2),
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
        .toList();
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
    );
  }
}
