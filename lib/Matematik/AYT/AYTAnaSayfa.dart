
import 'package:anlamayanyok/Matematik/AYT/DizilerMat.dart';
import 'package:anlamayanyok/Matematik/AYT/IntegralMat.dart';
import 'package:anlamayanyok/Matematik/AYT/KarmasikSayilarMat.dart';
import 'package:anlamayanyok/Matematik/AYT/LimitMat.dart';
import 'package:anlamayanyok/Matematik/AYT/LogaritmaMat.dart';
import 'package:anlamayanyok/Matematik/AYT/ParabolMat.dart';
import 'package:anlamayanyok/Matematik/AYT/TurevMat.dart';
import 'package:anlamayanyok/Matematik/TYT/%C4%B0statistikMat.dart';
import 'package:anlamayanyok/Matematik/TYT/BasitEsitsizliklerMat.dart';
import 'package:anlamayanyok/Matematik/TYT/BolmeVeBolunebilmeMat.dart';
import 'package:anlamayanyok/Matematik/TYT/CarpanlarAyirmaMat.dart';
import 'package:anlamayanyok/Matematik/TYT/DenklemC%C3%B6zmeMat.dart';
import 'package:anlamayanyok/Matematik/TYT/EbobEkokMat.dart';
import 'package:anlamayanyok/Matematik/TYT/FonksiyonlarMat.dart';
import 'package:anlamayanyok/Matematik/TYT/IkinciDerecedenDenklemlerMat.dart';
import 'package:anlamayanyok/Matematik/TYT/KartezyenCarpimiMat.dart';
import 'package:anlamayanyok/Matematik/TYT/KokluSayilarMat.dart';
import 'package:anlamayanyok/Matematik/TYT/KumelerMat.dart';
import 'package:anlamayanyok/Matematik/TYT/MantikMat.dart';
import 'package:anlamayanyok/Matematik/TYT/MutlakDegerMat.dart';
import 'package:anlamayanyok/Matematik/TYT/OlasilikMat.dart';
import 'package:anlamayanyok/Matematik/TYT/OranOrantiMat.dart';
import 'package:anlamayanyok/Matematik/TYT/PermutasyonKombinasyonMat.dart';
import 'package:anlamayanyok/Matematik/TYT/PolinomlarMat.dart';
import 'package:anlamayanyok/Matematik/TYT/RasyonelSayilarMat.dart';
import 'package:anlamayanyok/Matematik/TYT/SayiBasamaklariMat.dart';
import 'package:anlamayanyok/Matematik/TYT/TemelKavramlarMat.dart';
import 'package:anlamayanyok/Matematik/TYT/UsluSayilarMat.dart';
import 'package:anlamayanyok/Soru%20%C3%87%C3%B6z%C3%BCmleri/SoruCozumleriSayfa.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../AnaSayfa/KonularClassOOP.dart';
import 'TrigonometriMat.dart';
class AYTAnaSayfaClass extends StatefulWidget {
  @override
  _AYTAnaSayfaClassState createState() => _AYTAnaSayfaClassState();
}
class _AYTAnaSayfaClassState extends State<AYTAnaSayfaClass> {
  var kontrol = false;

