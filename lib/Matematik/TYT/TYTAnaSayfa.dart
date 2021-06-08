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

class TYTAnaSayfaClass extends StatefulWidget {
  @override
  _TYTAnaSayfaClassState createState() => _TYTAnaSayfaClassState();
}

class _TYTAnaSayfaClassState extends State<TYTAnaSayfaClass> {

  List<TumKonular> konuBasliklari = [
    TumKonular(KonuAdi: "Temel Kavramlar", KonuKategori: "Matematik-TYT",KonuId: 17),
    TumKonular(KonuAdi: "Sayı Basamakları", KonuKategori: "Matematik-TYT",KonuId: 18),
    TumKonular(KonuAdi: "Bölme ve Bölünebilme", KonuKategori: "Matematik-TYT",KonuId: 19),
    TumKonular(KonuAdi: "Ebob - Ekok", KonuKategori: "Matematik-TYT",KonuId: 20),
    TumKonular(KonuAdi: "Rasyonel Sayılar", KonuKategori: "Matematik-TYT",KonuId: 21),
    TumKonular(KonuAdi: "Basit Eşitsizlikler", KonuKategori: "Matematik-TYT",KonuId: 22),
    TumKonular(KonuAdi: "Mutlak Değer", KonuKategori: "Matematik-TYT",KonuId: 23),
    TumKonular(KonuAdi: "Üslü Sayılar", KonuKategori: "Matematik-TYT",KonuId: 24),
    TumKonular(KonuAdi: "Köklü Sayılar", KonuKategori: "Matematik-TYT",KonuId: 25),
    TumKonular(KonuAdi: "Çarpanlara Ayırma", KonuKategori: "Matematik-TYT",KonuId: 26),
    TumKonular(KonuAdi: "Oran - Orantı", KonuKategori: "Matematik-TYT",KonuId: 27),
    TumKonular(KonuAdi : "Olasılık", KonuKategori: "Matematik-TYT-AYT",KonuId:29),
    TumKonular(KonuAdi: "Denklem Çözme", KonuKategori: "Matematik-TYT",KonuId: 28),
    TumKonular(KonuAdi: "Kümeler", KonuKategori: "Matematik-TYT",KonuId: 30),
    TumKonular(KonuAdi: "Kartezyen Çarpımı", KonuKategori: "Matematik-TYT",KonuId: 31),
    TumKonular(KonuAdi: "Mantık", KonuKategori: "Matematik-TYT",KonuId: 32),
    TumKonular(KonuAdi: "İstatistik", KonuKategori: "Matematik-TYT",KonuId: 33), //16
    TumKonular(KonuAdi : "Polinomlar", KonuKategori: "Matematik-TYT-AYT",KonuId:34),              //1 *
    TumKonular(KonuAdi : "2.Dereceden Denklemler", KonuKategori: "Matematik-TYT-AYT",KonuId:35),  //2*
    TumKonular(KonuAdi : "Fonksiyonlar", KonuKategori: "Matematik-TYT-AYT",KonuId:36),
    TumKonular(KonuAdi: "Permütasyon - Kombinasyon", KonuKategori: "Matematik-TYT-AYT",KonuId:37),
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
              leading: Icon(Icons.star),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {
                  if(konuBasliklari[index].KonuId==17){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return TemelKavramlarMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==18){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return SayiBasamaklariMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==19){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return BolmeVeBolunebilmeMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==20){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return EbobEkokMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==21){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return RasyonelSayilarMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==22){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return BasitEsitsizliklerMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==23){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return MutlakDegerMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==24){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return UsluSayilarMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==25){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return KokluSayilarMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==26){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return CarpanlarAyirmaMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==27){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return OranOrantiMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==28){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return DenklemCozmeMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==29){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return OlasilikMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==30){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return KumelerMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==31){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return KartezyenCarpimiMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==32){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return MantikMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==33){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return IstatistikMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==34){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return PolinomlarMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==35){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return IkinciDerecedenDenklemlerMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==36){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return FonksiyonlarMat();
                    }));
                  }else if(konuBasliklari[index].KonuId==37){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return PermutasyonKombinasyonMat();
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
                        return TemelKavramlarMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==18){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return SayiBasamaklariMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==19){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return BolmeVeBolunebilmeMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==20){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return EbobEkokMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==21){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return RasyonelSayilarMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==22){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return BasitEsitsizliklerMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==23){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return MutlakDegerMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==24){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return UsluSayilarMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==25){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return KokluSayilarMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==26){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return CarpanlarAyirmaMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==27){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return OranOrantiMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==28){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return DenklemCozmeMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==29){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return OlasilikMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==30){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return KumelerMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==31){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return KartezyenCarpimiMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==32){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return MantikMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==33){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return IstatistikMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==34){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return PolinomlarMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==35){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return IkinciDerecedenDenklemlerMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==36){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return FonksiyonlarMat();
                      }));
                    }else if(konuBasliklari[index].KonuId==37){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return PermutasyonKombinasyonMat();
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