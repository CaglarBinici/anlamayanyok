import 'package:anlamayanyok/AnaSayfa/KonularClassOOP.dart';
import 'package:anlamayanyok/Geometri/TYT/temel_kavramlar_geo.dart';
import 'package:anlamayanyok/Videolar/TYT/Konular/Sayi_Basamaklari_Video.dart';
import 'package:anlamayanyok/Videolar/TYT/Konular/Temel_Kavramlar_video.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Videolar_TYT_Class extends StatefulWidget {
  @override
  _Videolar_TYT_ClassState createState() => _Videolar_TYT_ClassState();
}

class _Videolar_TYT_ClassState extends State<Videolar_TYT_Class> {
  List<TumKonular> konuBasliklari = [
    TumKonular(KonuAdi: "Temel Kavramlar", KonuKategori: "Matematik-TYT",KonuId: 17),
    TumKonular(KonuAdi: "Sayı Basamakları", KonuKategori: "Matematik-TYT",KonuId: 18),
  ];
  @override
  Widget build(BuildContext context) {
    double _fontSizeQuery = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          child: Center(child: Padding(
            padding: EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height / 30),
            child: Text("TYT Videolar", style:
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
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 800,
              horizontal: MediaQuery
                  .of(context)
                  .size
                  .width / 50),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.video_library_rounded),
                onPressed: () {

                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {
                  if(konuBasliklari[index].KonuId==17){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Temel_Kavramlar_Video();
                    }));
                  }else if(konuBasliklari[index].KonuId==18){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Sayi_Basamaklari_Video();
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
                    if(konuBasliklari[index].KonuId==17){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Temel_Kavramlar_Video();
                      }));
                    }else if(konuBasliklari[index].KonuId==18){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Sayi_Basamaklari_Video();
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
