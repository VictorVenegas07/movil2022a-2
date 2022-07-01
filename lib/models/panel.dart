class Item {
  Item(
      {required this.expandedValue,
      required this.headerValue,
      this.isExpanded = false});

  String expandedValue;
  String headerValue;
  List<String> videos = ['https://www.youtube.com/watch?v=2aJZzRMziJc'];
  bool isExpanded;
}

List<Item> generateItems() {
  return List<Item>.generate(8, (int index) {
    return Item(
      headerValue: 'Rutina',
      expandedValue: 'xxRutina $index',
    );
  });
}
