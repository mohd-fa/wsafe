class Contact {
  final String? name;
  final String number;
  final String? docid;
  Contact({this.name, required this.number, required this.docid});

  String toJstring() {
    return '{"name": "$name","number":"$number"}';
  }
}
