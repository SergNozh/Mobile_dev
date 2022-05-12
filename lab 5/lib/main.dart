import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State {
  final _formKey = GlobalKey<FormState>();

  double result = 0.0;
  double width = 0.0;
  double height = 0.0;

  void _multiplication ()
  {
    setState(()
    {
      result = height * width;
      if(_formKey.currentState!.validate()  )
      {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Площадь успешно вычислена!'), backgroundColor: Colors.green,)
        );
      }
    });
  }

  _changeHeight (String text) {
    setState(() => height = double.tryParse(text) ?? 0.0);
  }
  _changeWidth (String text){
    setState(() => width = double.tryParse(text) ?? 0.0 );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 20),
              child:
              Row(
                children: [
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child:
                    Column(
                      children:  const <Widget>[
                        Text('Ширина, мм:', style: TextStyle(fontSize: 16,),),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty) return 'Введите ширину';
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onChanged: _changeHeight,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child:
              Row(
                children: [
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child:
                    Column(
                      children:  const <Widget>[
                        Text('Высота, мм:', style: TextStyle(fontSize: 17,),),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextFormField( validator: (value){
                      if(value!.isEmpty) return 'Введите высоту';
                    },
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onChanged: _changeWidth,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(80, 10, 8, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: _multiplication,
                    child: const Text('Вычислить'),
                  )
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(80, 10, 8, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  width > 0 && height > 0 && result > 0 && (width * height) == result  ? Text('S = $width * $height = $result (мм2)',
                    style: const TextStyle(
                        fontSize: 20),)
                      : width > 0 && height > 0 ? const Text('') : const Text('Задайте параметры', style: TextStyle(
                      fontSize: 20))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() => runApp (
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            title: const Text('Калькулятор площади'),
          ),
          body: const MyApp(),
        )
    )
);