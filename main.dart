import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hannibal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hannibal- السوق هانبيال'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'إبحث في السوق هانبيال...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://example.com/image${index + 1}.png'),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.green,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'أفضل سوق للوصول إلى الملايين.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('إبحث الآن'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildCategoryItem('أدوات منزلية', Icons.home),
                  _buildCategoryItem('توصيل', Icons.directions_car),
                  _buildCategoryItem('السوق - كل شيء آخر', Icons.shop),
                  _buildCategoryItemWithNavigation(
                      context, 'ثلاجات', Icons.kitchen, FridgePage()),
                  _buildCategoryItemWithNavigation(context, 'غسالات',
                      Icons.local_laundry_service, WasherPage()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'دردشاتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box, color: Colors.orange),
            label: 'أضف إعلان',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'إعلاناتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40),
        SizedBox(height: 10),
        Text(title, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildCategoryItemWithNavigation(
      BuildContext context, String title, IconData icon, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class FridgePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ثلاجات'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildCategoryItem('ثلاجات ميه', Icons.ac_unit),
          _buildCategoryItem('ثلاجات مرمر', Icons.kitchen),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          // إضافة التنقل إلى صفحات التفاصيل هنا إذا لزم الأمر
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class WasherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('غسالات'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildCategoryItem('غسالات معين', Icons.local_laundry_service),
          _buildCategoryItem(
              'غسالات ملابس', Icons.local_laundry_service_outlined),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          // إضافة التنقل إلى صفحات التفاصيل هنا إذا لزم الأمر
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
