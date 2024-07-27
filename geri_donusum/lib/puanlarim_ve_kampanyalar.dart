import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class PuanlarimVeKampanyalar extends StatelessWidget {
  final int totalPuan;

  PuanlarimVeKampanyalar({required this.totalPuan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Puanlarım ve Kampanyalar'),
            Image.asset(
              'assets/logo.jpg',
              height: 40,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Puanlarım',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: totalPuan / 100, // Assuming 100 is the maximum point
                    strokeWidth: 10,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.recycling, // 'recycle' simgesi
                      size: 50,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$totalPuan Puan',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Kampanyalar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildKampanya('Aidattan 50 TL indirim'),
                _buildKampanya('Bedava Sinema Bileti'),
                _buildKampanya('Bedava Kahve'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKampanya(String kampanya) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(kampanya),
      ),
    );
  }
}
