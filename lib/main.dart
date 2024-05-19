//
// import 'package:shimmer/shimmer.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:nkott/Screens/%20ComedyPage.dart';
// import 'package:nkott/Screens/BhootaradhanePage.dart';
// import 'package:nkott/Screens/Brahmakalasha.dart';
// import 'package:nkott/Screens/Devotional.dart';
// import 'package:nkott/Screens/Documentary.dart';
// import 'package:nkott/Screens/Interviews.dart';
// import 'package:nkott/Screens/Movies.dart';
// import 'package:nkott/Screens/ShortMovies.dart';
// import 'package:nkott/Screens/Sports.dart';
// import 'package:nkott/Screens/Travel.dart';
// import 'package:nkott/Screens/TuluCinema.dart';
// import 'package:nkott/Screens/TuluDrama.dart';
// import 'package:nkott/Screens/YakshaganaPage.dart';
// import 'package:video_player/video_player.dart';
//
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//         scaffoldBackgroundColor: Color(0xFF121212),
//       ),
//       home: HomePage(),
//     );
//   }
// }
//
// Future<HomeData> fetchHomeData() async {
//   final response = await http.get(Uri.parse('http://192.168.42.143/nkprime/app/home-data.php'));
//
//   if (response.statusCode == 200) {
//     return HomeData.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load data');
//   }
// }
//
// class HomeData {
//   final Map<String, DataSection> data;
//   final int status;
//   final String message;
//
//   HomeData({required this.data, required this.status, required this.message});
//
//   factory HomeData.fromJson(Map<String, dynamic> json) {
//     var dataMap = json['data'] as Map<String, dynamic>;
//     Map<String, DataSection> data = {};
//     dataMap.forEach((key, value) {
//       data[key] = DataSection.fromJson(value);
//     });
//     return HomeData(
//       data: data,
//       status: json['status'],
//       message: json['message'],
//     );
//   }
// }
//
// class DataSection {
//   final String title;
//   final List<MovieItem>? items;
//
//   DataSection({required this.title, required this.items});
//
//   factory DataSection.fromJson(Map<String, dynamic> json) {
//     var itemsList = json['items'] as List?;
//     List<MovieItem>? items = itemsList != null
//         ? itemsList.map((item) => MovieItem.fromJson(item)).toList()
//         : null;
//     return DataSection(
//       title: json['title'] ?? 'No title',
//       items: items,
//     );
//   }
// }
//
// class MovieItem {
//   final String movieId;
//   final String movieBannerUrl;
//   final String movieTitle;
//   final String streamUrl;
//   final String? movieDescription;
//   final String? movieLink;
//
//   MovieItem({
//     required this.movieId,
//     required this.movieBannerUrl,
//     required this.movieTitle,
//     required this.streamUrl,
//     this.movieDescription,
//     this.movieLink,
//   });
//
//   factory MovieItem.fromJson(Map<String, dynamic> json) {
//     return MovieItem(
//       movieId: json['movie_id'] ?? 'No ID',
//       movieBannerUrl: json['movie_banner_url'] ?? 'No banner URL',
//       movieTitle: json['movie_title'] ?? 'No title',
//       streamUrl: json['stream_url'] ?? 'No stream URL',
//       movieDescription: json['movie_description'],
//       movieLink: json['movie_link'],
//     );
//   }
// }
//
// // class HomePage extends StatefulWidget {
// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //   late Future<HomeData> futureHomeData;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     futureHomeData = fetchHomeData();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Home Data'),
// //       ),
// //       body: FutureBuilder<HomeData>(
// //         future: futureHomeData,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (snapshot.hasData) {
// //             var sections = snapshot.data!.data;
// //             var sortedKeys = sections.keys.toList()..sort((a, b) => int.parse(a).compareTo(int.parse(b)));
// //             return ListView.builder(
// //               itemCount: sortedKeys.length,
// //               itemBuilder: (context, index) {
// //                 var key = sortedKeys[index];
// //                 var section = sections[key]!;
// //                 return SectionWidget(section: section, sectionTitle: section.title);
// //               },
// //             );
// //
// //           } else {
// //             return Center(child: Text('No data available'));
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
//
//
//
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   late Future<HomeData> futureHomeData;
//
//   @override
//   void initState() {
//     super.initState();
//     futureHomeData = fetchHomeData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black38,
//         title: Text('Home Data',style: TextStyle(color: Color(0xFFF2F2F2)),),
//       ),
//       body: FutureBuilder<HomeData>(
//         future: futureHomeData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return ListView.builder(
//               itemCount: 10, // Number of shimmer placeholders you want to show
//               itemBuilder: (context, index) {
//                 return Shimmer.fromColors(
//                   baseColor: Colors.grey[700]!,
//                   highlightColor: Colors.grey[500]!,
//                   child: ShimmerPlaceholder(),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             var sections = snapshot.data!.data;
//             var sortedKeys = sections.keys.toList()..sort((a, b) => int.parse(a).compareTo(int.parse(b)));
//             return ListView.builder(
//               itemCount: sortedKeys.length,
//               itemBuilder: (context, index) {
//                 var key = sortedKeys[index];
//                 var section = sections[key]!;
//                 return SectionWidget(section: section, sectionTitle: section.title);
//               },
//             );
//
//           } else {
//             return Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//   }
// }
//
//
//
// enum LayoutType {
//   square,
//   rectangle,
// }
//
// LayoutType getLayoutType(String sectionTitle) {
//   // Customize this logic based on your section titles
//   if (sectionTitle == "Banner Ads" || sectionTitle == "Sliders" || sectionTitle == "Live TV") {
//     return LayoutType.rectangle;
//   } else {
//     return LayoutType.square;
//   }
// }
//
//
//
//
//
//
//
// class SectionWidget extends StatelessWidget {
//   final DataSection section;
//   final String sectionTitle;
//
//   SectionWidget({required this.section, required this.sectionTitle});
//
//   @override
//   Widget build(BuildContext context) {
//     final layoutType = getLayoutType(sectionTitle);
//     bool showForwardIcon = !['Banner Ads', 'Sliders', 'Live TV'].contains(sectionTitle);
//
//     return Container(
//       margin: EdgeInsets.all(8.0),
//       padding: EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 section.title,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:  Color(0xFFF2F2F2)),
//               ),
//               if (showForwardIcon)
//                 IconButton(
//                   color: Colors.white,
//                   icon: Icon(Icons.arrow_forward),
//                   onPressed: () => _handleIconButtonPress(context, section.title),
//                 ),
//             ],
//           ),
//           SizedBox(height: 5.0),
//           if (section.items != null)
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: section.items!
//                     .map((item) => MovieBanner(item: item, layoutType: layoutType))
//                     .toList(),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   void _handleIconButtonPress(BuildContext context, String sectionTitle) {
//     switch (sectionTitle) {
//       case 'Yakshagana - ಯಕ್ಷಗಾನ':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => YakshaganaPage()),
//         );
//         break;
//       case 'COMEDY - ಹಾಸ್ಯ':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ComedyPage()),
//         );
//         break;
//
//
//       case 'Bhootaradhane - ಭೂತಾರಾಧನೆ':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => BhootaradhanePage()),
//         );
//         break;
//
//
//
//       case 'Brahmakalasha - ಬ್ರಹ್ಮಕಲಶ':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => BrahmakalashaPage()),
//         );
//         break;
//       case 'Devotional':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DevotionalPage()),
//         );
//         break;
//       case 'Documentary -  ಸಾಕ್ಷ್ಯಚಿತ್ರ':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DocumentaryPage()),
//         );
//         break;
//       case 'Interviews -ವಿಶೇಷ ಸಂದರ್ಶನ':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) =>InterviewsPage()),
//         );
//         break;
//
//       case 'Movies - ಚಲನಚಿತ್ರಗಳು':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MoviesPage()),
//         );
//         break;
//
//       case 'Short Movies - ಕಿರುಚಿತ್ರಗಳು':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ShortMoviesPage()),
//         );
//         break;
//
//       case 'Sports':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SportsPage()),
//         );
//         break;
//
//       case 'Travel - ನಮ್ಮ ಊರು':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) =>  TravelPage()),
//         );
//         break;
//
//       case 'Tulu Cinema - ತುಳು ಚಿತ್ರರಂಗ':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => TuluCinemaPage()),
//         );
//         break;
//
//       case 'Tulu Drama - ತುಳು ನಾಟಕ':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => TuluDramaPage()),
//         );
//         break;
//
//
//     // Add cases for other section titles to navigate to respective pages
//       default:
//         break;
//     }
//   }
//
// }
//
//
// class SectionPage extends StatelessWidget {
//   final String sectionId;
//
//   SectionPage({required this.sectionId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Section $sectionId Page'),
//       ),
//       body: Center(
//         child: Text('This is Section $sectionId Page'),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
// class MovieBanner extends StatelessWidget {
//   final MovieItem item;
//   final LayoutType layoutType;
//
//   MovieBanner({required this.item, required this.layoutType});
//
//   @override
//   Widget build(BuildContext context) {
//     double width = layoutType == LayoutType.square ? 130 : 200;
//     double height = layoutType == LayoutType.square ? 130 : 100; // Set appropriate height for rectangle
//     double aspectRatio = layoutType == LayoutType.square ? 1 : 16 / 9;
//
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => VideoPlayerPage(streamUrl: item.streamUrl),
//           ),
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//         width: width,
//         height: height,
//         child: Card(
//           elevation: 4,
//           shadowColor: Colors.white.withOpacity(0.3), // Set shadow color to a light shade
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             child: AspectRatio(
//               aspectRatio: 16 / 9,
//               child: Image.network(
//                 item.movieBannerUrl,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class VideoPlayerPage extends StatefulWidget {
//   final String streamUrl;
//
//   VideoPlayerPage({required this.streamUrl});
//
//   @override
//   _VideoPlayerPageState createState() => _VideoPlayerPageState();
// }
//
// class _VideoPlayerPageState extends State<VideoPlayerPage> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(widget.streamUrl));
//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
//     _controller.play();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Center(
//               child: AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               ),
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             if (_controller.value.isPlaying) {
//               _controller.pause();
//             } else {
//               _controller.play();
//             }
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }
// class ShimmerPlaceholder extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(8.0),
//       height: 150,
//       color: Colors.grey[300],
//     );
//   }
// }
//
//
// //
// // study this code
// // when the sectionTitle is  Sliders i waant new bigrectangluare shape to be applied to the moviebanner such that the image will be dispalyed in a big rectangle with no cropping
// // enum LayoutType {
// //   square,
// //   rectangle,
// // }
// //  add new variable called bigRectangle to the above code and
// //
// //
// // LayoutType getLayoutType(String sectionTitle) {
// //   // Customize this logic based on your section titles
// //   if (sectionTitle == "Banner Ads" || sectionTitle == "Sliders" || sectionTitle == "Live TV") {
// //     return LayoutType.rectangle;
// //   } else {
// //     return LayoutType.square;
// //   }
// // }
// //
// // here when the sectionTitle=="Sliders"  apply that bigRectangle shape to it and do neccessary changes and goiive me complete code




import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nkott/Screens/%20ComedyPage.dart';
import 'package:nkott/Screens/BhootaradhanePage.dart';
import 'package:nkott/Screens/Brahmakalasha.dart';
import 'package:nkott/Screens/Devotional.dart';
import 'package:nkott/Screens/Documentary.dart';
import 'package:nkott/Screens/Interviews.dart';
import 'package:nkott/Screens/Movies.dart';
import 'package:nkott/Screens/ShortMovies.dart';
import 'package:nkott/Screens/Sports.dart';
import 'package:nkott/Screens/Travel.dart';
import 'package:nkott/Screens/TuluCinema.dart';
import 'package:nkott/Screens/TuluDrama.dart';
import 'package:nkott/Screens/YakshaganaPage.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFF121212),
      ),
      home: HomePage(),
    );
  }
}

