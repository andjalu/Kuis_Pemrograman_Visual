import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();

  var _nama = "";
  String pilihanWaktu = "6";

  @override
  void dispose() {
    // controller dibersihkan saat widget dibuang
    textEditController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> waktu = [];
    var itm1 =
        const DropdownMenuItem<String>(value: "6", child: Text("6 bulan"));
    var itm2 =
        const DropdownMenuItem<String>(value: "12", child: Text("1 tahun"));
    waktu.add(itm1);
    waktu.add(itm2);

    return MaterialApp(
      title: 'Quiz Flutter',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                alignment: Alignment.center,
                child: Column(children: [
                  DropdownButton(
                    value: pilihanWaktu,
                    items: waktu,
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue != null) {
                          pilihanWaktu = newValue;
                        }
                      });
                    },
                  ),
                ]),
              ),
              // card 1
              Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(border: Border.all()),
                  alignment: Alignment.center,
                  child: Column(children: [
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                          height: 50,
                        ),
                        Container(
                            child: Column(
                          children: [
                            const Text("Securinvest Sharia Sukuk Fund"),
                            const Icon(Icons.stars),
                            const Text("4.1 -Pendapatan Tetap"),
                          ],
                        )),
                        Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                          height: 50,
                        ),
                      ],
                    )),
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Container(
                              child: Column(
                            children: [
                              const Text("Imbal Hasil"),
                              const Text("12%")
                            ],
                          )),
                          Container(
                              child: Column(children: [
                            const Text("Harga Unit"),
                            const Text("Rp.1070")
                          ])),
                          Container(
                            child: Column(children: [
                              Text("Dana Kelolaan"),
                              Text("Rp.3.3T")
                            ]),
                          )
                        ]))
                  ])),

              // Card 2
              Container(
                  width: ,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(children: [
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                          height: 50,
                        ),
                        Container(
                            child: Column(
                          children: [
                            const Text("Start Stable Income Fund"),
                            const Text("⭐3.6 - Pendapatan Tetap"),
                          ],
                        )),
                        Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                          height: 50,
                        ),
                      ],
                    )),
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Container(
                              child: Column(
                            children: [
                              const Text("Imbal Hasil"),
                              const Text("12%")
                            ],
                          )),
                          Container(
                              child: Column(children: [
                            const Text("Harga Unit"),
                            const Text("Rp.1070")
                          ])),
                          Container(
                            child: Column(children: [
                              Text("Dana Kelolaan"),
                              Text("Rp.256M")
                            ]),
                          )
                        ]))
                  ])),
            ],
            // style
          ),
        ),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 20'),
            content: const Text('and.jalu@upi.edu ; asyqari@upi.edu'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
