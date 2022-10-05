import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:project_test/pages/bloc_test_page/presenter/bloc_controller/bloc_states.dart';

abstract class BlocBuilder implements BlocBuildWidget<BlocStates, Widget> {
  @override
  Widget buildWidget(
      {required BuildContext context,
      required AsyncSnapshot<BlocStates> snapshot}) {
    if (snapshot.hasData) {
      final data = snapshot.data;
      log(data.toString());
      if (data is BlocLoading) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (data is BlocSucess) {

        return CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Text(
                    'data',
                  ),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 5,
                (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ColoredBox(
                      color: Colors.red,
                      child: Text('albuns.title'),
                    ),
                  );
                },
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: data.albuns.length,
                (context, index) {
                  final albuns = data.albuns.elementAt(index);
                  return ListTile(
                    title: Text(albuns.title),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        albuns.tumbailUrl,
                      ),
                    ),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.network(
                          albuns.url,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      } else if (data is BlocError) {
        return Center(child: Text(data.message));
      } else {
        return const SizedBox.shrink();
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}
