import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_app/widgets/custom_stack_widget.dart';
import 'package:fashion_app/widgets/home_tile_widget.dart';
import 'package:fashion_app/widgets/item_tile.dart';
import 'package:fashion_app/screens/Shopping_Cart_Screen.dart';

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
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
              ),
              child: DrawerHeader(
                child: ConstrainedBox(
                  child: Center(
                    child: Text(
                      'FASHION\n APP',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                  ),
                  constraints: BoxConstraints.loose(Size(
                      MediaQuery.of(context).size.width * 0.55,
                      MediaQuery.of(context).size.height * 0.3)),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Account Details'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Order History'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              onTap: (){},
              title: Text('Payment Details'),
            ),
            ListTile(
              leading:Icon(Icons.vpn_key),
              title: Text('Update Verification Details'),
              onTap: (){},
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.power_settings_new),
              title: Text('Log Out'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Hero(
          tag: 'main_text',
          child: Text(
            'Fashion App',
            style: TextStyle(color: Colors.white),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('SH', style: TextStyle(fontWeight: FontWeight.bold),),
              foregroundColor: Colors.black,
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
          setState(() {
            if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShoppingCart()));
            }
          });
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
                Container(
                  margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.black)),
                  child: Text(
                    'New',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.white),
                  ),
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
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1),
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
                    ItemTile(
                      title: 'Red Summer Dress',
                      imageUrl: 'assets/images/red-dress.png',
                    ),
                    ItemTile(
                      title: 'Yellow Summer Dress',
                      imageUrl: 'assets/images/yellow-dress.png',
                    ),
                    ItemTile(
                      title: 'Green Summer Dress',
                      imageUrl: 'assets/images/green-dress.png',
                    ),
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
