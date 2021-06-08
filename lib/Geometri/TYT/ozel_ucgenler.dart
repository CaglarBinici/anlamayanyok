import 'dart:io';

import 'package:anlamayanyok/SQLite%20Veritaban%C4%B1/Kisilerdao.dart';
import 'package:anlamayanyok/SQLite%20Veritaban%C4%B1/Notlar.dart';
import 'package:anlamayanyok/PdfViewer/pdf_api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../PdfViewer/pdf_viewer_page.dart';
class Ozel_Ucgenler_Class extends StatefulWidget {
  @override
  _Ozel_Ucgenler_ClassState createState() => _Ozel_Ucgenler_ClassState();
}

class _Ozel_Ucgenler_ClassState extends State<Ozel_Ucgenler_Class> {
  bool progressDurumu = false;
  final TextEditingController _baslik = TextEditingController();
  final TextEditingController _not = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    kisiGetir();
  }
  // ignore: missing_return
  Future<DersNotlar> kisiGetir()async{
    var kisi = await Kisilerdao().kisiGetir(15);
    print("*********");
    print("${kisi.baslik_id}");
    print(kisi.baslik);
    print(kisi.Not);
    _baslik.text = kisi.baslik;
    _not.text = kisi.Not;
    setState(() {
    });
  }
  Future<void> kisileriGoster() async {
    var liste = await Kisilerdao().tumKisiler();
    for(DersNotlar k in liste){
      print("*********");
      print("ID: ${k.baslik_id}");
      print("Başlık adı: ${k.baslik}");
      print("Not: ${k.Not}");
    }

  }
  Future<void>guncelle() async{
    await Kisilerdao().kisiGuncelle(15, _baslik.text, _not.text);
  }
  bool kaydetbutonu = false;
  bool kaydetbutonu1= false;
  bool notEklediMi = false;
  double _fontSizeQuery;
  double _fontSizeHeight;
  double textSize;
  @override
  Widget build(BuildContext context) {
    _fontSizeQuery = MediaQuery.of(context).size.width;
    _fontSizeHeight = MediaQuery.of(context).size.height;
    textSize = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            child: Center(child: Padding(
              padding: EdgeInsets.only(top: _fontSizeHeight/ 30),
              child: Text("Özel Üçgenler", style:
              GoogleFonts.anticSlab(fontStyle: FontStyle.normal,
                  fontSize: textSize* 23, color: Color(0xFA1C2F40),
                  fontWeight: FontWeight.bold),),
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: _fontSizeHeight/15),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: _fontSizeQuery/16),
                          child: Text("Ders Notlarım", style: GoogleFonts.cinzel(
                            fontStyle: FontStyle.normal,
                            fontSize: textSize * 28,
                          ),),
                        ),
                        SizedBox(width: _fontSizeQuery*0.13,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              if(notEklediMi == false){
                                setState(() {
                                  notEklediMi = true;
                                });
                              }else{
                                setState(() {
                                  notEklediMi = false;
                                });
                              }
                            });
                          },
                          onLongPress: (){
                            Text("Not ekle");
                          },
                          child: (_baslik.text.isNotEmpty && _not.text.isNotEmpty) ? Icon(Icons.edit, size:_fontSizeQuery/13)
                              : Icon(Icons.add_circle,
                              size: _fontSizeQuery/13),
                        ),
                        SizedBox(width: _fontSizeQuery/25,)
                      ],
                    ),
                  ),
                  notEklediMi ?
                  NotEkle():
                  (_baslik.text.isNotEmpty) ? Gosterim()
                      :Container(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _fontSizeHeight/1.8),
              child: Center(
                child: GestureDetector(
                  onTap: () async{
                    setState(() {
                      progressDurumu = true;
                    });
                    try{
                      final url = 'geometri_pdf/tyt/özel_ücgenler.pdf';
                      final file = await PDFApi.loadFirebase(url);
                      if(file == null) return;
                      openPDF(context, file);
                    }catch(e){

                    }
                    setState(() {
                      progressDurumu = false;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: _fontSizeHeight/16,
                    width: _fontSizeQuery/2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFA5F5FF6),
                          Color(0xFA4747F6),
                          Color(0xFA4141F8),
                          Color(0xFA2D2DF5),
                        ],
                        stops: [0.1, 0.4, 0.7, 0.9],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: progressDurumu ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ):Center(
                      child: Text("Öğrenmeye Başla",style: TextStyle(
                          color: Colors.white,
                          fontSize: textSize*14
                      ),),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
  // ignore: non_constant_identifier_names
  Widget NotEkle(){
    return Form(
      key: _formKey,
      child: Container(
        height: _fontSizeHeight*0.45,
        width: _fontSizeQuery*0.80,
        color: Colors.white60,
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: _fontSizeQuery*0.06,vertical: _fontSizeHeight/70),
              child: TextField(
                controller: _baslik,
                maxLength: 15,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Başlık"
                ),
                onChanged: (index){
                  setState(() {
                    if(_baslik.text.length>=2){
                      setState(() {
                        kaydetbutonu = true;
                      });
                    }
                    else{
                      setState(() {
                        kaydetbutonu = false;
                      });
                    }
                  });
                },
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: _fontSizeQuery*0.06,vertical: _fontSizeHeight*0.01),
              child: TextField(
                maxLines: 4,
                maxLength: 100,
                controller: _not,
                decoration: InputDecoration(
                  labelText: "Not Ekle",
                  hintText: "Buraya yazınız.",
                  border: OutlineInputBorder(),
                ),
                onChanged: (index){
                  setState(() {
                    if(_not.text.length>=2){
                      setState(() {
                        kaydetbutonu1=true;
                      });
                    }
                    else{
                      setState(() {
                        kaydetbutonu1 = false;
                      });
                    }
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: (){
                    setState(() {
                      notEklediMi =false;
                    });
                  },
                  child: Container(
                    color: Colors.blueGrey,
                    height: _fontSizeHeight*0.05,
                    width: _fontSizeQuery*0.25,
                    child: Center(child: Text("İptal",style: TextStyle(
                        color: Colors.white
                    ),
                    )
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    setState(() async {
                      setState(() {
                        notEklediMi =false;
                      });
                      guncelle();
                    });
                  },
                  child: Container(
                    color: Colors.blue,
                    height: _fontSizeHeight*0.05,
                    width: _fontSizeQuery*0.25,
                    child: Center(child: Text("Kaydet",style: TextStyle(
                        color: Colors.white
                    ),
                    )
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  Widget Gosterim(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _fontSizeQuery*0.05),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _fontSizeQuery*0.06),
          child: SizedBox(
            height: _fontSizeHeight*0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(_baslik.text,style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                Container(
                  width: _fontSizeQuery*0.10,
                ),
                Expanded(
                  child: (_not.text.length>=1) ? Text(_not.text,style: TextStyle(
                  ),) : GestureDetector(
                    onTap: (){
                      setState(() {
                        if(notEklediMi == false){
                          setState(() {
                            notEklediMi = true;
                          });
                        }else{
                          setState(() {
                            notEklediMi = false;
                          });
                        }
                      });
                    },
                    child: Text("Lütfen not giriniz",style: TextStyle(
                        color: Colors.black54
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
  );
}
