import 'package:anlamayanyok/Geometri/AYT/Geometri_ayt_class.dart';
import 'package:anlamayanyok/Geometri/TYT/Geometri_tyt_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class GeometriSayfaClass extends StatefulWidget {
  @override
  _GeometriSayfaClassState createState() => _GeometriSayfaClassState();
}

class _GeometriSayfaClassState extends State<GeometriSayfaClass> {
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
            child: Text("Anlamayan Yok",style:
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
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: _fontSizeHeight/9),
                child: Text("GEOMETRİ",style: GoogleFonts.cinzel(fontStyle: FontStyle.normal,
                    fontSize: textSize*27),),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: _fontSizeHeight/4.7),
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      _push(context, Geometri_TYT_Class());
                    },
                    child: Container(
                      height: _fontSizeHeight*.180,
                      width: _fontSizeQuery*.590,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFAE0E2E2),
                            Color(0xFADDDEDE),
                            Color(0xFACBCDCD),
                            Color(0xFAC7C9C9),
                          ],
                          stops: [0.1, 0.4, 0.7, 0.9],
                        ),
                        color: Color(0xFADCE3E3),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(child: Text("TYT",style: GoogleFonts.cinzel(
                          fontStyle: FontStyle.normal,fontSize: textSize*23,color: Color( 0xFA012323)),)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: _fontSizeHeight/2.20),
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                     _push(context, Geometri_ayt_class());
                    },
                    child: Container(
                      height: _fontSizeHeight*.180,
                      width: _fontSizeQuery*.590,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFAE0E2E2),
                            Color(0xFADDDEDE),
                            Color(0xFACBCDCD),
                            Color(0xFAC7C9C9),
                          ],
                          stops: [0.1, 0.4, 0.7, 0.9],
                        ),
                        color: Color(0xFADCE3E3),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(child: Text("AYT",style: GoogleFonts.cinzel(
                          fontStyle: FontStyle.normal,fontSize: textSize*23,color: Color(
                          0xFA012323)),)),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  void _push(BuildContext context, Widget page){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return page;
    }));
  }
}
