import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

void main() {
  runApp(Md5Cevirici());
}

class Md5Cevirici extends StatefulWidget {
  @override
  _Md5CeviriciState createState() => _Md5CeviriciState();
}

class _Md5CeviriciState extends State<Md5Cevirici> {
  var cevrilecekMetinController = TextEditingController();
  String sonuc = "";

  String generateMd5(cevrilecekMetinController) {
    var content = new Utf8Encoder().convert(cevrilecekMetinController.text);
    var md5 = crypto.md5;
    var digest = md5.convert(content);

    sonuc = hex.encode(digest.bytes);
    return sonuc;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MD5 Çevirici",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Metni Md5 e Çevir"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: cevrilecekMetinController,
                      decoration: InputDecoration(
                        hintText: "Metni buraya giriniz",
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        "Çevir",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          generateMd5(
                              cevrilecekMetinController);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0), //çalıştır
                child: SelectableText("$sonuc", style: TextStyle(fontSize: 18.0),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
