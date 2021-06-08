import 'package:anlamayanyok/Videolar/AYT/Konular/Trigo_Videolar3.dart';
import 'package:anlamayanyok/Videolar/AYT/Konular/Trigo_Videolar4.dart';
import 'package:anlamayanyok/Videolar/AYT/Konular/Trigo_Videolar5.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Trigo_Videolar.dart';
class Trigo_Videolar2 extends StatefulWidget {
  @override
  _Trigo_Videolar2State createState() => _Trigo_Videolar2State();
}

class _Trigo_Videolar2State extends State<Trigo_Videolar2> {
  final url = "https://youtu.be/rqas_fGmAck";
  YoutubePlayerController _controller;
  void runYoutubePlayer(){
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url),
        flags: YoutubePlayerFlags(
            enableCaption: true,
            isLive: false,
            autoPlay: false
        )
    );
  }
  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    double _fontSizeQuery = MediaQuery.of(context).size.width;
    double _fontSizeHeight = MediaQuery.of(context).size.height;
    double textSize = MediaQuery.of(context).textScaleFactor;
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller:_controller,
        ),
        builder: (context, player){
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                child: Center(child: Padding(
                  padding: EdgeInsets.only(top:_fontSizeHeight/30),
                  child: Text("Trigonometri",style:
                  GoogleFonts.cinzel(fontStyle: FontStyle.normal,fontSize:textSize*23, color: Color(
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
                SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height:_fontSizeHeight/85,),
                      player,
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: _fontSizeQuery/15,top: _fontSizeHeight/55,bottom: _fontSizeHeight/55),
                            child: Text("Trigonometri 2",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: textSize*23,
                              ),),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _fontSizeHeight/45),
                        child: Center(
                          child: GestureDetector(
                            onTap: (){
                              _push(context, Trigo_Videolar());
                            },
                            child: Container(
                              height: _fontSizeHeight*.080,
                              width: _fontSizeQuery*.750,
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
                              child: Center(child: Text("Trigonometri 1",style: GoogleFonts.cinzel(
                                  fontStyle: FontStyle.normal,fontSize: textSize*23,color: Color( 0xFA012323)),)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _fontSizeHeight/45),
                        child: Center(
                          child: GestureDetector(
                            onTap: (){
                              _push(context, Trigo_Videolar3());
                            },
                            child: Container(
                              height: _fontSizeHeight*.080,
                              width: _fontSizeQuery*.750,
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
                              child: Center(child: Text("Trigonometri 3",style: GoogleFonts.cinzel(
                                  fontStyle: FontStyle.normal,fontSize: textSize*23,color: Color( 0xFA012323)),)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _fontSizeHeight/45),
                        child: Center(
                          child: GestureDetector(
                            onTap: (){
                              _push(context, Trigo_Videolar4());
                            },
                            child: Container(
                              height: _fontSizeHeight*.080,
                              width: _fontSizeQuery*.750,
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
                              child: Center(child: Text("Trigonometri 4",style: GoogleFonts.cinzel(
                                  fontStyle: FontStyle.normal,fontSize: textSize*23,color: Color( 0xFA012323)),)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _fontSizeHeight/45),
                        child: Center(
                          child: GestureDetector(
                            onTap: (){
                              _push(context, Trigo_Videolar5());
                            },
                            child: Container(
                              height: _fontSizeHeight*.080,
                              width: _fontSizeQuery*.750,
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
                              child: Center(child: Text("Trigonometri 5",style: GoogleFonts.cinzel(
                                  fontStyle: FontStyle.normal,fontSize: textSize*23,color: Color( 0xFA012323)),)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
  void _push(BuildContext context, Widget page){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return page;
    }));
  }
}
