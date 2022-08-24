import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_counter/UI/InputInformation.dart';
import 'package:flutter_counter/objects/Player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Player> players = [];
  final ValueNotifier<Player> _selectPlayerChange = ValueNotifier<Player>(new Player.Default());
  // This widget is the root of your application.
  static int _count = 0;
  /*
  _getPlayer(){
    for (int i = 0; i < _count; i++){
      if (_count > 0){
        Player player=Player();
        player.setId(i+1);
        player.setName('Player ${i+1}');
        
        _getStackObject(player);

      } 
    }            
  }
  */
  addCountOne() => {_count++};
  minusCountOne() => {_count--};
  _getPadding() {
    return Padding(
      padding: EdgeInsets.all(10),
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final Player result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InputInformation(),
        ));
    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      players[result.getId()].setName(result.getName());
      print(result.getName());
    });
  }

  _getContainter() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        //color: Colors.green[200],
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          top: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          left: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          right: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  _getStackObject(int viTri) {
    return Builder(
        builder: (context) => ValueListenableBuilder(
          valueListenable: _selectPlayerChange ,
          builder:(context,pl,c){
            return  Column(
              children: [
                InkWell(
                  onTap: () {
                    //
                    print('Click');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InputInformation(),
                    ));
                     _awaitReturnValueFromSecondScreen(context);
                  },
                  child: Stack(
                    children: [
                      _getPadding(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        clipBehavior: Clip.hardEdge,
                        child: FadeInImage.assetNetwork(
                          width: 100,
                          height: 100,
                          placeholder: 'assets/images/loading.gif',
                          image:
                              'https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/296107224_604929331259626_4868231954046299990_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=ae9488&_nc_ohc=zB7dqQ_QL4UAX_88LxB&tn=MrJy_kwnCErs3i4z&_nc_ht=scontent.fdad2-1.fna&oh=03_AVIV3Or8ZD1VWzsKPvsmZB_hCP1zsgbxRSktZXNSUc68qA&oe=63246CD3',
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Player ${viTri + 1}'),
              ],
            ); 
          }
          ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              _getPadding(),
              Text(
                'Number of Players',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _getPadding(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        print('giam');
                        if (_count > 0) players.removeLast();
                        minusCountOne();
                        _getContainter();
                      });
                    },
                    backgroundColor: Colors.blue[200],
                    label: Text(
                      'Decrese',
                      style: TextStyle(color: Colors.white70),
                    ),
                    icon: Icon(Icons.remove),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                  ),
                  Text(
                    '${_count}',
                    style: TextStyle(fontSize: 30),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                  ),
                  FloatingActionButton.extended(
                    heroTag: "btn1",
                    onPressed: () {
               
                      setState(() {
                        addCountOne();
                        print('tang');
                        Player pl = new Player(_count, 'Player ${_count}');
                        print('${pl.getName()}');
                        players.add(pl);
                      });
                    },
                    backgroundColor: Colors.blue[200],
                    label: Text(
                      'Increse',
                      style: TextStyle(color: Colors.white70),
                    ),
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              /* Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                   for (int i = 0; i < _count; i++)
                   if (_count > 0) _getStackObject(i), 
                  _getPadding(),
                ],), */
              SizedBox(
                height: 300,
                width: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _count,
                  itemBuilder: (context, viTri) {
                    return _getStackObject(viTri);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
