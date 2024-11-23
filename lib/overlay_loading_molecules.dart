import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

//
// 全面表示のローディング
//
class OverlayLoadingMolecules extends StatelessWidget {
  OverlayLoadingMolecules({required this.visible});

  //表示状態
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return visible
        ? Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoadingAnimationWidget.staggeredDotsWave(
                  color: const Color.fromARGB(255, 82, 212, 255),
                  size: 100,
                ),
              ],
            ),
          )
        : Container();
  }
}
