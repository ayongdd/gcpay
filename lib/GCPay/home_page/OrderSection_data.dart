import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

import 'Model/HomePage_Record_entity.dart';

///
/// create some example data.
///
class MockData {
  ///return a example list, by default, we have 4 sections,
  ///each section has 5 items.
  static List<OrderSection> getExampleSections(
      [int sectionSize = 10, int itemSize = 5]) {
    var sections = List<OrderSection>.empty(growable: true);
    for (int i = 0; i < sectionSize; i++) {
      var section = OrderSection()
        ..header = "Header#$i"
        ..items = List.generate(itemSize, (index) => "ListTile #$index")
        ..expanded = true;
      sections.add(section);
    }
    return sections;
  }
}

class PayMethodEntity {
  final int id;
  final String name;
  final String pic;
  PayMethodEntity({
    required this.id,
    required this.name,
    required this.pic,
  });
}

///Section model example
///
///Section model must implements ExpandableListSection<T>, each section has
///expand state, sublist. "T" is the model of each item in the sublist.
class OrderSection implements ExpandableListSection<String> {
  //store expand state.
  late bool expanded;

  //return item model list.
  late List<String> items;
  List<String> prices = [];
  List<num> splits = [];
  List<List<Payment>> paymethods = [];
  List<UmsPaymentBuyer> paymentbuyer = [];

  //example header, optional
  late String header;

  @override
  List<String> getItems() {
    return items;
  }

  @override
  bool isSectionExpanded() {
    return expanded;
  }

  @override
  void setSectionExpanded(bool expanded) {
    this.expanded = expanded;
  }
}
