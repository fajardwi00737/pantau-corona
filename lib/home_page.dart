import 'dart:async';
import 'dart:convert';import 'package:covidnews/beranda_page.dart';
import 'package:covidnews/number_formatter.dart';
import 'package:covidnews/statistik_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String totalConfirmed, totalDeaths, totalRecovered, _indTotalConfirmed, indTotalDeaths, indTotalRecovered;
  List<Countries> users;

  List<int> descCases = [];

  Future _tesGet()async{
    final response = await http.get("https://api.covid19api.com/summary");

    if(response.body != null){
      print(response.body);
      setState(() {
        totalConfirmed = NumberFormatter().getMoneyIDRWithoutSymbol(double.parse(json.decode(response.body)['Global']['TotalConfirmed'].toString()));
        totalDeaths = NumberFormatter().getMoneyIDRWithoutSymbol(double.parse(json.decode(response.body)['Global']['TotalDeaths'].toString()));
        totalRecovered = NumberFormatter().getMoneyIDRWithoutSymbol(double.parse(json.decode(response.body)['Global']['TotalRecovered'].toString()));

        users = (json.decode(response.body)['Countries'] as List)
            .map((data) => Countries.fromJson(data))
            .toList();

        Comparator<Countries> priceComparator = (b, a) => a.totalConfirmed.compareTo(b.totalConfirmed);
        users.sort(priceComparator);

        print("INI DIA HASIL COMPARE => "+ users.toString());

        if(users != null){

          for(int i = 0; i <= users.length-1; i++){

              descCases.add(users[i].totalConfirmed);

              descCases.sort(((b, a) => a.compareTo(b)));


            if(users[i].country == 'Indonesia'){
              setState(() {
                _indTotalConfirmed = NumberFormatter().getMoneyIDRWithoutSymbol(double.parse(users[i].totalConfirmed.toString()));
                indTotalDeaths = NumberFormatter().getMoneyIDRWithoutSymbol(double.parse(users[i].totalDeaths.toString()));
                indTotalRecovered = NumberFormatter().getMoneyIDRWithoutSymbol(double.parse(users[i].totalRecovered.toString()));
              });
              print(indTotalRecovered);
              print(indTotalDeaths);
              print(_indTotalConfirmed);
            }
          }
//          users.sort();
//
//          print(users);
//          print("DARI YANG TERBESAR KE TERKECIL => "+ descCases.toString());
        }

        print("INI UDAH DI MODEL =>"+ users.toString());
      });
    }else {
      print("INI GAK DAPET COK");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tesGet();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: IconButton(icon: Icon(Icons.menu,color: Colors.white,), onPressed: (){
            _scaffoldKey.currentState.openDrawer();
          }),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFF007b8c),
          title: Text("Pantau Corona",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          bottom: PreferredSize(
            preferredSize: new Size(60.0, 60.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: TabBar(
                  indicatorWeight: 3,
//          indicatorPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                  labelColor: Color(0xFF007b8c),
                  unselectedLabelColor: Colors.white,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white
                  ),
                  tabs: [
                    Tab(text: "Beranda"),
                    Tab(text: "Statistik"),
                  ]),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(child: Text("Pantau Teross"),
                decoration: BoxDecoration(
                    color: Color(0xFF0091a6)
                ),
              ),
              ListTile(
                title: Text("Apa Itu Corona ?"),
              ),
              ListTile(
                title: Text("Cara Menangani Corona"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BerandaPage(),
            StatistikPage(totalConfirmed, totalDeaths, totalRecovered,_indTotalConfirmed,indTotalDeaths,indTotalRecovered,users)
          ],
        ),
      ),
    );
  }
}

class Countries {
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;
  dynamic premium;

  Countries._({this.country,this.countryCode,this.slug,this.newConfirmed,this.totalConfirmed,this.newDeaths,this.totalDeaths,this.newRecovered,this.totalRecovered,this.date,this.premium});

  factory Countries.fromJson(Map<String, dynamic> json) {
    return new Countries._(
      country: json['Country'],
      countryCode: json['CountryCode'],
      slug: json['slug'],
      newConfirmed: json['NewConfirmed'],
      totalConfirmed: json['TotalConfirmed'],
      newDeaths: json['NewDeaths'],
      totalDeaths: json['TotalDeaths'],
      newRecovered: json['NewRecovered'],
      totalRecovered: json['TotalRecovered'],
      date: json['Date'],
      premium: json['Premium'],
    );
  }
}
