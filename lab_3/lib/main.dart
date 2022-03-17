import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: '100-летие КубГАУ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  static int _counter = 36;
  static const IconData heart = CupertinoIcons.heart;
  static const IconData red_heart = CupertinoIcons.heart_fill;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ),

        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[
                  Image.asset('pictures/Cub.jpg'),
                  Container(padding: const EdgeInsets.fromLTRB(0,10,100,10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: 400,
                          child: ListTile(
                            title: Text('Кубанский государственный аграрный университет', style: TextStyle(
                              fontSize: 20,
                            ),),
                          subtitle: Text('Краснодар, ул. Калинина, 13')
                            ,),
                        ),
                        Column(
                          children: [
                            IconButton (
                              icon: Icon(_counter == 36? heart: red_heart),
                              color: _counter == 36? null: Colors.red,
                              onPressed: ()
                              {
                                setState(() {
                                  if (_counter==36)
                                  {
                                    _counter++;
                                  }
                                  else
                                  {
                                    _counter--;
                                  }
                                });
                              },
                            ),
                            Text('$_counter'),
                          ],
                        )
                        ],
                    ),
                  ),
                  Container(padding: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Column(
                          children: const [
                            Icon(Icons.call, size: 30, color: Colors.green,),
                            Text('Позвонить', style: TextStyle(fontSize: 14))
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(Icons.location_on_rounded, size: 30, color: Colors.green,),
                            Text('Маршрут', style: TextStyle(fontSize: 14))
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(Icons.share_outlined, size: 30, color: Colors.green,),
                            Text('Поделиться', style: TextStyle(fontSize: 14))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                      padding: const EdgeInsets.fromLTRB(10,20,0,0),
                      child: const Text(
                          'Сегодня Кубанскому государственному аграрному университету исполняется 100 лет!'
                              'От души поздравляю с этим событием студентов, аспирантов, преподавателей, профессоров, выпускников, сотрудников – всех тех, кто вложил частицу себя в становление университета – лидера аграрного образования и науки, кузницы кадров для агропромышленного комплекса не только Кубани, но и России!'
                              'Наш университет не просто вуз с вековой историей – это судьбы людей, которые связали свою жизнь с университетом: СТУДЕНТЫ, которые сделали выбор и доверили своё профессиональное будущее, ПРЕПОДАВАТЕЛИ, которые щедро делились и делятся своими знаниями, воспитывают новое поколение успешных специалистов и ученых, ВЫПУСКНИКИ, которые своими профессиональными успехами славят вуз в крае, стране и во всем мире, УЧЕНЫЕ, которые заслужили мировое признание за уникальные научные разработки.',
                          style: TextStyle(fontSize: 16))
                  )
                ],
              ),
            )
        )
    );
  }
}