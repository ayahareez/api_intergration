class EmojiRandomModel{

  final String name,category,group;
  final List<dynamic> htmlCode,unicode;
  EmojiRandomModel({required this.name, required this.category, required this.group, required this.htmlCode, required this.unicode});
  factory EmojiRandomModel.fromMap(Map<String,dynamic> map)=>EmojiRandomModel(name: map['name'], category: map['category'], group: map['group'], htmlCode: map['htmlCode'], unicode: map['unicode']);
}