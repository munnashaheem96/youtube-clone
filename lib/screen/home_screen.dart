import 'package:flutter/material.dart';
import 'package:youtube_clone/widgets/category_widget.dart';
import 'package:youtube_clone/widgets/ads_container.dart';
import 'package:youtube_clone/widgets/post_card.dart';
import 'package:youtube_clone/widgets/shorts_tile.dart';
import 'package:youtube_clone/widgets/video_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isActive = false;
  int selectedIndex = -1; // Track the selected category index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for the category bar
          SliverAppBar(
            pinned: true, // Keep the category bar visible when scrolled
            floating: true, // Allow it to float as you scroll
            expandedHeight: 100.0, // Set the height for the expanded state
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/yt-logo.png',
                            height: 60,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.cast_rounded),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.notifications_none_rounded),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.search_rounded),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isActive = !isActive;
                                });
                              },
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  color: isActive ? Colors.black : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                    child: Icon(
                                      size: 25,
                                      Icons.explore_outlined,
                                      color: isActive ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            BuildCategoryContainer(
                              text: 'All',
                              isActive: selectedIndex == 0,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            BuildCategoryContainer(
                              text: 'News',
                              isActive: selectedIndex == 1,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            BuildCategoryContainer(
                              text: 'Gaming',
                              isActive: selectedIndex == 2,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 2;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            BuildCategoryContainer(
                              text: 'Music',
                              isActive: selectedIndex == 3,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 3;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            BuildCategoryContainer(
                              text: 'Technology',
                              isActive: selectedIndex == 4,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 4;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            BuildCategoryContainer(
                              text: 'Movies',
                              isActive: selectedIndex == 5,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 5;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            BuildCategoryContainer(
                              text: 'Comedy',
                              isActive: selectedIndex == 6,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 6;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              BuildAdsContainer(
                imagePath: 'assets/images/ads_image1.webp',
                logoPath: 'assets/images/ads_logo1.webp',
                title: 'Fashion For Everyone | Fashion Store: Low Price Hub, Nearest to You',
                channelName: 'Fashion Store: Low Price Hub, Nearest to You',
                rating: '4.5',
              ),
              SizedBox(height: 18),
              VideoCard(),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/shorts.png',
                          width: 28,
                          height: 28,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Shorts',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ShortsTile(),
                        SizedBox(width: 8,),
                        ShortsTile()
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        ShortsTile(),
                        SizedBox(width: 8,),
                        ShortsTile()
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 18,),
              VideoCard(),
              SizedBox(height: 18,),
              PostCard(),
              SizedBox(height: 100),
            ]),
          ),
        ],
      ),
    );
  }
}
