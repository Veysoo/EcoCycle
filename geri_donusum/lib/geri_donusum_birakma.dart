import 'package:flutter/material.dart';

class GeriDonusumBirakma extends StatefulWidget {
  @override
  _GeriDonusumBirakmaState createState() => _GeriDonusumBirakmaState();
}

class _GeriDonusumBirakmaState extends State<GeriDonusumBirakma> {
  int pil = 0;
  int kagit = 0;
  int plastik = 0;

  void _increaseCount(String item) {
    setState(() {
      if (item == 'pil') pil++;
      if (item == 'kagit') kagit++;
      if (item == 'plastik') plastik++;
    });
  }

  void _decreaseCount(String item) {
    setState(() {
      if (item == 'pil' && pil > 0) pil--;
      if (item == 'kagit' && kagit > 0) kagit--;
      if (item == 'plastik' && plastik > 0) plastik--;
    });
  }

  void _onayla() {
    if (pil == 0 && kagit == 0 && plastik == 0) {
      // Hiçbir geri dönüşüm eşyası girilmemişse
      return;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tebrikler!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 50,
              ),
              SizedBox(height: 20),
              Text('Geri dönüşüm alındı!'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialogu kapat
                Navigator.pop(context, {
                  'pil': pil,
                  'kagit': kagit,
                  'plastik': plastik,
                }); // Geri dön
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Geri Dönüşüm Bırakma'),
            Image.asset(
              'assets/logo.jpg',
              height: 40,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/recycle.jpg',
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            _buildCounterCard('Pil', pil, 'pil', 'assets/pil.jpg'),
            _buildCounterCard('Kağıt', kagit, 'kagit', 'assets/kagit.jpg'),
            _buildCounterCard(
                'Plastik', plastik, 'plastik', 'assets/plastik.jpg'),
            SizedBox(height: 20),
            _buildOnaylaButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterCard(
      String label, int count, String item, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 40,
              width: 40,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontSize: 18),
              ),
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => _decreaseCount(item),
            ),
            Text(
              '$count',
              style: TextStyle(fontSize: 18),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _increaseCount(item),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnaylaButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: (pil > 0 || kagit > 0 || plastik > 0) ? _onayla : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[300],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Center(
          child: Text(
            'Onayla',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
