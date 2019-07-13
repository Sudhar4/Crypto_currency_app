import 'package:flutter/material.dart';


class currencyv extends StatefulWidget {
  List c;
currencyv(this.c);
@override
  createState() {
    return (currencies());
  }
}


class currencies extends State<currencyv>{
  List c;
  List <MaterialColor> color=[Colors.purple,Colors.green,Colors.deepOrange,Colors.indigo];

  Widget list(BuildContext context){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Flexible(
              child:ListView.builder(
                  itemCount: widget.c.length,
                  itemBuilder: (BuildContext context,int index){
                    Map curr=widget.c[index];
                    MaterialColor colors=color[index % color.length];
                    return new Card (
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        children: <Widget>[
                          new GestureDetector(
                            child:Listitem(curr,colors),
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => (new navgation(curr))),),
                          ),
                        ],
                      ),
                    );


                  }
              )
          )

        ],
      ),
    );
  }

  @override
 Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(
       title: Text('Currency App'),
     ),
     body:list(context),
   );
  }
  ListTile Listitem(curr,colors){

    return ListTile(
      leading:new CircleAvatar(
        backgroundColor: colors,
        child: Text(curr['name'][0]),
      ),
          title:Text(curr['name']),
        subtitle: getTitle(curr['symbol'],curr['rank'],curr['price_usd']),
      isThreeLine: true,
    );

  }
Widget getTitle(String symbol,String rank,String price_usd){
    TextSpan sym=TextSpan(text:'Symbol:$symbol\n',style: TextStyle(color: Colors.pinkAccent),);
    TextSpan ra=TextSpan(text:'Rank:$rank\n',style: TextStyle(color: Colors.deepOrange),);
    TextSpan price=TextSpan(text:'Price_usd:$price_usd',style: TextStyle(color: Colors.deepPurple),);
return RichText(
  text:TextSpan(
    children: [
      sym,ra,price
    ]

  )

);
}
}

@override
class navgation extends StatelessWidget {
  Map curr;

  navgation(this.curr);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(curr['name']),
        ),
      ),
    );
  }
}




