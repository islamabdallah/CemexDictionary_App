// import 'package:flutter/material.dart';
//
// class MultiSelectDialogItem<V> {
//   const MultiSelectDialogItem(this.value, this.label);
//
//   final V value;
//   final String label;
// }
//
// class MultiSelectDialog<V> extends StatefulWidget {
//   const MultiSelectDialog(
//       {Key? key, required this.items, this.initialSelectedValues})
//       : super(key: key);
//
//   final List<MultiSelectDialogItem<V>> items;
//   final Set<V>? initialSelectedValues;
//
//   @override
//   State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
// }
//
// class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
//   final _selectedValues = Set<V>();
//
//   void initState() {
//     super.initState();
//     if (widget.initialSelectedValues != null) {
//       _selectedValues.addAll(widget.initialSelectedValues as Iterable<V>);
//     }
//   }
//
//   void _onItemCheckedChange(V itemValue, bool checked) {
//     setState(() {
//       if (checked) {
//         _selectedValues.add(itemValue);
//       } else {
//         _selectedValues.remove(itemValue);
//       }
//     });
//   }
//
//   void _onCancelTap() {
//     Navigator.pop(context);
//   }
//
//   void _onSubmitTap() {
//     Navigator.pop(context, _selectedValues);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Select animals'),
//       contentPadding: EdgeInsets.only(top: 12.0),
//       content: SingleChildScrollView(
//         child: ListTileTheme(
//           contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
//           child: ListBody(
//             children: widget.items.map(_buildItem).toList(),
//           ),
//         ),
//       ),
//       actions: <Widget>[
//         FlatButton(
//           child: Text('CANCEL'),
//           onPressed: _onCancelTap,
//         ),
//         FlatButton(
//           child: Text('OK'),
//           onPressed: _onSubmitTap,
//         )
//       ],
//     );
//   }
//
//   Widget _buildItem(MultiSelectDialogItem<V> item) {
//     final checked = _selectedValues.contains(item.value);
//     return CheckboxListTile(
//       value: checked,
//       title: Text(item.label),
//       controlAffinity: ListTileControlAffinity.leading,
//       onChanged: (checked) => _onItemCheckedChange(item.value, checked),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/search_cubit.dart';

class MultiSelectDialog extends StatelessWidget {
  const MultiSelectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = SearchCubit.get(context);

    void _onCancelTap() {
      Navigator.pop(context);
    }

    void _onSubmitTap() {
      Navigator.pop(context);
    }

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text('Select Categories',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 16,),
                ...cubit.items
                    .map((item) => _buildItem(item, context))
                    .toList(),

                SizedBox(height: 16,),
                SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // FlutterAppBadger.isAppBadgeSupported();
                        // FlutterAppBadger.updateBadgeCount(10);
                        // FlutterAppBadger.removeBadge();
                        Navigator.pop(context);
                      },
                      child: Text('Done'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11))),
                    )),
              ])),
        );
        // return AlertDialog(
        //   insetPadding: EdgeInsets.zero,
        //   contentPadding: EdgeInsets.zero,
        //   clipBehavior: Clip.antiAliasWithSaveLayer,
        //   title: Text(
        //       cubit.selectedItems.isNotEmpty ? cubit.selectedItems.last : ''),
        //   // contentPadding: EdgeInsets.only(top: 12.0),
        //   content: SingleChildScrollView(
        //     child: ListBody(
        //       children:
        //       [
        //       ...cubit.items.map((item) => _buildItem(item, context)).toList(),
        //         SizedBox(
        //             height: 45,
        //             width: double.infinity,
        //             child: ElevatedButton(
        //               onPressed: () {
        //                 // FlutterAppBadger.isAppBadgeSupported();
        //                 // FlutterAppBadger.updateBadgeCount(10);
        //                 // FlutterAppBadger.removeBadge();
        //                 Navigator.pop(context);
        //               },
        //               child: Text('Done'),
        //               style: ElevatedButton.styleFrom(
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(11))),
        //             )),
        //       ]
        //
        //     ),
        //   ),
        // );
      },
    );
  }

  Widget _buildItem(String item, BuildContext context) {
    var cubit = SearchCubit.get(context);

    final checked = cubit.selectedItems.contains(item);
    return Column(
      children: [
        InkWell(
          onTap: () {
            cubit.onItemCheckedChange(item, checked);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: Row(
              children: [
                Text(item),
                const Spacer(),
                AnimatedContainer(
                  margin: EdgeInsets.all(4),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(color: Colors.black38, blurRadius: 2)
                      ],
                      color: checked ? Colors.red : Colors.white,
                      borderRadius: BorderRadius.circular(4.0),
                      border: !checked
                          ? Border.all(
                              color: Color(0xFF707070),
                              width: 1,
                            )
                          : null),
                  width: 18,
                  height: 18,
                  child: checked
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 14,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 15,
          thickness: 1,
          color: Color(0xFFC5C5C5),
        )
      ],
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  final Function onChange;
  final bool? isChecked;
  final double? size;
  final double? iconSize;
  final Color? selectedColor;
  final Color? selectedIconColor;
  final Color? borderColor;
  final Icon? checkIcon;

  const CustomCheckbox(
      {Key? key,
      this.isChecked,
      required this.onChange,
      this.size,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor,
      this.borderColor,
      this.checkIcon})
      : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          widget.onChange(_isSelected);
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.all(4),
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            color: _isSelected
                ? widget.selectedColor ?? Colors.blue
                : Colors.white,
            borderRadius: BorderRadius.circular(7.0),
            border: !_isSelected
                ? Border.all(
                    color: widget.borderColor ?? Color(0xFF707070),
                    width: 1,
                  )
                : null),
        width: widget.size ?? 18,
        height: widget.size ?? 18,
        child: _isSelected
            ? Icon(
                Icons.check,
                color: widget.selectedIconColor ?? Colors.white,
                size: widget.iconSize ?? 14,
              )
            : null,
      ),
    );
  }
}
