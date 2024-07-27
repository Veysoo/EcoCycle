import 'package:flutter/material.dart';
import 'geri_donusum_sayfasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geri Dönüşüm Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Apsiyon'),
            Image.asset(
              'assets/logo.jpg',
              height: 40,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          _buildCard(
              context, Icons.recycling, 'Geri Dönüşüm', GeriDonusumSayfasi()),
          _buildCard(context, Icons.payment, 'Tahsilatlar', null),
          _buildCard(context, Icons.money, 'Borçlandırmalar', null),
          _buildCard(context, Icons.account_balance, 'Cari İzleme', null),
          _buildCard(context, Icons.work, 'İş Takibi', null),
          _buildCard(context, Icons.list, 'Yapılacak İşler', null),
          _buildCard(context, Icons.build, 'Bakım Onarım', null),
          _buildCard(context, Icons.checklist, 'Denetim Kaydı', null),
          _buildCard(context, Icons.home, 'Tesis - Rezervasyon', null),
          _buildCard(
              context, Icons.directions_walk, 'Tur Kontrol Sistemi', null),
          _buildCard(context, Icons.local_shipping, 'Gönderi Takibi', null),
          _buildCard(context, Icons.group, 'Ziyaretçi Takibi', null),
          _buildCard(context, Icons.contact_mail, 'İletişim Yönetimi', null),
          _buildCard(context, Icons.person, 'Onay Bekleyen Kişiler', null),
          _buildCard(context, Icons.info, 'Site Bilgileri', null),
        ],
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, IconData icon, String title, Widget? page) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: page != null
            ? () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));
              }
            : null,
      ),
    );
  }
}
