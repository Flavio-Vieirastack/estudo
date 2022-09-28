import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:project_test/pages/bloc_test_page/presenter/bloc_controller/bloc_controller.dart';
import 'package:project_test/pages/bloc_test_page/presenter/bloc_controller/bloc_states.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  State<BlocPage> createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  late final BlocController bloc;
  @override
  void initState() {
    super.initState();
    bloc = Injector.get<BlocController>();
    bloc.stateOut.listen(
      (event) => bloc.buildListenableWidgets(
        event: event,
        context: context,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await bloc.getAlbumData();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<BlocStates>(
        stream: bloc.stateOut,
        builder: (context, snapshot) => bloc.buildWidget(
          context: context,
          snapshot: snapshot,
        ),
      ),
    );
  }
}