  _AYTAnaSayfaClassState({
    this.kontrol,
});
  List<TumKonular> konuBasliklarix = [
    TumKonular(KonuAdi: "Temel Kavramlar", KonuKategori: "Matematik-TYT",KonuId: 1), //
    TumKonular(KonuAdi: "Sayı Basamakları", KonuKategori: "Matematik-TYT",KonuId: 2),//
    TumKonular(KonuAdi: "Bölme ve Bölünebilme", KonuKategori: "Matematik-TYT",KonuId: 3),//
    TumKonular(KonuAdi: "Ebob - Ekok", KonuKategori: "Matematik-TYT",KonuId: 4),//
    TumKonular(KonuAdi: "Rasyonel Sayılar", KonuKategori: "Matematik-TYT",KonuId: 5),//
    TumKonular(KonuAdi: "Basit Eşitsizlikler", KonuKategori: "Matematik-TYT",KonuId: 6), //
    TumKonular(KonuAdi: "Mutlak Değer", KonuKategori: "Matematik-TYT",KonuId: 7),//
    TumKonular(KonuAdi: "Üslü Sayılar", KonuKategori: "Matematik-TYT",KonuId: 8),//
    TumKonular(KonuAdi: "Köklü Sayılar", KonuKategori: "Matematik-TYT",KonuId: 9),//
    TumKonular(KonuAdi: "Çarpanlara Ayırma", KonuKategori: "Matematik-TYT",KonuId: 10),//
    TumKonular(KonuAdi: "Oran - Orantı", KonuKategori: "Matematik-TYT",KonuId: 11),//
    TumKonular(KonuAdi : "Olasılık", KonuKategori: "Matematik-TYT-AYT",KonuId:12),//
    TumKonular(KonuAdi: "Denklem Çözme", KonuKategori: "Matematik-TYT",KonuId: 13),//
    TumKonular(KonuAdi: "Kümeler", KonuKategori: "Matematik-TYT",KonuId: 14),//
    TumKonular(KonuAdi: "Kartezyen Çarpımı", KonuKategori: "Matematik-TYT",KonuId: 15),//
    TumKonular(KonuAdi: "Mantık", KonuKategori: "Matematik-TYT",KonuId: 16),//
    TumKonular(KonuAdi : "Polinomlar", KonuKategori: "Matematik-TYT-AYT",KonuId:17,KayitEdildiMi: false),    //
    TumKonular(KonuAdi : "2.Dereceden Denklemler", KonuKategori: "Matematik-TYT-AYT",KonuId:18,KayitEdildiMi: false), //
    TumKonular(KonuAdi : "Fonksiyonlar", KonuKategori: "Matematik-TYT-AYT",KonuId:19,KayitEdildiMi: false),  //
    TumKonular(KonuAdi : "Karmaşık Sayılar", KonuKategori: "Matematik-AYT",KonuId:20,KayitEdildiMi: false),
    TumKonular(KonuAdi: "İstatistik", KonuKategori: "Matematik-TYT",KonuId: 21), //
    TumKonular(KonuAdi: "Permütasyon - Kombinasyon", KonuKategori: "Matematik-TYT-AYT",KonuId:22,KayitEdildiMi: false),//
    TumKonular(KonuAdi : "Logaritma", KonuKategori: "Matematik-AYT",KonuId:23,KayitEdildiMi: false),
    TumKonular(KonuAdi : "Parabol",KonuKategori: "Matematik-AYT",KonuId:24,KayitEdildiMi: false),
    TumKonular(KonuAdi : "Trigonometri", KonuKategori: "Matematik-AYT",KonuId:25,KayitEdildiMi: false),
    TumKonular(KonuAdi : "Diziler",KonuKategori: "Matematik-AYT",KonuId:26,KayitEdildiMi: false),
    TumKonular(KonuAdi : "Limit",KonuKategori: "Matematik-AYT",KonuId:27,KayitEdildiMi: false),
    TumKonular(KonuAdi : "Türev",KonuKategori: "Matematik-AYT",KonuId:28,KayitEdildiMi: false),
    TumKonular(KonuAdi : "İntegral",KonuKategori: "Matematik-AYT",KonuId:29,KayitEdildiMi: false),

  ];
  @override
  Widget build(BuildContext context) {
    double _fontSizeQuery = MediaQuery.of(context).size.width;
    double _fontSizeHeight = MediaQuery.of(context).size.height;
    double textSize = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          child: Center(child: Padding(
            padding: EdgeInsets.only(top: _fontSizeHeight/30),
            child: Text("AYT Konular",style:
            GoogleFonts.anticSlab(fontStyle: FontStyle.normal,fontSize:textSize*23, color: Color(
                0xFA1C2F40),fontWeight:
            FontWeight.bold),),
          )),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors:
            [Color(0xFA8CC6C6),Color(0xFACDFAFA)],
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
  ListView _buildListView(){
    return ListView.builder(
      itemCount: konuBasliklarix.length,
      itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height/800,
              horizontal:MediaQuery.of(context).size.width/50),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.star),
                trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: (){
                  if(konuBasliklarix[index].KonuId==1){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return TemelKavramlarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==2){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return SayiBasamaklariMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==3){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return BolmeVeBolunebilmeMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==4){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return EbobEkokMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==5){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return RasyonelSayilarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==6){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return BasitEsitsizliklerMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==7){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return MutlakDegerMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==8){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return UsluSayilarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==9){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return KokluSayilarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==10){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return CarpanlarAyirmaMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==11){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return OranOrantiMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==12){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return OlasilikMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==13){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return DenklemCozmeMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==14){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return KumelerMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==15){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return KartezyenCarpimiMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==16){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return MantikMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==17){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return PolinomlarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==18){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return IkinciDerecedenDenklemlerMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==19){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return FonksiyonlarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==20){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return KarmasikSayilarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==21){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return IstatistikMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==22){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return PermutasyonKombinasyonMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==23){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return LogaritmaMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==24){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ParabolMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==25){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return TrigonometriMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==26){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return DizilerMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==27){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return LimitMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==28){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return TurevMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==29){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return IntegralMat();
                    }));
                  }else{
                    Container(
                      alignment: Alignment.center,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),
              title: GestureDetector(
                onTap: (){
                  if(konuBasliklarix[index].KonuId==1){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return TemelKavramlarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==2){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return SayiBasamaklariMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==3){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return BolmeVeBolunebilmeMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==4){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return EbobEkokMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==5){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return RasyonelSayilarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==6){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return BasitEsitsizliklerMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==7){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return MutlakDegerMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==8){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return UsluSayilarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==9){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return KokluSayilarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==10){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return CarpanlarAyirmaMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==11){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return OranOrantiMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==12){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return OlasilikMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==13){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return DenklemCozmeMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==14){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return KumelerMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==15){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return KartezyenCarpimiMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==16){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return MantikMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==17){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return PolinomlarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==18){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return IkinciDerecedenDenklemlerMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==19){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return FonksiyonlarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==20){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return KarmasikSayilarMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==21){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return IstatistikMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==22){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return PermutasyonKombinasyonMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==23){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return LogaritmaMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==24){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ParabolMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==25){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return TrigonometriMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==26){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return DizilerMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==27){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return LimitMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==28){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return TurevMat();
                    }));
                  }else if(konuBasliklarix[index].KonuId==29){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return IntegralMat();
                    }));
                  }else{
                    Container(
                      alignment: Alignment.center,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
                  child: Text(konuBasliklarix[index].KonuAdi,)),
            ),
          ),
        );
      },
    );
  }
  void _push(BuildContext context, Widget page){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return page;
    }));
  }
}
List<TumKonular> bosText(){
  var fa = <TumKonular>[
    TumKonular(KonuAdi : "", KonuKategori: ""),

  ];
  return fa;
}