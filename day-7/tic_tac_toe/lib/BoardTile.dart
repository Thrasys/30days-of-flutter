import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tile_state.dart';

class BoardTile extends StatelessWidget {
  final TileState tileState;
  final double dimension;
  final VoidCallback onPressed;

  BoardTile({Key key, this.dimension, this.onPressed, this.tileState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      child: FlatButton(
        onPressed: onPressed,
        child: Image.asset('images/x.png'),
      ),
    );
  }

  Widget widgetForTileState() {
    Widget widget;

    switch (tileState) {
      case TileState.EMPTY:
        {
          widget = Container();
        }
        break;

      case TileState.CROSS:
        {
          widget = Image.asset('image/x.png');
        }
        break;

      case TileState.CIRCLE:
        {
          widget = Image.asset('image/o.png');
        }
        break;
    }
    return widget;
  }
}
