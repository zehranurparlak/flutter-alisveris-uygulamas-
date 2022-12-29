import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basit Alışveriş Uygulaması",
        debugShowCheckedModeBanner:false,
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.yellow,
        title: Text("Alışveriş Uygulaması",
        style: TextStyle(
            color: Colors.black,
        ),
      ),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List alisverisListesi = [];

  elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: alisverisListesi.length,
              itemBuilder: (context, siraNumarasi) =>
                  ListTile(
                    subtitle: Text("Alınacaklar"),
                    title: Text(alisverisListesi[siraNumarasi]),
                  ),
            ),
          ),
          TextField(
            controller: t1,
          ),
          ElevatedButton(
            onPressed: elemanEkle,
            child: Text("Ekle",
              style: TextStyle(
                color: Colors.black,
    ),
            ),
          ),
          ElevatedButton(
            onPressed: elemanCikar,
            child: Text("Çıkar",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
