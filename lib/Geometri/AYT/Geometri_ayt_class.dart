import 'package:anlamayanyok/Geometri/AYT/Cember_analitigi.dart';
import 'package:anlamayanyok/Geometri/AYT/Donusum_Geometrisi.dart';
import 'package:anlamayanyok/Geometri/TYT/%C3%9C%C3%A7gende%20Alan.dart';
import 'package:anlamayanyok/Geometri/TYT/Aciortay_class.dart';
import 'package:anlamayanyok/Geometri/TYT/Kati_cisimler.dart';
import 'package:anlamayanyok/Geometri/TYT/Kenarortay.dart';
import 'package:anlamayanyok/Geometri/TYT/Ucgende_benzerlik.dart';
import 'package:anlamayanyok/Geometri/TYT/aci_kenar_ba%C4%9F%C4%B1nt%C4%B1lar%C4%B1.dart';
import 'package:anlamayanyok/Geometri/TYT/cember_Ve_daire.dart';
import 'package:anlamayanyok/Geometri/TYT/cokgenler.dart';
import 'package:anlamayanyok/Geometri/TYT/deltoid.dart';
import 'package:anlamayanyok/Geometri/TYT/dikdortgen.dart';
import 'package:anlamayanyok/Geometri/TYT/dogrunun_analitigi.dart';
import 'package:anlamayanyok/Geometri/TYT/dortgenler.dart';
import 'package:anlamayanyok/Geometri/TYT/eskenar_dortgen.dart';
import 'package:anlamayanyok/Geometri/TYT/kare.dart';
import 'package:anlamayanyok/Geometri/TYT/noktanin_analitigi.dart';
import 'package:anlamayanyok/Geometri/TYT/ozel_ucgenler.dart';
import 'package:anlamayanyok/Geometri/TYT/paralelkenar.dart';
import 'package:anlamayanyok/Geometri/TYT/temel_kavramlar_geo.dart';
import 'package:anlamayanyok/Geometri/TYT/ucgende_acilar.dart';
import 'package:anlamayanyok/Geometri/TYT/yamuk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../AnaSayfa/KonularClassOOP.dart';
class Geometri_ayt_class extends StatefulWidget {
  @override
  _Geometri_ayt_classState createState() => _Geometri_ayt_classState();
}

