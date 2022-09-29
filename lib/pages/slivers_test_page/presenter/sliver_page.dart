import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:project_test/core/extensions/sliver_extension.dart';
class SliverPage extends StatelessWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = List.generate(10, (index) => '$index');
    final color =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 250.0,
            forceElevated: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Custom Scroll View'),
              background: Image.network(
                'https://i0.statig.com.br/bancodeimagens/bx/ry/fv/bxryfvt3vi76x0obfhixvrj8x.jpg',
                fit: BoxFit.cover,
              ),
              expandedTitleScale: 2,
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Center(
                  child: Text(
                    'Sliver',
                  ),
                ),
              ],
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              childCount: 5,
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text(' $index'),
                  ),
                );
              },
            ),
          ),
          SliverGrid(
            delegate:
                SliverChildBuilderDelegate(childCount: 5, (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Color',
                    ),
                  ),
                ),
              );
            }),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: list
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            'Box adapter $e',
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ).sliverBox,
          SliverToBoxAdapter(
            child: SizedBox(
              height: 350,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: list
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              color: Colors.orange,
                              child: Center(
                                child: Text(
                                  'Box adapter $e',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 150,
                              width: 150,
                              color: Colors.green,
                              child: Center(
                                child: Text(
                                  'Box adapter $e',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
            ),
          )
        ],
      ),
    );
  }
}
