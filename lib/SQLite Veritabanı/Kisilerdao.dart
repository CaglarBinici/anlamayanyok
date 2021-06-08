import 'package:anlamayanyok/SQLite%20Veritaban%C4%B1/Veritabani_Yardimcisi.dart';

import 'Notlar.dart';

class Kisilerdao{

  Future <List<DersNotlar>> tumKisiler() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
     List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM DersNotlar");
     return List.generate(maps.length, (i) {
       var satir = maps[i];
       return DersNotlar(satir["baslik"], satir["Not"], satir["baslik_id"]);
     }
     );
  }
  Future<void> kisiEkle(String baslik, String Not) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["baslik"] = baslik;
    bilgiler["Not"] = Not;

    await db.insert("DersNotlar", bilgiler);
  }



  Future<void> kisiGuncelle(int baslik_id, String baslik, String Not) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["baslik"] = baslik;
    bilgiler["Not"] = Not;

    await db.update("DersNotlar", bilgiler, where: "baslik_id = ?", whereArgs: [baslik_id]);
  }
  Future<void> kisiSil(int baslik_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("DersNotlar", where: "baslik_id = ?", whereArgs: [baslik_id]);
  }


  Future<DersNotlar>kisiGetir(int baslik_id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM DersNotlar WHERE baslik_id = $baslik_id");
    var satir= maps[0];
    return DersNotlar(satir["baslik"], satir["Not"], satir["baslik_id"]);
  }


}