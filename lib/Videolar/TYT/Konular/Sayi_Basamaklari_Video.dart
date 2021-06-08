import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Sayi_Basamaklari_Video extends StatefulWidget {
  @override
  _Sayi_Basamaklari_VideoState createState() => _Sayi_Basamaklari_VideoState();
}

class _Sayi_Basamaklari_VideoState extends State<Sayi_Basamaklari_Video> {
  final url = "https://youtu.be/5psXrtFfILo";
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
                  child: Text("Sayı Basamakları",style:
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
                            child: Text("Sayı Basamakları",
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
