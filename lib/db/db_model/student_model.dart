class studentModel {
  final String name;
  final String age;
  int? id;
  studentModel({required this.name, required this.age, this.id});
  static studentModel toStuModObj(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final age = map['age'] as String;
    return studentModel(name: name, age: age, id: id);
  }
}
