import 'package:covidnews/home_page.dart';
import 'package:covidnews/model/model_country.dart';
import 'package:covidnews/number_formatter.dart';
import 'package:flutter/material.dart';

class ListCountry extends StatefulWidget {
  final List<Countries> listCountry;

  ListCountry({this.listCountry});
  @override
  _ListCountryState createState() => _ListCountryState();
}

class _ListCountryState extends State<ListCountry> {

  final listCountry = <Country>[
    Country(
      name: "Amerika",
      date: "1325125"
    ),
    Country(
        name: "korea",
        date: "246464"
    ),
    Country(
        name: "China",
        date: "212141"
    ),
    Country(
        name: "Indonesia",
        date: "124125"
    ),
    Country(
        name: "India",
        date: "123244"
    ),
    Country(
        name: "Canada",
        date: "124232"
    ),
    Country(
        name: "Spanyol",
        date: "1232131"
    ),
    Country(
        name: "Italia",
        date: "1123122"
    )
  ];

  final ScrollController sc = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scrollbar(
        controller: sc,
        child: ListView.builder(
          controller: sc,
          shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: widget.listCountry.length,
            itemBuilder: (context,idx){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: idx == widget.listCountry.length-1 ? EdgeInsets.only(top:5,bottom: 16,left: 16,right: 16): EdgeInsets.symmetric(horizontal: 16,vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.grey[300]
                ),
                boxShadow: [BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey[400],
                    offset: Offset(1.0, 1.0)
                )],
                borderRadius: BorderRadius.circular(10)
            ),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              children: <Widget>[
                Flexible(
                  flex:1,
                  child: Container(
                      height: 30,
                      decoration:BoxDecoration(
                          border: Border(right: BorderSide(color: Colors.grey[300]))
                      ),
                      child: Center(child: Text((idx+1).toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),))),
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 12),
                    child: Text(widget.listCountry[idx].country,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(left: 12),
                    child: Text(NumberFormatter().getMoneyIDRWithoutSymbol(double.parse(widget.listCountry[idx].totalConfirmed.toString()))+"  Kasus",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
