class TumKonular {
  final String KonuKategori;
   String KonuAdi;
  final String bos;
  final int KonuId;
  bool KayitEdildiMi = false;
  TumKonular({
    this.KonuAdi,
    this.KonuKategori,
    this.bos,
    this.KayitEdildiMi,
    this.KonuId,
  });
}

List<TumKonular> BosText(){
  var fa = <TumKonular>[
    TumKonular(KonuAdi : "", KonuKategori: ""),

  ];
  return fa;
}
List<TumKonular> konuBasliklari()  {
  var fi = <TumKonular>[
  //MATEMATİK
    //AYT KONULARI / MATEMATİK
  TumKonular(KonuAdi : "polinomlar", KonuKategori: "Matematik-TYT-AYT",KonuId:1),              //1 *
  TumKonular(KonuAdi : "2.dereceden denklemler", KonuKategori: "Matematik-TYT-AYT",KonuId:2),  //2*
  TumKonular(KonuAdi : "fonksiyonlar", KonuKategori: "Matematik-TYT-AYT",KonuId:3),            //3*
  TumKonular(KonuAdi : "karmaşık sayılar", KonuKategori: "Matematik-AYT",KonuId:4),        //4
  TumKonular(KonuAdi : "olasılık", KonuKategori: "Matematik-TYT-AYT",KonuId:5), //5*
  TumKonular(KonuAdi : "binom", KonuKategori: "Matematik-AYT",KonuId:6), //5
  TumKonular(KonuAdi: "permütasyon - kombinasyon", KonuKategori: "Matematik-TYT-AYT",KonuId:7),//6*
  TumKonular(KonuAdi : "logaritma", KonuKategori: "Matematik-AYT",KonuId:8),               //7
  TumKonular(KonuAdi : "özel tanımlı fonksiyon", KonuKategori: "Matematik-AYT",KonuId:9),  //8
  TumKonular(KonuAdi : "parabol",KonuKategori: "Matematik-AYT",KonuId:10),                  //9
  TumKonular(KonuAdi : "eşitsizlikler", KonuKategori: "Matematik-AYT",KonuId:11),           //10
  TumKonular(KonuAdi : "trigonometri", KonuKategori: "Matematik-AYT",KonuId:12),           //11
  TumKonular(KonuAdi : "diziler",KonuKategori: "Matematik-AYT",KonuId:13),                 //12
  TumKonular(KonuAdi : "limit",KonuKategori: "Matematik-AYT",KonuId:14),                   //13
  TumKonular(KonuAdi : "türev",KonuKategori: "Matematik-AYT",KonuId:15),                   //14
  TumKonular(KonuAdi : "integral",KonuKategori: "Matematik-AYT",KonuId:16), //15

    //TYT KONULARI / MATEMATİK
  TumKonular(KonuAdi: "temel kavramlar", KonuKategori: "Matematik-TYT",KonuId: 17),
  TumKonular(KonuAdi: "sayı basamakları", KonuKategori: "Matematik-TYT",KonuId: 18),
    TumKonular(KonuAdi: "bölme ve bölünebilme", KonuKategori: "Matematik-TYT",KonuId: 19),
    TumKonular(KonuAdi: "ebob - ekok", KonuKategori: "Matematik-TYT",KonuId: 20),
    TumKonular(KonuAdi: "rasyonel sayılar", KonuKategori: "Matematik-TYT",KonuId: 21),
    TumKonular(KonuAdi: "basit eşitsizlikler", KonuKategori: "Matematik-TYT",KonuId: 22),
    TumKonular(KonuAdi: "mutlak değer", KonuKategori: "Matematik-TYT",KonuId: 23),
    TumKonular(KonuAdi: "üslü sayılar", KonuKategori: "Matematik-TYT",KonuId: 24),
    TumKonular(KonuAdi: "köklü sayılar", KonuKategori: "Matematik-TYT",KonuId: 25),
    TumKonular(KonuAdi: "çarpanlara ayırma", KonuKategori: "Matematik-TYT",KonuId: 26),
    TumKonular(KonuAdi: "oran - orantı", KonuKategori: "Matematik-TYT",KonuId: 27),
    TumKonular(KonuAdi: "denklem çözme", KonuKategori: "Matematik-TYT",KonuId: 28),
    TumKonular(KonuAdi: "problemler", KonuKategori: "Matematik-TYT",KonuId: 29),
    TumKonular(KonuAdi: "kümeler", KonuKategori: "Matematik-TYT",KonuId: 30),
    TumKonular(KonuAdi: "kartezyen çarpımı", KonuKategori: "Matematik-TYT",KonuId: 31),
    TumKonular(KonuAdi: "mantık", KonuKategori: "Matematik-TYT",KonuId: 32),
    TumKonular(KonuAdi: "istatistik", KonuKategori: "Matematik-TYT",KonuId: 33),

    //TYT KONULARI / GEOMETRİ

    TumKonular(KonuAdi: "temel kavramlar", KonuKategori: "Geometri-TYT", KonuId:34),
    TumKonular(KonuAdi: "üçgende açılar", KonuKategori: "Geometri-TYT", KonuId:35),
    TumKonular(KonuAdi: "özel üçgenler", KonuKategori: "Geometri-TYT", KonuId:36),
    TumKonular(KonuAdi: "açıortay", KonuKategori: "Geometri-TYT", KonuId:37),
    TumKonular(KonuAdi: "kenarortay", KonuKategori: "Geometri-TYT", KonuId:38),
    TumKonular(KonuAdi: "üçgende alan", KonuKategori: "Geometri-TYT", KonuId:39),
    TumKonular(KonuAdi: "üçgende benzerlik", KonuKategori: "Geometri-TYT", KonuId:40),
    TumKonular(KonuAdi: "açı kenar bağıntıları", KonuKategori: "Geometri-TYT", KonuId:41),
    TumKonular(KonuAdi: "çokgenler", KonuKategori: "Geometri-TYT", KonuId:42),
    TumKonular(KonuAdi: "dörtgenler", KonuKategori: "Geometri-TYT", KonuId:43),
    TumKonular(KonuAdi: "deltoid", KonuKategori: "Geometri-TYT", KonuId:44),
    TumKonular(KonuAdi: "paralelkenar", KonuKategori: "Geometri-TYT", KonuId:45),
    TumKonular(KonuAdi: "eşkenar dörtgen", KonuKategori: "Geometri-TYT", KonuId:46),
    TumKonular(KonuAdi: "dikdörtgen", KonuKategori: "Geometri-TYT", KonuId:47),
    TumKonular(KonuAdi: "kare", KonuKategori: "Geometri-TYT", KonuId:48),
    TumKonular(KonuAdi: "yamuk", KonuKategori: "Geometri-TYT", KonuId:49),
    TumKonular(KonuAdi: "çember ve daire", KonuKategori: "Geometri-TYT", KonuId:50),
    TumKonular(KonuAdi: "noktanın analitiği", KonuKategori: "Geometri-TYT", KonuId:51),
    TumKonular(KonuAdi: "doğrunun analitiği", KonuKategori: "Geometri-TYT", KonuId:52),
    TumKonular(KonuAdi: "dikdörtgenler prizması", KonuKategori: "Geometri-TYT", KonuId:53),
    TumKonular(KonuAdi: "küp", KonuKategori: "Geometri-TYT", KonuId:54),
    TumKonular(KonuAdi: "silindir", KonuKategori: "Geometri-TYT", KonuId:55),
    TumKonular(KonuAdi: "piramit", KonuKategori: "Geometri-TYT", KonuId:56),
    TumKonular(KonuAdi: "koni", KonuKategori: "Geometri-TYT", KonuId:57),
    TumKonular(KonuAdi: "küre", KonuKategori: "Geometri-TYT", KonuId:58),
    

  ];
  return fi;
}