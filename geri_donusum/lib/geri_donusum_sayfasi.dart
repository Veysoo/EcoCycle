import 'package:flutter/material.dart';
import 'geri_donusum_birakma.dart';
import 'onceki_geri_donusumlerim.dart';
import 'puanlarim_ve_kampanyalar.dart';

class GeriDonusumSayfasi extends StatefulWidget {
  @override
  _GeriDonusumSayfasiState createState() => _GeriDonusumSayfasiState();
}

class _GeriDonusumSayfasiState extends State<GeriDonusumSayfasi> {
  List<Map<String, int>> geriDonusumler = [];
  int totalPuan = 0;

  void _updateGeriDonusum(Map<String, int> yeniGeriDonusum) {
    setState(() {
      geriDonusumler.add(yeniGeriDonusum);
      totalPuan += yeniGeriDonusum['pil']! * 1 +
          yeniGeriDonusum['kagit']! * 2 +
          yeniGeriDonusum['plastik']! * 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Geri Dönüşüm '),
            Image.asset(
              'assets/logo.jpg',
              height: 40,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 3 / 8,
            child:
                Center(child: Image.asset('assets/map.jpg', fit: BoxFit.cover)),
          ),
          _buildCard(
              context, 'Geri Dönüşüm Bırakma', GeriDonusumBirakma(), true),
          _buildCard(context, 'Önceki Geri Dönüşümlerim',
              OncekiGeriDonusumlerim(geriDonusumler: geriDonusumler)),
          _buildCard(context, 'Puanlarım ve Kampanyalar',
              PuanlarimVeKampanyalar(totalPuan: totalPuan)),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String label, Widget page,
      [bool isGeriDonusumBirakma = false]) {
    return Card(
      child: ListTile(
        title: Text(label),
        onTap: () async {
          if (isGeriDonusumBirakma) {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
            if (result != null && result is Map<String, int>) {
              _updateGeriDonusum(result);
            }
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          }
        },
      ),
    );
  }
}
