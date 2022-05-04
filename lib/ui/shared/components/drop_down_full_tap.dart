import 'package:flutter/material.dart';

class DropDownFullTap<T> extends StatelessWidget {
  final GlobalKey dropdownKey =
      GlobalKey(); // Key is needed to start the search from DropdownButtonFormField in the tree.
  final String label;
  final T? value;
  final InputDecoration? decoration;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final EdgeInsetsGeometry padding;

  DropDownFullTap({
    this.label = '',
    this.value,
    this.items,
    this.onChanged,
    this.padding = const EdgeInsets.all(8.0),
    this.decoration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();

        openItemsList(context);
      },
      child: Padding(
        padding: padding,
        child: DropdownButtonFormField<T>(
          onTap: null,
          key: dropdownKey,
          decoration: decoration,
          value: value,
          items: items,
          onChanged: (text){

          },
        ),
      ),
    );
  }

  void openItemsList(context) {
    // FocusManager.instance.primaryFocus?.unfocus();
    // FocusScope.of(context).unfocus();
    // FocusManager.instance.primaryFocus?.unfocus();
    // FocusScope.of(dropdownKey.currentContext!).unfocus();
    // FocusScope.of(context).requestFocus(new FocusNode());
    if (dropdownKey.currentContext == null) return;
    GestureDetector? detector;

    // Go down the tree to find the first GestureDetector, which should be the one from DropdownButton.
    void search(BuildContext context) {
      context.visitChildElements((element) {
        if (detector != null) return;
        if (element.widget is GestureDetector)
          detector = element.widget as GestureDetector?;
        else
          search(element);
      });
    }

    search(dropdownKey.currentContext!);
    if (detector != null && detector!.onTap != null) detector!.onTap!();
  }
}
