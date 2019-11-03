import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rosa/blocs/mobileversionBloc.dart';
import 'package:flutter_rosa/helpers/str.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => MobileVersionBloc(),
      child: Utama(),
    );
  }
}


class Utama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KO"),),
      body: BlocProvider(builder: (context) => MobileVersionBloc(), 
          child: Mobile(), 
      ) , 
    );
  }
}

class Mobile extends StatefulWidget {
  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    MobileVersionBloc mobileVersionBloc = BlocProvider.of<MobileVersionBloc>(context);
    mobileVersionBloc..add(0);

    return Container(
      child: BlocBuilder<MobileVersionBloc,String>( 
            builder: (context, hasil)=> 
            (hasil == Str.defaultMobileVersion)
                ?
                Center(
                  child: CircularProgressIndicator(),
                )
            :
                Center(
                  child: Text(hasil, textAlign: TextAlign.center )
                )

      ) ,
    );
  }
}