import 'dart:ui';

import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/profile/data/models/profile_response_model.dart';
import 'package:flutter/material.dart';
class HeroDialogRoute<T> extends PageRoute<T> {
  /// {@macro hero_dialog_route}
  HeroDialogRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}

class CustomRectTween extends RectTween {
  /// {@macro custom_rect_tween}
  CustomRectTween({
    @required Rect begin,
    @required Rect end,
  }) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final elasticCurveValue = Curves.easeOut.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin.left, end.left, elasticCurveValue),
      lerpDouble(begin.top, end.top, elasticCurveValue),
      lerpDouble(begin.right, end.right, elasticCurveValue),
      lerpDouble(begin.bottom, end.bottom, elasticCurveValue),
    );
  }
}
class TodoCard extends StatelessWidget {
  final ProfileResponseModel data;
  /// {@macro todo_card}
  const TodoCard({
    Key key,
   this.data,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          HeroDialogRoute(
            builder: (context) => Center(
              child: _TodoPopupCard(data: data),
            ),
          ),
        );
      },
      child: Hero(
        createRectTween: (begin, end) {
          return CustomRectTween(begin: begin, end: end);
        },
        tag: data.data.sId,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Material(
            color: kPrimaryOrangeColor,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  _TodoTitle(title: data.data.name),
                  const SizedBox(
                    height: 8,
                  ),
                  // if (todo.items != null) ...[
                  //   const Divider(),
                  //   _TodoItemsBox(items: todo.items),
                  // ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class _TodoTitle extends StatelessWidget {
  /// {@macro todo_title}
  const _TodoTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

class _TodoPopupCard extends StatelessWidget {
  final ProfileResponseModel data;

  const _TodoPopupCard({Key key, this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: data.data.sId,
      createRectTween: (begin, end) {
        return CustomRectTween(begin: begin, end: end);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryOrangeColor,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _TodoTitle(title: data.data.email),
                    const SizedBox(
                      height: 8,
                    ),
                    // if (todo.items != null) ...[
                    //   const Divider(),
                    //   _TodoItemsBox(items: todo.items),
                    // ],
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const TextField(
                        maxLines: 8,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: 'Write a note...',
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// /// {@template todo_items_box}
// /// Box containing the list of a [Todo]'s items.
// ///
// /// These items can be checked.
// /// {@endtemplate}
// class _TodoItemsBox extends StatelessWidget {
//   /// {@macro todo_items_box}
//   const _TodoItemsBox({
//     Key key,
//     @required this.items,
//   }) : super(key: key);
//
//   final List<Item> items;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (final item in items) _TodoItemTile(item: item),
//       ],
//     );
//   }
// }

// /// {@template todo_item_template}
// /// An individual [Todo] [Item] with its [Checkbox].
// /// {@endtemplate}
// class _TodoItemTile extends StatefulWidget {
//   /// {@macro todo_item_template}
//   const _TodoItemTile({
//     Key key,
//     @required this.item,
//   }) : super(key: key);
//
//   final Item item;
//
//   @override
//   _TodoItemTileState createState() => _TodoItemTileState();
// }
//
// class _TodoItemTileState extends State<_TodoItemTile> {
//   void _onChanged(bool val) {
//     setState(() {
//       widget.item.completed = val;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Checkbox(
//         onChanged: _onChanged,
//         value: widget.item.completed,
//       ),
//       title: Text(widget.item.description),
//     );
//   }
// }

