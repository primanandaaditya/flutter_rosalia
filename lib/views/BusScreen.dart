import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rosa/blocs/BusBloc.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/str.dart';


class BusUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(builder: (context) => BusBloc(),
        child: View(),
      ) ,
    );
  }
}


class View extends StatelessWidget {

  
  

  @override
  Widget build(BuildContext context) {
    BusBloc busBloc = BlocProvider.of<BusBloc>(context);
    busBloc.add(0);
    

    return
     Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: CSS().gradienLinear()
      ),
      child: BlocBuilder<BusBloc, String>(
        builder: (context, response) {
          if (response ==""){
            return Container();

          }else if(response == "loading"){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );

          }else if(response == "error"){
            return Center(
              child: Text(response.toString(), textAlign: TextAlign.center, style: CSS().teksMerah(),),
            );
            

          }else{
            if(response=="filterTime"){
              debugPrint(response.toString());
            }else{
              busBloc.createResponse(response);
            }
           

            return Column(
              children: <Widget>[

              
                TextField(
                  autofocus: true,
                  controller: busBloc.tcFilter,
                  onChanged: ((s){
                    busBloc.add(1);
                  }),
                  style: CSS().teksPutih(),
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.white,),
                    enabledBorder: CSS().garisBawahPutih(),
                    focusedBorder: CSS().garisBawahPutih(),
                    hintText: Str.filterKelas,
                    hintStyle: CSS().teksPutih()
                  ),
                ),

                Expanded(
                  child: ListView.separated(
                  separatorBuilder: (context, index){
                    return Divider(
                      color: Colors.white,
                    );
                  },

                  itemBuilder: (context, index){
                    return ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.white,
                        child: Icon(
                          Icons.directions_bus,
                          color: Colors.white
                        ),
                      ),

                      title: Text(busBloc.filter.elementAt(index).namaKelas,
                        style: CSS().teksPutih(),
                      ),
                    
                      onTap: () {
                        debugPrint(busBloc.filter.elementAt(index).kelasId);
                      },
                    );
                  },
                  itemCount: busBloc.filter.length,
                )
                ),
              ],
            );
          }
        }
      )
      ,
    );
  }
}

