import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/custom_info_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Define the cardsData list with initial data
  List<Map<String, String>> cardsData = [
    {
      'title': 'Design Management',
      'subtitle': 'We have to manage all our design projects in one tool.',
      'imageUrl':
      'https://images.unsplash.com/photo-1677191182230-c4b1e76ea206?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Marketing Strategies',
      'subtitle': 'Plan and execute your marketing campaigns effectively.',
      'imageUrl':
      "https://plus.unsplash.com/premium_photo-1661293879952-c5c093282801?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      'title': 'Project Management',
      'subtitle': 'Track the progress of projects across teams.',
      'imageUrl':
      "https://plus.unsplash.com/premium_photo-1661290256778-3b821d52c514?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      'title': 'Team Collaboration',
      'subtitle': 'Collaborate with your team on tasks and projects.',
      'imageUrl':
      "https://plus.unsplash.com/premium_photo-1684769161054-2fa9a998dcb6?q=80&w=2104&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      'title': 'Customer Relations',
      'subtitle': 'Build and maintain strong customer relationships.',
      'imageUrl':
      "https://images.unsplash.com/photo-1556745753-b2904692b3cd?q=80&w=1973&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/svg/notes-icon.svg",
                          height: 38,
                          width: 38,
                          fit: BoxFit.cover,
                          color: const Color(0xFF484948),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "All Notes",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    CachedNetworkImage(
                      imageUrl:
                      "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      placeholder: (context, url) => const SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                      imageBuilder: (context, imageProvider) => Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "124 Notes",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF9FADFF),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/svg/list-icon.svg",
                        height: 34,
                        width: 34,
                        fit: BoxFit.cover,
                        color: const Color(0xFF484948),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ReorderableListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }

                      // Reorder the cardsData list
                      final Map<String, String> movedItem = cardsData[oldIndex];
                      cardsData.removeAt(oldIndex);
                      cardsData.insert(newIndex, movedItem);
                    });
                  },
                  children: List.generate(
                    cardsData.length,
                        (index) => CustomInfoCard(
                      key: Key("$index"),
                      title: cardsData[index]['title']!,
                      subtitle: cardsData[index]['subtitle']!,
                      imageUrl: cardsData[index]['imageUrl']!,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}