import 'package:ar_furniture_app/core/model/radio_list_item.dart';
import 'package:flutter/material.dart';

class CustomRadioList extends StatefulWidget {
  const CustomRadioList({
    Key? key,
    required this.items,
    required this.onItemChecked,
  }) : super(key: key);

  final List<RadioListItem> items;
  final void Function(int) onItemChecked;

  @override
  State<StatefulWidget> createState() => _CustomRadioListState();
}

class _CustomRadioListState extends State<CustomRadioList> {
  late List<RadioListItem> _list;

  @override
  void initState() {
    super.initState();
    _list = List.from(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(
          6,
        ),
      ),
      child: Column(
        children: _list.map((item) => _buildItem(item)).toList(),
      ),
    );
  }

  Widget _buildItem(RadioListItem item) {
    return RadioListTile<int>(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      value: item.id,
      groupValue: _list
          .firstWhere(
            (e) => e.isChecked,
            orElse: () => item.copyWith(id: 1),
          )
          .id,
      title: Text(item.title),
      secondary: Icon(
        item.iconData,
        color: Colors.black,
      ),
      subtitle: Text(
        item.subTitle,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.grey.shade500,
            ),
      ),
      onChanged: (value) {
        setState(() {
          _list =
              _list.map((e) => e.copyWith(isChecked: e.id == value)).toList();
        });
        widget.onItemChecked(value!);
      },
    );
  }
}
