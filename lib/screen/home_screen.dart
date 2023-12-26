import 'package:blogclub/db/data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigatBar(),
      floatingActionButton: const MyFloatingABtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! app bar
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 8),
                  child: Row(
                    children: [
                      const Text('Hi, Mohsen!'),
                      const Spacer(),
                      Image.asset(
                        'assets/img/icons/notification.png',
                        height: 32,
                      ),
                    ],
                  ),
                ),
                //! explore
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  child: const Text('Explore today\'s',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                //! story
                const StoryList(),
                const SizedBox(height: 24),
                //! category story
                const CategoryList(),
                //! lets news
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Latest News',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'More',
                            style: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.w600,
                              color: Colors.blueAccent[700],
                            ),
                          ))
                    ],
                  ),
                ),
                //! card
                const MyCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyFloatingABtn extends StatelessWidget {
  const MyFloatingABtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue[700],
      mini: false,
      shape: const CircleBorder(),
      onPressed: () {},
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}

class MyBottomNavigatBar extends StatefulWidget {
  const MyBottomNavigatBar({
    super.key,
  });

  @override
  State<MyBottomNavigatBar> createState() => _MyBottomNavigatBarState();
}

class _MyBottomNavigatBarState extends State<MyBottomNavigatBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/img/icons/Home.png'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/img/icons/Articles.png'),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/img/icons/Search.png'),
          label: 'School',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/img/icons/Menu.png'),
          label: 'School',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue[900],
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: _onItemTapped,
      enableFeedback: false,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/img/posts/small/small_post_1.jpg',
                      ),
                      fit: BoxFit.fill)),
              // child: Image.asset(
              //     'assets/img/posts/small/small_post_1.jpg'),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BIG DATA',
                    style: TextStyle(
                        color: Colors.blueAccent[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const Text(
                    'why Big Data Needs Think Data?',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.80);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            _pageController =
                PageController(initialPage: value, viewportFraction: 0.80);
          });
        },
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        itemCount: AppDatabase.categories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = AppDatabase.categories[index];
          const double circularRadius = 24;

          return Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              AnimatedContainer(
                height: index == _pageController.initialPage ? 350 : 280,
                width: 315,
                duration: const Duration(milliseconds: 300),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(circularRadius),
                  child: Image.asset(
                    'assets/img/posts/large/${category.imageFileName}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 150,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(circularRadius),
                        bottomRight: Radius.circular(circularRadius)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black87,
                        Colors.black45,
                        Colors.transparent
                      ],
                    )),
              ),
              Positioned(
                bottom: 30,
                left: 25,
                child: Text(
                  category.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}

class StoryList extends StatelessWidget {
  const StoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 16),
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppDatabase.stories.length,
        itemBuilder: (BuildContext context, int index) {
          final story = AppDatabase.stories[index];
          return Container(
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 68,
                      width: 68,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff376AED),
                                Color(0xff49B0E2),
                                Color(0xff9CECFB),
                              ])),
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(3),
                        height: 68,
                        width: 68,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.white),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            'assets/img/stories/${story.imageFileName}',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                      child:
                          Image.asset('assets/img/icons/${story.iconFileName}'),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(story.name),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
