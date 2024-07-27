import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'geri_donusum_model.dart';

class GeriDonusumEkleSayfasi extends StatelessWidget {
  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _puanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Geri Dönüşüm Ekle'),
            Image.asset(
              'assets/logo.jpg',
              height: 40,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _isimController,
              decoration: InputDecoration(labelText: 'Geri Dönüşüm İsmi'),
            ),
            TextField(
              controller: _puanController,
              decoration: InputDecoration(labelText: 'Puan'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final isim = _isimController.text;
                final puan = int.tryParse(_puanController.text) ?? 0;
                if (isim.isNotEmpty && puan > 0) {
                  final yeniGeriDonusum = GeriDonusumItem(isim, puan);
                  Provider.of<GeriDonusumModel>(context, listen: false).addItem(yeniGeriDonusum);
                  Navigator.pop(context);
                }
              },
              child: Text('Onayla'),
            ),
          ],
        ),
      ),
    );
  }
}
