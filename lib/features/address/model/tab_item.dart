class TabItem {
  final int id;
  final String title;
  final bool isSelected;

  TabItem({
    required this.id,
    required this.title,
    required this.isSelected,
  });

  TabItem copyWith({
    int? id,
    String? title,
    bool? isSelected,
  }) {
    return TabItem(
      id: id ?? this.id,
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