class _Geometri_ayt_classState extends State<Geometri_ayt_class> {
  List<TumKonular> konuBasliklari = [
    TumKonular(KonuAdi: "Temel Kavramlar", KonuKategori: "Geometri-TYT", KonuId:34),
    TumKonular(KonuAdi: "Üçgende Açılar", KonuKategori: "Geometri-TYT", KonuId:35),
    TumKonular(KonuAdi: "Özel Üçgenler", KonuKategori: "Geometri-TYT", KonuId:36),
    TumKonular(KonuAdi: "Açıortay", KonuKategori: "Geometri-TYT", KonuId:37),
    TumKonular(KonuAdi: "Kenarortay", KonuKategori: "Geometri-TYT", KonuId:38),
    TumKonular(KonuAdi: "Üçgende Alan", KonuKategori: "Geometri-TYT", KonuId:39),
    TumKonular(KonuAdi: "Üçgende Benzerlik", KonuKategori: "Geometri-TYT", KonuId:40),
    TumKonular(KonuAdi: "Açı Kenar Bağıntıları", KonuKategori: "Geometri-TYT", KonuId:41),
    TumKonular(KonuAdi: "Çokgenler", KonuKategori: "Geometri-TYT", KonuId:42),
    TumKonular(KonuAdi: "Dörtgenler", KonuKategori: "Geometri-TYT", KonuId:43),
    TumKonular(KonuAdi: "Deltoid", KonuKategori: "Geometri-TYT", KonuId:44),
    TumKonular(KonuAdi: "Paralelkenar", KonuKategori: "Geometri-TYT", KonuId:45),
    TumKonular(KonuAdi: "Eşkenar Dörtgen", KonuKategori: "Geometri-TYT", KonuId:46),
    TumKonular(KonuAdi: "Dikdörtgen", KonuKategori: "Geometri-TYT", KonuId:47),
    TumKonular(KonuAdi: "Kare", KonuKategori: "Geometri-TYT", KonuId:48),
    TumKonular(KonuAdi: "Yamuk", KonuKategori: "Geometri-TYT", KonuId:49),
    TumKonular(KonuAdi: "Çember ve Daire", KonuKategori: "Geometri-TYT", KonuId:50),
    TumKonular(KonuAdi: "Noktanın Analitiği", KonuKategori: "Geometri-TYT", KonuId:51),
    TumKonular(KonuAdi: "Doğrunun Analitiği", KonuKategori: "Geometri-TYT", KonuId:52),
    TumKonular(KonuAdi: "Katı Cisimler", KonuKategori: "Geometri-TYT", KonuId:53),
    TumKonular(KonuAdi: "Çember Analitiği", KonuKategori: "Geometri-AYT", KonuId:54),
    TumKonular(KonuAdi: "Dönüşüm Geometrisi", KonuKategori: "Geometri-AYT", KonuId:55),
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
              leading: Icon(Icons.star),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {
                  if(konuBasliklari[index].KonuId==34){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Temel_Kavramlar_Geometri();
                    }));
                  }else if(konuBasliklari[index].KonuId==35){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Ucgende_acilar();
                    }));
                  }else if(konuBasliklari[index].KonuId==36){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Ozel_Ucgenler_Class();
                    }));
                  }else if(konuBasliklari[index].KonuId==37){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return AciOrtay_Class();
                    }));
                  }else if(konuBasliklari[index].KonuId==38){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Kenarortay();
                    }));
                  }else if(konuBasliklari[index].KonuId==39){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Ucgende_Alan();
                    }));
                  }else if(konuBasliklari[index].KonuId==40){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Ucgende_benzerlik();
                    }));
                  }else if(konuBasliklari[index].KonuId==41){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return aci_kenar_bagintilari();
                    }));
                  }else if(konuBasliklari[index].KonuId==42){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Cokgenler();
                    }));
                  }else if(konuBasliklari[index].KonuId==43){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Dortgenler_class();
                    }));
                  }else if(konuBasliklari[index].KonuId==44){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Deltoid();
                    }));
                  }else if(konuBasliklari[index].KonuId==45){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return paralel_kenar();
                    }));
                  }else if(konuBasliklari[index].KonuId==46){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return eskenar_dortgen();
                    }));
                  }else if(konuBasliklari[index].KonuId==47){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return dikdortgen();
                    }));
                  }else if(konuBasliklari[index].KonuId==48){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return kare();
                    }));
                  }else if(konuBasliklari[index].KonuId==49){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return yamuk();
                    }));
                  }else if(konuBasliklari[index].KonuId==50){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return cember_Ve_daire();
                    }));
                  }else if(konuBasliklari[index].KonuId==51){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return noktanin_analitigi();
                    }));
                  }else if(konuBasliklari[index].KonuId==52){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return dogrunun_analitigi();
                    }));
                  }else if(konuBasliklari[index].KonuId==53){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Kati_cisimler();
                    }));
                  } else if(konuBasliklari[index].KonuId==54){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Cember_analitigi(); //Çember Analitiği
                    }));
                  }
                  else if(konuBasliklari[index].KonuId==55){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Donusum_Geometrisi(); //Dönüşüm Geometrisi
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
                    if(konuBasliklari[index].KonuId==34){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Temel_Kavramlar_Geometri();
                      }));
                    }else if(konuBasliklari[index].KonuId==35){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Ucgende_acilar();
                      }));
                    }else if(konuBasliklari[index].KonuId==36){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Ozel_Ucgenler_Class();
                      }));
                    }else if(konuBasliklari[index].KonuId==37){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return AciOrtay_Class();
                      }));
                    }else if(konuBasliklari[index].KonuId==38){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Kenarortay();
                      }));
                    }else if(konuBasliklari[index].KonuId==39){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Ucgende_Alan();
                      }));
                    }else if(konuBasliklari[index].KonuId==40){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Ucgende_benzerlik();
                      }));
                    }else if(konuBasliklari[index].KonuId==41){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return aci_kenar_bagintilari();
                      }));
                    }else if(konuBasliklari[index].KonuId==42){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Cokgenler();
                      }));
                    }else if(konuBasliklari[index].KonuId==43){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Dortgenler_class();
                      }));
                    }else if(konuBasliklari[index].KonuId==44){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Deltoid();
                      }));
                    }else if(konuBasliklari[index].KonuId==45){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return paralel_kenar();
                      }));
                    }else if(konuBasliklari[index].KonuId==46){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return eskenar_dortgen();
                      }));
                    }else if(konuBasliklari[index].KonuId==47){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return dikdortgen();
                      }));
                    }else if(konuBasliklari[index].KonuId==48){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return kare();
                      }));
                    }else if(konuBasliklari[index].KonuId==49){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return yamuk();
                      }));
                    }else if(konuBasliklari[index].KonuId==50){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return cember_Ve_daire();
                      }));
                    }else if(konuBasliklari[index].KonuId==51){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return noktanin_analitigi();
                      }));
                    }else if(konuBasliklari[index].KonuId==52){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return dogrunun_analitigi();
                      }));
                    }else if(konuBasliklari[index].KonuId==53){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Kati_cisimler();
                      }));
                    }
                    else if(konuBasliklari[index].KonuId==54){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Cember_analitigi(); //Çember Analitiği
                      }));
                    }
                    else if(konuBasliklari[index].KonuId==55){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Donusum_Geometrisi(); //Dönüşüm Geometrisi
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
