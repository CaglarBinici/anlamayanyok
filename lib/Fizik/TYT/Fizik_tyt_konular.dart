import 'package:anlamayanyok/AnaSayfa/KonularClassOOP.dart';
import 'package:anlamayanyok/Fizik/TYT/Dinamik.dart';
import 'package:anlamayanyok/Fizik/TYT/basinc.dart';
import 'package:anlamayanyok/Fizik/TYT/fizik_bilimine_giris.dart';
import 'package:anlamayanyok/Fizik/TYT/hareket.dart';
import 'package:anlamayanyok/Fizik/TYT/kaldirma_kuvveti.dart';
import 'package:anlamayanyok/Fizik/TYT/madde_ve_ozellikleri.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Fizik_tyt_konular extends StatefulWidget {
  @override
  _Fizik_tyt_konularState createState() => _Fizik_tyt_konularState();
}

class _Fizik_tyt_konularState extends State<Fizik_tyt_konular> {

  List<TumKonular> konuBasliklari = [
    TumKonular(KonuAdi: "Fizik Bilimine Giriş", KonuKategori: "Fizik-TYT", KonuId:60),
    TumKonular(KonuAdi: "Madde ve Özellikleri", KonuKategori: "Fizik-TYT", KonuId:61),
    TumKonular(KonuAdi: "Kaldırma Kuvveti", KonuKategori: "Fizik-TYT", KonuId:62),
    TumKonular(KonuAdi: "Basınç", KonuKategori: "Fizik-TYT", KonuId:63),
    TumKonular(KonuAdi: "Hareket", KonuKategori: "Fizik-TYT", KonuId:64),
    TumKonular(KonuAdi: "Dinamik", KonuKategori: "Fizik-TYT", KonuId:65),
  ];
  @override
  Widget build(BuildContext context) {
    double _fontSizeQuery = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          child: Center(child: Padding(
            padding: EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height / 30),
            child: Text("TYT Konular", style:
            GoogleFonts.anticSlab(fontStyle: FontStyle.normal,
                fontSize: _fontSizeQuery * .060,
                color: Color(
                    0xFA1C2F40),
                fontWeight:
                FontWeight.bold),),
          )),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors:
            [Color(0xFA8CC6C6),Color(0xFACDFAFA)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFACDFAFA),
                  Color(0xFAD5F8F8),
                  Color(0xFAE7FCFC),
                  Color(0xFAE8F6F6),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          _buildListView(),
        ],
      ),
    );
  }
  ListView _buildListView() {
    return ListView.builder(
      itemCount: konuBasliklari.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery
              .of(context)
              .size
              .height / 800,
              horizontal: MediaQuery
                  .of(context)
                  .size
                  .width / 50),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading:Icon(Icons.star),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {
                  if(konuBasliklari[index].KonuId==60){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return fizik_bilimine_giris();
                    }));
                  }else if(konuBasliklari[index].KonuId==61){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return madde_ve_ozellikleri();
                    }));
                  }else if(konuBasliklari[index].KonuId==62){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return kaldirma_kuvveti();
                    }));
                  }else if(konuBasliklari[index].KonuId==63){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return basinc();
                    }));
                  }else if(konuBasliklari[index].KonuId==64){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return hareket();
                    }));
                  }else if(konuBasliklari[index].KonuId==65){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Dinamik();
                    }));
                  }
                  else{
                    Container(
                      alignment: Alignment.center,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),
              title: GestureDetector(
                  onTap: () {
                    if(konuBasliklari[index].KonuId==60){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return fizik_bilimine_giris();
                      }));
                    }else if(konuBasliklari[index].KonuId==61){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return madde_ve_ozellikleri();
                      }));
                    }else if(konuBasliklari[index].KonuId==62){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return kaldirma_kuvveti();
                      }));
                    }else if(konuBasliklari[index].KonuId==63){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return basinc();
                      }));
                    }else if(konuBasliklari[index].KonuId==64){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return hareket();
                      }));
                    }else if(konuBasliklari[index].KonuId==65){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Dinamik();
                      }));
                    }
                    else{
                      Container(
                        alignment: Alignment.center,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                  child: Text(konuBasliklari[index].KonuAdi,)),
            ),
          ),
        );
      },
    );
  }

}
