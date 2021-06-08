import 'package:anlamayanyok/AnaSayfa/KonularClassOOP.dart';
import 'package:anlamayanyok/Videolar/AYT/Konular/Trigo_Videolar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Videolar_AYT extends StatefulWidget {
  @override
  _Videolar_AYTState createState() => _Videolar_AYTState();
}

class _Videolar_AYTState extends State<Videolar_AYT> {
  List<TumKonular> konuBasliklarix = [
    TumKonular(KonuAdi : "Trigonometri", KonuKategori: "Matematik-AYT",KonuId:12,KayitEdildiMi: false),
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
            child: Text("AYT Videolar",style:
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
              leading: IconButton(
                icon: Icon(Icons.video_library_rounded),
                onPressed: (){
                  if(konuBasliklarix[index].KonuId==1){

                  }else if(konuBasliklarix[index].KonuId==2){

                  }else if(konuBasliklarix[index].KonuId==3){

                  }else if(konuBasliklarix[index].KonuId==4){

                  }else if(konuBasliklarix[index].KonuId==5){

                  }else if(konuBasliklarix[index].KonuId==6){

                  }else if(konuBasliklarix[index].KonuId==7){

                  }else if(konuBasliklarix[index].KonuId==8){

                  }else if(konuBasliklarix[index].KonuId==9){

                  }else if(konuBasliklarix[index].KonuId==10){

                  }else if(konuBasliklarix[index].KonuId==11){

                  }else if(konuBasliklarix[index].KonuId==12){

                  }else if(konuBasliklarix[index].KonuId==13){

                  }else if(konuBasliklarix[index].KonuId==14){

                  }else if(konuBasliklarix[index].KonuId==15){

                  }else if(konuBasliklarix[index].KonuId==16){

                  }else{
                    Container(
                      alignment: Alignment.center,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: (){
                  if(konuBasliklarix[index].KonuId==12){
                    _push(context, Trigo_Videolar());
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
                    if(konuBasliklarix[index].KonuId==12){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Trigo_Videolar();
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
