class CountryModel {
  final int id;
  final String name;
  final String imagePath;
  final Map<String, List<String>> hotels;
  final Map<String, List<String>> attractions;
  final Map<String, List<String>> activities;

  CountryModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.hotels,
    required this.attractions,
    required this.activities,
  });
}

class CountryData {
  static List<CountryModel> countries = [
// Turkey:
// Attractions:
// Historical Sites: Hagia Sophia, Topkapi Palace, Ephesus, Blue Mosque
// Natural Wonders: Cappadocia, Pamukkale
// Shopping & Culture: Grand Bazaar
// Hotels:
// Luxury: Four Seasons Hotel Istanbul at Sultanahmet, Raffles Istanbul
// Boutique: The Cappadocia Hotel
// Beach Resort: D-Resort Göcek
// Activities:
// Adventure: Hot air balloon rides in Cappadocia
// Cultural: Visiting ancient ruins in Ephesus, enjoying traditional Turkish baths (Hamams)
// Leisure: Exploring the beaches and resorts of Antalya
// Food & Drink: Sampling delicious Turkish cuisine

    CountryModel(
        id: 0,
        name: 'Turkey',
        imagePath: 'assets/images/ic_tur.jpeg',
        hotels: {
          'Luxury': [
            'Four Seasons Hotel Istanbul at Sultanahmet',
            'Raffles Istanbul',
          ],
          'Boutique': [
            'The Cappadocia Hotel',
          ],
          'Beach Resort': [
            'D-Resort Göcek',
          ],
        },
        attractions: {
          'Historical Sites': [
            'Hagia Sophia',
            'Topkapi Palace',
            'Ephesus',
            'Blue Mosque',
          ],
          'Natural Wonders': [
            'Cappadocia',
            'Pamukkale',
          ],
          'Shopping & Culture': [
            'Grand Bazaar',
          ],
        },
        activities: {
          'Adventure': [
            'Hot air balloon rides in Cappadocia',
          ],
          'Cultural': [
            'Visiting ancient ruins in Ephesus',
            'Enjoying traditional Turkish baths (Hamams)',
          ],
          'Leisure': [
            'Exploring the beaches and resorts of Antalya',
          ],
          'Food & Drink': [
            'Sampling delicious Turkish cuisine',
          ],
        }),
// Spain:
// Attractions:
//
// Architectural: La Sagrada Familia, Park Güell, The Alhambra
// Museums: The Prado Museum, Guggenheim Museum Bilbao
// City Squares & Streets: Plaza Mayor, Madrid, La Rambla, Barcelona
// Hotels:
//
// Luxury: Hotel Alfonso XIII, Seville, Mandarin Oriental, Barcelona, Hotel Ritz, Madrid
// Historic: Gran Hotel Miramar, Malaga
// Activities:
//
// Entertainment: Attending a flamenco show
// Food & Drink: Wine tasting and vineyard tours, exploring Spanish cuisine through tapas
// Cultural: Visiting historic sites, such as the Alhambra
// Leisure: Enjoying the beaches and nightlife of Ibiza

    CountryModel(
        id: 1,
        name: 'Spain',
        imagePath: 'assets/images/ic_spa.png',
        hotels: {
          'Luxury': [
            'Hotel Alfonso XIII, Seville',
            'Mandarin Oriental, Barcelona',
            'Hotel Ritz, Madrid',
          ],
          'Historic': [
            'Gran Hotel Miramar, Malaga',
          ],
        },
        attractions: {
          'Architectural': [
            'La Sagrada Familia',
            'Park Güell',
            'The Alhambra',
          ],
          'Museums': [
            'The Prado Museum',
            'Guggenheim Museum Bilbao',
          ],
          'City Squares & Streets': [
            'Plaza Mayor, Madrid',
            'La Rambla, Barcelona',
          ],
        },
        activities: {
          'Entertainment': [
            'Attending a flamenco show',
          ],
          'Food & Drink': [
            'Wine tasting and vineyard tours',
            'Exploring Spanish cuisine through tapas',
          ],
          'Cultural': [
            'Visiting historic sites, such as the Alhambra',
          ],
          'Leisure': [
            'Enjoying the beaches and nightlife of Ibiza',
          ],
        }),
// France:
// Attractions:
//
// Landmarks: Eiffel Tower, Notre-Dame Cathedral, Mont Saint-Michel, Château de Chambord
// Museums & Palaces: Louvre Museum, Palace of Versailles
// Scenic: The French Riviera (Côte d'Azur)
// Hotels:
//
// Luxury: Hôtel Plaza Athénée, Paris, Le Bristol, Paris, Grand-Hôtel du Cap-Ferrat, Saint-Jean-Cap-Ferrat
// Historic: InterContinental Bordeaux Le Grand Hotel
// Activities:
//
// Food & Drink: Wine tasting in Bordeaux, Burgundy, or Champagne regions, sampling French cuisine
// Entertainment: Attending a cabaret show at the Moulin Rouge
// Nature: Visiting the lavender fields of Provence
// Cultural: Exploring the art galleries and museums of Paris
    CountryModel(
        id: 2,
        name: 'France',
        imagePath: 'assets/images/ic_fra.jpeg',
        hotels: {
          'Luxury': [
            'Hôtel Plaza Athénée, Paris',
            'Le Bristol, Paris',
            'Grand-Hôtel du Cap-Ferrat, Saint-Jean-Cap-Ferrat',
          ],
          'Historic': [
            'InterContinental Bordeaux Le Grand Hotel',
          ],
        },
        attractions: {
          'Landmarks': [
            'Eiffel Tower',
            'Notre-Dame Cathedral',
            'Mont Saint-Michel',
            'Château de Chambord',
          ],
          'Museums & Palaces': [
            'Louvre Museum',
            'Palace of Versailles',
          ],
          'Scenic': [
            'The French Riviera (Côte d\'Azur)',
          ],
        },
        activities: {
          'Food & Drink': [
            'Wine tasting in Bordeaux, Burgundy, or Champagne regions',
            'Sampling French cuisine',
          ],
          'Entertainment': [
            'Attending a cabaret show at the Moulin Rouge',
          ],
          'Nature': [
            'Visiting the lavender fields of Provence',
          ],
          'Cultural': [
            'Exploring the art galleries and museums of Paris',
          ],
        }),
// Canada:
// Attractions:
//
// Natural Wonders: Niagara Falls, Banff National Park, Jasper National Park
// City Experiences: CN Tower, Old Quebec City, Parliament Hill
// Cultural Attractions: Royal Ontario Museum, Art Gallery of Ontario
// Hotels:
//
// Luxury: Fairmont Pacific Rim, Vancouver, Ritz-Carlton Montreal
// Boutique: Magnolia Hotel & Spa, Victoria
// Mountain Resorts: Fairmont Banff Springs, Fairmont Chateau Lake Louise
// Activities:
//
// Adventure: Skiing in Whistler, hiking in the Canadian Rockies
// Cultural: Exploring Quebec's historic sites
// Leisure: Discovering Canadian cuisine, visiting wineries in the Okanagan Valley
// Wildlife: Whale watching, polar bear spotting in Churchill
    CountryModel(
        id: 3,
        name: 'Canada',
        imagePath: 'assets/images/ic_can.png',
        hotels: {
          'Luxury': [
            'Fairmont Pacific Rim, Vancouver',
            'Ritz-Carlton Montreal',
          ],
          'Boutique': [
            'Magnolia Hotel & Spa, Victoria',
          ],
          'Mountain Resorts': [
            'Fairmont Banff Springs',
            'Fairmont Chateau Lake Louise',
          ],
        },
        attractions: {
          'Natural Wonders': [
            'Niagara Falls',
            'Banff National Park',
            'Jasper National Park',
          ],
          'City Experiences': [
            'CN Tower',
            'Old Quebec City',
            'Parliament Hill',
          ],
          'Cultural Attractions': [
            'Royal Ontario Museum',
            'Art Gallery of Ontario',
          ],
        },
        activities: {
          'Adventure': [
            'Skiing in Whistler',
            'Hiking in the Canadian Rockies',
          ],
          'Cultural': [
            'Exploring Quebec\'s historic sites',
          ],
          'Leisure': [
            'Discovering Canadian cuisine',
            'Visiting wineries in the Okanagan Valley',
          ],
          'Wildlife': [
            'Whale watching',
            'Polar bear spotting in Churchill',
          ],
        }),
// Australia:
// Attractions:
//
// Natural Wonders: Great Barrier Reef, Uluru, Great Ocean Road
// City Experiences: Sydney Opera House, Bondi Beach, Melbourne's Laneways
// Wildlife Encounters: Kangaroo Island, Daintree Rainforest
// Hotels:
//
// Luxury: Park Hyatt Sydney, Crown Towers Melbourne
// Boutique: The Old Clare Hotel, Sydney, QT Melbourne
// Beach Resorts: Qualia, Hamilton Island, Saffire Freycinet, Tasmania
// Activities:
//
// Adventure: Snorkeling or diving in the Great Barrier Reef, surfing
// Cultural: Learning about Aboriginal culture and history
// Leisure: Visiting Australian wineries, exploring Sydney and Melbourne
// Wildlife: Watching kangaroos, koalas, and other native species
    CountryModel(
        id: 4,
        name: 'Australia',
        imagePath: 'assets/images/ic_aus.jpeg',
        hotels: {
          'Luxury': [
            'Park Hyatt Sydney',
            'Crown Towers Melbourne',
          ],
          'Boutique': [
            'The Old Clare Hotel, Sydney',
            'QT Melbourne',
          ],
          'Beach Resorts': [
            'Qualia, Hamilton Island',
            'Saffire Freycinet, Tasmania',
          ],
        },
        attractions: {
          'Natural Wonders': [
            'Great Barrier Reef',
            'Uluru',
            'Great Ocean Road',
          ],
          'City Experiences': [
            'Sydney Opera House',
            'Bondi Beach',
            'Melbourne\'s Laneways',
          ],
          'Wildlife Encounters': [
            'Kangaroo Island',
            'Daintree Rainforest',
          ],
        },
        activities: {
          'Adventure': [
            'Snorkeling or diving in the Great Barrier Reef',
            'Surfing',
          ],
          'Cultural': [
            'Learning about Aboriginal culture and history',
          ],
          'Leisure': [
            'Visiting Australian wineries',
            'Exploring Sydney and Melbourne',
          ],
          'Wildlife': [
            'Watching kangaroos, koalas, and other native species',
          ],
        }),

// Germany:
// Attractions:
//
// Historical Sites: Brandenburg Gate, Neuschwanstein Castle, Cologne Cathedral
// Museums: Pergamon Museum, Deutsches Museum
// Scenic Routes: Romantic Road, Black Forest
// Hotels:
//
// Luxury: Hotel Adlon Kempinski, Berlin, Mandarin Oriental, Munich
// Boutique: Sir Savigny Hotel, Berlin, Beyond by Geisel, Munich
// Historic: Schlosshotel Kronberg, Frankfurt, Hotel Louis C. Jacob, Hamburg
// Activities:
//
// Cultural: Exploring Germany's rich history and architecture
// Food & Drink: Sampling German beer at Oktoberfest, enjoying traditional German cuisine
// Leisure: Driving on the Autobahn, shopping in Berlin and Munich
// Nature: Hiking in the Black Forest, cruising along the Rhine River
    CountryModel(
        id: 6,
        name: 'Germany',
        imagePath: 'assets/images/ic_ger.png',
        hotels: {
          'Luxury': [
            'Hotel Adlon Kempinski, Berlin',
            'Mandarin Oriental, Munich',
          ],
          'Boutique': [
            'Sir Savigny Hotel, Berlin',
            'Beyond by Geisel, Munich',
          ],
          'Historic': [
            'Schlosshotel Kronberg, Frankfurt',
            'Hotel Louis C. Jacob, Hamburg',
          ],
        },
        attractions: {
          'Historical Sites': [
            'Brandenburg Gate',
            'Neuschwanstein Castle',
            'Cologne Cathedral',
          ],
          'Museums': [
            'Pergamon Museum',
            'Deutsches Museum',
          ],
          'Scenic Routes': [
            'Romantic Road',
            'Black Forest',
          ],
        },
        activities: {
          'Cultural': [
            'Exploring Germany\'s rich history and architecture',
          ],
          'Food & Drink': [
            'Sampling German beer at Oktoberfest',
            'Enjoying traditional German cuisine',
          ],
          'Leisure': [
            'Driving on the Autobahn',
            'Shopping in Berlin and Munich',
          ],
          'Nature': [
            'Hiking in the Black Forest',
            'Cruising along the Rhine River',
          ],
        }),
// Philippines:
// Attractions:
//
// Beaches: Boracay, El Nido, Coron
// Historical Sites: Intramuros, Fort Santiago, Rizal Park
// Natural Wonders: Chocolate Hills, Banaue Rice Terraces
// Hotels:
//
// Luxury: Shangri-La's Boracay Resort & Spa, Amanpulo
// Boutique: Amorita Resort, Bohol, The Henry Hotel Manila
// Beach Resorts: El Nido Resorts - Pangulasian Island, Siargao Bleu Resort & Spa
// Activities:
//
// Adventure: Island hopping, diving, and snorkeling
// Cultural: Exploring Filipino history and architecture in Intramuros
// Leisure: Relaxing on the beautiful beaches of Boracay, El Nido, and Coron
// Food & Drink: Sampling Filipino cuisine, including adobo, sinigang, and lechon
// write example philippines CountryModel
    CountryModel(
        id: 7,
        name: 'Philippines',
        imagePath: 'assets/images/ic_phi.jpeg',
        hotels: {
          'Luxury': [
            'Shangri-La\'s Boracay Resort & Spa',
            'Amanpulo',
          ],
          'Boutique': [
            'Amorita Resort, Bohol',
            'The Henry Hotel Manila',
          ],
          'Beach Resorts': [
            'El Nido Resorts - Pangulasian Island',
            'Siargao Bleu Resort & Spa',
          ],
        },
        attractions: {
          'Beaches': [
            'Boracay',
            'El Nido',
            'Coron',
          ],
          'Historical Sites': [
            'Intramuros',
            'Fort Santiago',
            'Rizal Park',
          ],
          'Natural Wonders': [
            'Chocolate Hills',
            'Banaue Rice Terraces',
          ],
        },
        activities: {
          'Adventure': [
            'Island hopping, diving, and snorkeling',
          ],
          'Cultural': [
            'Exploring Filipino history and architecture in Intramuros',
          ],
          'Leisure': [
            'Relaxing on the beautiful beaches of Boracay, El Nido, and Coron',
          ],
          'Food & Drink': [
            'Sampling Filipino cuisine, including adobo, sinigang, and lechon',
          ],
        }),
  ];
}
