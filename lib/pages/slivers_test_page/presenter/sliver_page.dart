import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {

  const SliverPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return const Scaffold(
           body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
              )
            ],
           ),
       );
  }
}