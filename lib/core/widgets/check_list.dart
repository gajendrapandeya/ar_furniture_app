import 'package:ar_furniture_app/core/model/check_list_item.dart';
import 'package:flutter/material.dart';

// Provides a list of checkbox items similiar to [Checkboxlisttile]
class CheckList extends StatefulWidget {
  const CheckList({
    Key? key,
    required this.items,
    required this.onItemChecked,
  }) : super(key: key);
  final List<CheckListItem> items;
  final Function(String) onItemChecked;

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  List<CheckListItem> list = [];

  @override
  void initState() {
    list.clear();
    list.addAll(widget.items);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: list
            .map((item) => _buildItem(
                  item,
                ))
            .toList());
  }

  Widget _buildItem(CheckListItem item) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: item.isChecked,
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(
        item.title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 14.0,
            ),
      ),
      onChanged: (value) {
        if (value == true) {
          setState(() {
            list = list.map((e) => e..isChecked = item.id == e.id).toList();
          });
          widget.onItemChecked(item.title);
        }
      },
    );
  }
}
