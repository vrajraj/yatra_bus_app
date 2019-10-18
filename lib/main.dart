import 'package:flutter/material.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/yatra.png"),
          fit: BoxFit.fill,
          colorBlendMode: BlendMode.darken,
          color: Colors.black90,
        ),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                new TextStyle(color: Colors.white, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               new Image(image: AssetImage("assets/yatra2.jpg"),
                 height: _iconAnimation.value * 100.0,
                 width: _iconAnimation.value * 100.0,
               ),
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Enter Email", fillColor: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new MaterialButton(
                        child: new Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                        ),
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.redAccent,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(context,
                          new  MaterialPageRoute(builder: (context) => new Home()),
                          );

                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}


//screen 2


class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  List<String> agama=["****","vishwamitri/satellite road/gsrtc","ambaji/himatnagar chokdi/gsrtc", "vishwamirtri/gandhinagar-GEB/gsrtc"];
  String _agama="****";

  String _jk="";

  TextEditingController controllerNama= new TextEditingController();
  TextEditingController controllerPass= new TextEditingController();
  TextEditingController controllerMoto= new TextEditingController();


  void _pilihJk(String value){
    setState((){
      _jk=value;
    });
  }

  void  pilihAgama(String value){
    setState((){
      _agama=value;
    });
  }

  void Popupdata(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("FROM : ${controllerNama.text}"),
            new Text("TO : ${controllerPass.text}"),
            new Text("STAND : ${controllerMoto.text}"),
            new Text("TICKET FAIR : $_jk"),
            new Text("BUS AVAILABLE : $_agama"),
            new RaisedButton(
              child: new Text("OK"),
              onPressed: (){
                Navigator.push(context,
                  new  MaterialPageRoute(builder: (context) => new Screen3()),
                );
              },
            )
          ],
        ),
      ),
    );
    showDialog(context: context,child:alertDialog );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("yarta.com"),
        backgroundColor: Colors.redAccent,

      ),


      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(10.0),
            child:  new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Origin",
                      labelText: "FROM",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      )

                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextField(
                  controller: controllerPass,
                  decoration: new InputDecoration(
                      hintText: "Destination",
                      labelText: "TO",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      )

                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextField(
                  controller:  controllerMoto,
                  maxLines: 3,
                  decoration: new InputDecoration(
                      hintText: "Select your stand",
                      labelText: "STAND",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      )

                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),

                new RadioListTile(
                  value: "100 RS",
                  title: new Text(" Government"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.red,
                  subtitle: new Text("Select as government buses -gsrtc,rsrtc,msrtc"),

                ),
                new RadioListTile(
                  value: "120 RS",
                  title: new Text("Private "),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.red,
                  subtitle: new Text("Select as private travelers buses"),

                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),


                new Row(
                  children: <Widget>[
                    new Text("BUS AVAILABLE ",style: new TextStyle(fontSize: 18.0,color: Colors.blue),),
                    new DropdownButton(
                      onChanged: (String value){
                        pilihAgama(value);
                      },
                      value: _agama,
                      items: agama.map((String value){
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),

                new RaisedButton(
                  child: new Text("OK"),
                  color: Colors.red,
                  onPressed: (){Popupdata();},
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}

//screen3


class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: new ListView(
          children: <Widget>[
      new Container(
      padding: new EdgeInsets.all(10.0),
      child:  new Column(
        children: <Widget>[
      new TextField(
        decoration: new InputDecoration(
            hintText: "Enter debit/credit card number",
            labelText: "CARD NUMBER",
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(20.0)
            )

        ),
      ),

      new Padding(padding: new EdgeInsets.only(top: 20.0),),
      new TextField(
        decoration: new InputDecoration(
            hintText: "Enter card cvv digit",
            labelText: "CVV",
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(20.0)
            )

        ),
      ),
      new RaisedButton(
        child: new Text("PAY", style: TextStyle(color: Colors.red),),
        color: Colors.black54,
        onPressed: (){
          Navigator.push(context,
            new  MaterialPageRoute(builder: (context) => new Home()),
          );
        },
      )

    ]
    )
    )
    ]
    )
    );
  }
}

