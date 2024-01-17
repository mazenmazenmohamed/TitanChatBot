import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:titanchat/statecubitChat.dart';
import 'package:http/http.dart' as http;
var cont =TextEditingController();
dynamic sAPI;

class chatCubit extends Cubit<Chat>{
  chatCubit() :super (initial());
  static chatCubit get(context) => BlocProvider.of(context);
  int currentIndex =0 ;
  List<Container> Usertb=[];
  List<Container> BoTtb=[];
  List<Container> chat=[];
   void send()  {
    Usertb.add(Container(
     constraints: BoxConstraints(maxWidth:300),
     color: Colors.blueAccent,
     child: TextButton(
         onPressed: (){},
         child: Text(
           maxLines: null,
           '${cont.text}',
           style: TextStyle(
             color: Colors.white,fontSize: 20.0,
           ),
         )),
   ));
    emit(sending());
  }

  Future<Map<String, dynamic>> getData() async {
    print('getting data');
    var respons =  await http.get(Uri.parse("http://127.0.0.1:5000/hash/${cont.text}"));
    print('getting data 3');
    var result = convert.json.decode(respons.body) as Map<String,dynamic>;
  print(result);
  print('object1');
  print(respons);
  return result ;
  }

  Future<void> re() async {
    print('re data');
    sAPI=await getData();
    BoTtb.add(Container(
      constraints:BoxConstraints(maxWidth: 400),
      color: Colors.blueAccent,
      child: TextButton(
          onPressed: (){},
          child: Text('${sAPI}',style: TextStyle(color: Colors.white,fontSize: 20),)),
    ));
    emit(Replying());
  }


}