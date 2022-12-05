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
        child: Material(
      child: Column(
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
        ],
      ),
    ));
  }
}
