import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rosa/blocs/AgenBloc.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/models/agen/ListAgenRequest.dart';

class AgenUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(builder: (context) => AgenBloc(),
        child: View(),
      )
      ,
    );
  }
}

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AgenBloc agenBloc = BlocProvider.of<AgenBloc>(context);
    agenBloc.add(LoadAgen());

    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: CSS().gradienLinear()
      ),

      child: BlocBuilder<AgenBloc, String>(
        builder: (context, response) {
          switch (response){

            case Str.filterBegin:{
              return Container();
            }
            break;

            case Str.filterLoading:{
              return Center(
                child:CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ) ,
              );
            }
            break;

            case Str.filterError:{
              return Center(
                child: Text(
                  Str.error, style: CSS().teksPutih(),
                ),
              );
            }
            break;


            default:{
              if(response==Str.filterTime){

              }else{
                agenBloc.createResponse(response);
              }

              return Column(
                children: <Widget>[

                  TextField(
                    autofocus: true,
                    controller: agenBloc.tcFilter,
                    style: CSS().teksPutih(),
                    decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Colors.white,),
                        enabledBorder: CSS().garisBawahPutih(),
                        focusedBorder: CSS().garisBawahPutih(),
                        hintText: Str.filterAgen,
                        hintStyle: CSS().teksPutih()
                    ),
                    onChanged: ((s){
                      agenBloc.add(FilterAgen());
                    }),
                  ),

                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index){
                        return Divider(
                          color: Colors.white,
                        );
                      },

                      itemBuilder: (context, index){
                        return  ListTile(
                          leading: CircleAvatar(
                            foregroundColor: Colors.white,
                            child: Icon(
                                Icons.home,
                                color: Colors.white
                            ),
                          ),

                          title: Text(agenBloc.filter.elementAt(index).namaAgen,
                            style: CSS().teksPutih(),
                          ),

                          subtitle: Text(agenBloc.filter.elementAt(index).namaKota,
                            style: CSS().teksPutihKecil(),
                          ),

                          trailing: Text(agenBloc.filter.elementAt(index).singkatan,
                            style: CSS().teksPutih(),
                          ),

                          onTap: () {
                            debugPrint("Landscape tapped");
                          },
                        );
                      },
                      itemCount: agenBloc.filter.length,
                    ),
                  )
                ],
              );

            }
          }
        }
      )
      ,
    );
  }
}
