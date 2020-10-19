import 'package:covidnews/home_page.dart';
import 'package:covidnews/list_country.dart';
import 'package:flutter/material.dart';

class StatistikPage extends StatefulWidget {
  final String totalConfirmed;
  final String totalDeaths;
  final String totalRecovered;
  final String indtotalConfirmed;
  final String indtotalDeaths;
  final String indtotalRecovered;
  final List<Countries> country;

  StatistikPage(this.totalConfirmed,this.totalDeaths,this.totalRecovered,this.indtotalConfirmed,this.indtotalDeaths,this.indtotalRecovered,this.country);

  @override
  _StatistikPageState createState() => _StatistikPageState();
}

class _StatistikPageState extends State<StatistikPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left:16,top:10,bottom: 16),
            child: Text("Statistik terkini di dunia",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xFF0091a6)),),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 105,
                    height: 90,
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2
                      )],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amberAccent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text("Cases",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          child: Text(widget.totalConfirmed,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 105,
                    height: 90,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2
                        )],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text("Deaths",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),Container(
                          child: Text(widget.totalDeaths,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 105,
                    height: 90,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 1
                        )],
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF04c2bf)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text("Recovered",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),Container(
                          child: Text(widget.totalRecovered,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:16,top:24,bottom: 16),
            child: Text("Statistik terkini di Indonesia",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xFF0091a6)),),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 105,
                    height: 90,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2
                        )],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amberAccent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text("Cases",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),Container(
                          child: Text(widget.indtotalConfirmed,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 105,
                    height: 90,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2
                        )],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text("Deaths",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),Container(
                          child: Text(widget.indtotalDeaths,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 105,
                    height: 90,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 1
                        )],
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF04c2bf)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text("Recovered",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),Container(
                          child: Text(widget.indtotalRecovered,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:16,top:24,right: 16,bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Summary",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xFF0091a6)),),
                Text("2020-09-07",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xFF0091a6)),),
              ],
            )
          ),
          Expanded(child: ListCountry(listCountry: widget.country,)),
        ],
      ),
    );
  }
}
