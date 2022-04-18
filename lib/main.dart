import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Lato',
      ),
      debugShowCheckedModeBanner: false,
      home: const MyAppToo(),
    );
  }
}

class MyAppToo extends StatefulWidget {
  const MyAppToo({Key? key}) : super(key: key);
  @override
  State<MyAppToo> createState() => _MyAppTooState();
}

class _MyAppTooState extends State<MyAppToo> {
  bool playing = false;
  double speedRate = 1.0;

  late AudioPlayer _player;
  late AudioCache cache;

  Duration position = const Duration();
  Duration musicLength = const Duration();

  Widget slider() {
    return SizedBox(
      width: 300,
      child: Slider.adaptive(
        activeColor: Colors.white,
        inactiveColor: Colors.white54,
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value.toInt());
        },
      ),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    _player.onDurationChanged.listen((d) {
      setState(() {
        musicLength = d;
      });
    });

    _player.onAudioPositionChanged.listen((d) {
      setState(() {
        position = d;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cerita Rakyat"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20
        ),
        children: [
          const Text(
            "Malin Kundang",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset("./assets/images/image1.jpeg"),
          const SizedBox(
            height: 10,
          ),
          const Text(
            """
              Cerita Malin Kundang berasal dari daerah Sumatera Barat. Dalam kisah ini diceritakan hidup seorang ibu dan putranya yang bernama Malin Kundang.

              Kehidupan ibu dan anak ini serba kekurangan. Meski begitu, sang ibu selalu berusaha keras untuk memberikan kehidupan yang layak untuk anak laki-lakinya.

              Ketika Malin beranjak dewasa, dia pergi merantau bersama seorang saudagar kaya. Ia pun berjanji akan pulang dan menjemput ibunya setelah kaya raya.

              "Malin akan pulang setelah berhasil. Malin akan menjemput ibu. Doakan Malin ya," katanya pada sang ibu sebelum pergi.
            """,
            style: TextStyle(
              fontSize: 16
            ),
          ),
          Image.asset("./assets/images/image2.jpg"),
          const SizedBox(
            height: 10,
          ),
          const Text(
            """
              Bertahun-tahun kemudian, Malin Kundang berhasil menjadi pedagang yang kaya. Ia pun menikah dengan putri seorang kepala kampung. Sayangnya, kehidupannya yang bergelimpang harta membuat Malin lupa dengan sang ibu. Ia malah berbohong kepada istrinya dan mengaku bahwa ibunya telah meninggal dunia.

              Suatu hari, Malin dan istrinya terpaksa berlabuh ke pulau tempat kampung halamannya karena cuaca buruk. Istri Malin juga meminta suaminya untuk turun ke pulau dan membeli beberapa ikan. Malin cemas karena dia takut bertemu ibunya.

              Saat dia turun dari kapal, semua orang menyambutnya 'saudagar kaya'. Tak jauh dari situ, ibu Malin yang kebetulan sedang membantu nelayan, melihat sosok putranya. Ia lalu mendekat untuk memastikannya.
            """,
            style: TextStyle(
              fontSize: 16
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset("./assets/images/image3.jpg"),
          const SizedBox(
            height: 10,
          ),
          const Text(
            """
              "Malin...Malin Kundang anakku," kata sang ibu sembari langsung memeluk Malin.

              "Hei, kau wanita tua, siapa kau hingga berani memanggilku anakmu?", saut malin dengan tegas

              Istri Malin lalu berusaha menengahi dan meminta sang ibu menunjukkan bukti bahwa Malin adalah anaknya. Ibu Malin pun mengatakan mengenai luka di tangan Malin yang telah ada sejak kecil. Istri Malin pun menyadari bahwa ucapan wanita tua di hadapannya memang benar.

              "Suamiku, mengapa kau mengingkari ibumu sendiri?" tanya istri Malin.
            """,
            style: TextStyle(
              fontSize: 16
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset("./assets/images/image4.jpg"),
          const SizedBox(
            height: 10,
          ),
          const Text(
            """
              Malin Kundang tak peduli dan tetap tak ingin mengakui ibunya. Sang ibu lalu meratap dan tepat saat itu hujan deras. Tiba-tiba petir menyambar tepat di kaki Malin dan mendadak tubuhnya menjadi kaku seperti batu. Malin amat ketakutan dan dia menyadari telah durhaka dan berdosa pada ibunya.

              "Ibu, tolong ampuni aku. Tolong selamatkan aku," teriak Malin.

              Ibu Malin berusaha menolong napi na’as watu sudah   terlambat karena anaknya sudah berubah menjadi batu. Dari cerita ini, pesan moral yang kita dapat adalah jangan sekali sekali melupakan orang tua kita, orang tua yang melahirkan, dan membesarkan kita. Apapun keadaannya 
            """,
            style: TextStyle(
              fontSize: 16
            ),
          ),
          const SizedBox(
            height: 130,
          )
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        height:130,
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
                slider(),
                Text(
                  "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                  style: const TextStyle(
                    color: Colors.white
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 40,
                  color: Colors.white70,
                  onPressed: () {
                    if (playing) {
                      _player.stop();
                      cache.play("../assets/musics/music.mp3");
                    }
                  },
                  icon: const Icon(Icons.replay),
                ),
                IconButton(
                  iconSize: 62,
                  color: Colors.white,
                  onPressed: () {
                    if (!playing) {
                      cache.play("../assets/musics/music.mp3");
                      setState(() {
                        playing = true;
                      });
                    } else {
                      setState(() {
                        _player.pause();
                        playing = false;
                      });
                    }
                  },
                  icon: ((playing)
                      ? const Icon(Icons.pause_outlined)
                      : const Icon(Icons.play_arrow)),
                ),
                IconButton(
                  iconSize: 45,
                  onPressed: () {
                    if (playing && speedRate < 4) {
                      setState(() {
                        speedRate += 1;
                        _player.setPlaybackRate(speedRate);
                      });
                    } else if (playing && speedRate == 4) {
                      setState(() {
                        speedRate = 1;
                        _player.setPlaybackRate(speedRate);
                      });
                    }
                  },
                  icon: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.white70, width: 3),
                        borderRadius: BorderRadius.circular(35)),
                    child: Center(
                      child: Text(
                        "${speedRate.toInt()}x",
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
