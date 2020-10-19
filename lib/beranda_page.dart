import 'package:flutter/material.dart';
import 'package:covidnews/komponen/image_slider.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {

  final _tips = <Tips>[
    Tips(
      img: "assets/images/cuci_tangan.png",
      label: "Mencuci tangan"
    ),
    Tips(
        img: "assets/images/disinfektan.png",
        label: "Gunakan disinfektan"
    ),
    Tips(
        img: "assets/images/jaga_jarak.png",
        label: "Menjaga jarak"
    ),
    Tips(
        img: "assets/images/jangan_kumpul.png",
        label: "Hindari keramaian"
    ),
    Tips(
        img: "assets/images/pakai_masker.png",
        label: "Memakai masker"
    ),
    Tips(
        img: "assets/images/stay_home.png",
        label: "Di rumah aja"
    ),
  ];



  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 8;
    var _screenWidth = 100;
    var _crossAxisCount = 2;
    var _width = ( _screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
    var cellHeight = 65;
    var _aspectRatio = _width /cellHeight;


    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 24),
              child: SliderImages(
                listWidget: <Widget>[
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF8ddfd9),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topRight: Radius.circular(30)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: -20,
                          right: -20,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF0091a6)
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text("Covid-19",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                              Container(
                                margin: EdgeInsets.only(top:5),
                                child: Text("Virus Corona atau severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2) adalah virus yang menyerang sistem pernapasan.",style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF8ddfd9),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topRight: Radius.circular(30)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: -40,
                          left: -40,
                          child: Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF0091a6)
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text("Covid-19",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                              Container(
                                margin: EdgeInsets.only(top:5),
                                child: Text("Virus Corona atau severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2) adalah virus yang menyerang sistem pernapasan.",style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(1.0, 2.0),
                    blurRadius: 1
                )],
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFadf9e9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Yuk... cek kesehatanmu sekarang",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Color(0xFF0091a6)),),
                  Icon(Icons.chevron_right,color: Color(0xFF0091a6))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
              child: Text("Tips pencegahan",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xFF0091a6)),),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: GridView.builder(
                  shrinkWrap: false,
                    itemCount: _tips.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: _aspectRatio), itemBuilder: (context,idx){
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(1.0, 1.0),
                              blurRadius: 1
                          )],
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFadf9e9),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(_tips[idx].img,width: 80,height: 80,),
                            Container(
                              alignment: Alignment.topCenter,
                                margin:EdgeInsets.only(top: 8),child: Text(_tips[idx].label,textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Color(0xFF0091a6)),))
                          ],
                        ),
                      );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Tips{
  String img;
  String label;

  Tips({this.img,this.label});
}
