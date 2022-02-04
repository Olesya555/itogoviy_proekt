import 'package:flutter/material.dart';
import 'package:itogoviy_proekt/theme_data.dart';

class InfoPrilogenie extends StatelessWidget {
  const InfoPrilogenie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBar(),
        drawer: navDrawer(context),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: const [
              SizedBox(height: 200,),
              Text('Итоговая аттестация',
                style: TextStyle(fontSize: 24, color: Colors.blue),),
              SizedBox(height: 20,),
              Text('Версия: 1.0',
                style: TextStyle(fontSize: 20, color: Colors.black),),
              SizedBox(height: 50,),
              Text('Автор: Косова Олеся',
                style: TextStyle(fontSize: 20, color: Colors.black),),
              SizedBox(height: 20,),
              Text('Группа ЦП_РКПд-21-03',
                style: TextStyle(fontSize: 20, color: Colors.black),),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
