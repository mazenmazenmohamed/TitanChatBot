import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:titanchat/statecubitChat.dart';
import 'cubitChat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class chatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: BlocProvider(
          create:(BuildContext context)=>chatCubit(),
          child: BlocConsumer<chatCubit, Chat>(
            listener: (context, index) {},
            builder: (context, index) {
              var cubit = chatCubit.get(context) ;
              return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap:true ,
                          padding: const EdgeInsets.all(20.0),
                          itemCount: cubit.Usertb.length+cubit.BoTtb.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SizedBox(height: 30.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                   cubit. Usertb[index],
                                  ],
                                ),
                                SizedBox(height: 30.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    cubit. BoTtb[index],
                                  ],
                                ),
                              ],
                            );
                          },
                          physics: BouncingScrollPhysics(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    maxLines: null,
                                    controller: cont,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(color: Colors.grey),
                                    onChanged: (String value) {
                                      //cubit.getsearch(value);
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Text_me ..!'),
                                  ),
                                ),
                                IconButton(
                                    onPressed:()async{
                                      print('1223');
                                        var x= await cubit.getData();
                                        //await cubit.re();
                                        //cubit.send();
                                      print(x);
                                      print('122');


                                    },
                                    icon: Icon(Icons.send))
                              ]),
                        ),
                      ]
                  ),
                );

            }
          ),
        ),
    );
  }
}