Future<HomeData> fetchHomeData() async {
  final response = await http.get(Uri.parse('http://192.168.42.143/nkprime/app/home-data.php'));

  if (response.statusCode == 200) {
    return HomeData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class HomeData {
  final Map<String, DataSection> data;
  final int status;
  final String message;

  HomeData({required this.data, required this.status, required this.message});

  factory HomeData.fromJson(Map<String, dynamic> json) {
    var dataMap = json['data'] as Map<String, dynamic>;
    Map<String, DataSection> data = {};
    dataMap.forEach((key, value) {
      data[key] = DataSection.fromJson(value);
    });
    return HomeData(
      data: data,
      status: json['status'],
      message: json['message'],
    );
  }
}

class DataSection {
  final String title;
  final List<MovieItem>? items;

  DataSection({required this.title, required this.items});

  factory DataSection.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List?;
    List<MovieItem>? items = itemsList != null
        ? itemsList.map((item) => MovieItem.fromJson(item)).toList()
        : null;
    return DataSection(
      title: json['title'] ?? 'No title',
      items: items,
    );
  }
}

class MovieItem {
  final String movieId;
  final String movieBannerUrl;
  final String movieTitle;
  final String streamUrl;
  final String? movieDescription;
  final String? movieLink;

  MovieItem({
    required this.movieId,
    required this.movieBannerUrl,
    required this.movieTitle,
    required this.streamUrl,
    this.movieDescription,
    this.movieLink,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    return MovieItem(
      movieId: json['movie_id'] ?? 'No ID',
      movieBannerUrl: json['movie_banner_url'] ?? 'No banner URL',
      movieTitle: json['movie_title'] ?? 'No title',
      streamUrl: json['stream_url'] ?? 'No stream URL',
      movieDescription: json['movie_description'],
      movieLink: json['movie_link'],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<HomeData> futureHomeData;

  @override
  void initState() {
    super.initState();
    futureHomeData = fetchHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Home Data', style: TextStyle(color: Color(0xFFF2F2F2))),
      ),
      body: FutureBuilder<HomeData>(
        future: futureHomeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemCount: 10, // Number of shimmer placeholders you want to show
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: ShimmerPlaceholder(),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            var sections = snapshot.data!.data;
            var sortedKeys = sections.keys.toList()..sort((a, b) => int.parse(a).compareTo(int.parse(b)));
            return ListView.builder(
              itemCount: sortedKeys.length,
              itemBuilder: (context, index) {
                var key = sortedKeys[index];
                var section = sections[key]!;
                return SectionWidget(section: section, sectionTitle: section.title);
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

enum LayoutType {
  square,
  rectangle,
  bigRectangle,
}

LayoutType getLayoutType(String sectionTitle) {
  if (sectionTitle == "Banner Ads" || sectionTitle == "Live TV") {
    return LayoutType.rectangle;
  } else if (sectionTitle == "Sliders") {
    return LayoutType.bigRectangle;
  } else {
    return LayoutType.square;
  }
}

class SectionWidget extends StatelessWidget {
  final DataSection section;
  final String sectionTitle;

  SectionWidget({required this.section, required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    final layoutType = getLayoutType(sectionTitle);
    bool showForwardIcon = !['Banner Ads', 'Sliders', 'Live TV'].contains(sectionTitle);

    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                section.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFF2F2F2)),
              ),
              if (showForwardIcon)
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () => _handleIconButtonPress(context, section.title),
                ),
            ],
          ),
          SizedBox(height: 5.0),
          if (section.items != null)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: section.items!
                    .map((item) => MovieBanner(item: item, layoutType: layoutType))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }

  void _handleIconButtonPress(BuildContext context, String sectionTitle) {
    switch (sectionTitle) {
      case 'Yakshagana - ಯಕ್ಷಗಾನ':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => YakshaganaPage()),
        );
        break;
      case 'COMEDY - ಹಾಸ್ಯ':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ComedyPage()),
        );
        break;
      case 'Bhootaradhane - ಭೂತಾರಾಧನೆ':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BhootaradhanePage()),
        );
        break;
      case 'Brahmakalasha - ಬ್ರಹ್ಮಕಲಶ':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BrahmakalashaPage()),
        );
        break;
      case 'Devotional':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DevotionalPage()),
        );
        break;
      case 'Documentary -  ಸಾಕ್ಷ್ಯಚಿತ್ರ':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DocumentaryPage()),
        );
        break;
      case 'Interviews -ವಿಶೇಷ ಸಂದರ್ಶನ':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InterviewsPage()),
        );
        break;
      case 'Movies - ಚಲನಚಿತ್ರಗಳು':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MoviesPage()),
        );
        break;
      case 'Short Movies - ಕಿರುಚಿತ್ರಗಳು':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShortMoviesPage()),
        );
        break;
      case 'Sports':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SportsPage()),
        );
        break;
      case 'Travel - ನಮ್ಮ ಊರು':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TravelPage()),
        );
        break;
      case 'Tulu Cinema - ತುಳು ಚಿತ್ರರಂಗ':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TuluCinemaPage()),
        );
        break;
      case 'Tulu Drama - ತುಳು ನಾಟಕ':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TuluDramaPage()),
        );
        break;
      default:
        break;
    }
  }
}

class SectionPage extends StatelessWidget {
  final String sectionId;

  SectionPage({required this.sectionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Section $sectionId Page'),
      ),
      body: Center(
        child: Text('This is Section $sectionId Page'),
      ),
    );
  }
}

class MovieBanner extends StatelessWidget {
  final MovieItem item;
  final LayoutType layoutType;

  MovieBanner({required this.item, required this.layoutType});

  @override
  Widget build(BuildContext context) {
    double width = 130;
    double height = 130;
    BoxFit boxFit = BoxFit.cover;

    if (layoutType == LayoutType.rectangle) {
      width = 200;
      height = 100;
    } else if (layoutType == LayoutType.bigRectangle) {
      width = 310;
      height = 150;
      boxFit = BoxFit.fill; // To avoid cropping the image
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerPage(streamUrl: item.streamUrl),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        width: width,
        height: height,
        child: Card(
          elevation: 4,
          shadowColor: Colors.white.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              item.movieBannerUrl,
              fit: boxFit,
            ),
          ),
        ),
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final String streamUrl;

  VideoPlayerPage({required this.streamUrl});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.streamUrl));
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

class ShimmerPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 150,
      color: Colors.grey[300],
    );
  }
}
