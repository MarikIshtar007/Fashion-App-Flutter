import 'package:flutter/material.dart';
import 'package:fashion_app/widgets/custom_stack_widget.dart';
import 'package:fashion_app/widgets/home_tile_widget.dart';
import 'package:fashion_app/widgets/item_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
          size: 30.0,
        ),
        title: Hero(
          tag: 'main_text',
          child: Text(
            'Fashion App',
            style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Color(0xFF202F36),
        unselectedItemColor: Color(0xFF96A7AF),
        onTap: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
          print('selected index: $_selectedIndex');
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favorites')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text('Shopping Cart')),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('Details'))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                HomePageTile(
                  title: 'New',
                ),
                HomePageTile(
                  title: 'Popular',
                ),
                HomePageTile(title: 'Trending'),
                Expanded(
                  child: Container(),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.search,
                      size: 26.0,
                    ))
              ],
            ),
            Transform.rotate(
              angle: 3.142,
              child: Stack(
                overflow: Overflow.clip,
                children: <Widget>[
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                    top: 80,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomStackWidget(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'New Collection',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ItemTile(),
                    ItemTile(),
                    ItemTile(),
                    ItemTile()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

