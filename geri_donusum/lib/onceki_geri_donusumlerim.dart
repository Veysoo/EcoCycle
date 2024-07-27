import 'package:flutter/material.dart';

class OncekiGeriDonusumlerim extends StatelessWidget {
  final List<Map<String, int>> geriDonusumler;

  OncekiGeriDonusumlerim({required this.geriDonusumler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Önceki Geri Dönüşümlerim'),
            Image.asset(
              'assets/logo.jpg',
              height: 40,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: geriDonusumler.length,
        itemBuilder: (context, index) {
          final item = geriDonusumler[index];
          final puan =
              item['pil']! * 1 + item['kagit']! * 2 + item['plastik']! * 3;
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(
                Icons.recycling, // Kullanıcı geri dönüşüm simgesi
                size: 40,
                color: Colors.blue,
              ),
              title: Text(
                'Geri Dönüşüm ${index + 1}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Pil: ${item['pil']} | Kağıt: ${item['kagit']} | Plastik: ${item['plastik']}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              trailing: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Puan: $puan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
