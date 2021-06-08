import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HakkimizdaSayfasiClass extends StatefulWidget {
  @override
  _HakkimizdaSayfasiClassState createState() => _HakkimizdaSayfasiClassState();
}

class _HakkimizdaSayfasiClassState extends State<HakkimizdaSayfasiClass> {
  @override
  Widget build(BuildContext context) {
    double _fontSizeQuery = MediaQuery.of(context).size.width;
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          child: Center(child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/30),
            child: Text("Hakkımızda",style:
            GoogleFonts.anticSlab(fontStyle: FontStyle.normal,fontSize:_fontSizeQuery*.060, color: Color(
                0xFA1C2F40),fontWeight:
            FontWeight.bold),),
          )),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors:
            [Color(0xFAABC973),Color(0xFADBE8C3)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0,0.0),
              stops: [0.0,1.0],
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
                  Color(0xFAE3EED0),
                  Color(0xFAD6E8B4),
                  Color(0xFAC2D79A),
                  Color(0xFAACC67C),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _fontSizeQuery/12),
            child: Container(
              alignment: Alignment.center,
              height: _fontSizeQuery*.25,
              width: double.infinity,
              child: Text("Ekibimiz",style: TextStyle(
                fontSize: _fontSizeQuery*.075,
              ),),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left:_fontSizeQuery/12.5,
              right: _fontSizeQuery/12.5,
              top: MediaQuery.of(context).size.height/4.5,),
            child: Container(
              child: Text("Pandemi döneminde okullarından uzak kalan öğrencileri kaliteli hizmet ve eğitimle buluşturmayı "
                  "misyonu edinmiş olan Anlamayan Yok ekibi, elektrik elektronik ve bilgisayar mühendisliği"
                  " yazılım geliştirme üzerine lisans yapan iki son sınıf öğrencinin ortak projesi olarak hayata geçmiştir."
                  " Ekibin devam etmekte olup, yakın zamanda hayata geçireceği diğer projeleri de bulunmaktadır. "
                  ,style: TextStyle(
                fontSize: _fontSizeQuery*.055,
                color: Color(0xFA24281E),
                  fontStyle: FontStyle.italic,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
