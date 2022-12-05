// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:reader/categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: categories.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          //Appbar Buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.grid_view_rounded,
                    color: Colors.grey,
                    size: 28.0,
                  ),
                ),
                const SizedBox(width: 230),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.grey,
                    size: 28.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.grey,
                    size: 28.0,
                  ),
                ),
              ],
            ),
          ),
          //Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: const TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded, size: 25),
                  label: Text("Search"),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          //Categories
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: TabBar(
                controller: tabController,
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey,
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs:
                    categories.map((elements) => Tab(text: elements)).toList(),
              ),
            ),
          ),

          //Popular Books & See All
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Popular Books",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),

          //Books
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BuildBookCover(image: 'images/1.jpg', title: "Art Of War"),
                BuildBookCover(
                    image: 'images/2.jpg', title: "The Obstacle Is The Way"),
                BuildBookCover(image: 'images/3.jpg', title: "Atomic Habits"),
                BuildBookCover(
                    image: 'images/4.jpg',
                    title: "The 7 Habits Of Highly Effective People"),
                BuildBookCover(
                    image: 'images/5.jpg', title: "Man's Search For Meaning"),
                BuildBookCover(image: 'images/6.jpg', title: "Ikigai"),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.pinkAccent, Colors.purpleAccent]),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class BuildBookCover extends StatelessWidget {
  late String image;
  late String title;

  BuildBookCover({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 180,
            width: 120,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
            width: 120,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
