class Student {
  String name;
  String city;
  String university;
  String year;
  String universityNumber;

  Student({this.name, this.city, this.university, this.year, this.universityNumber});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'] as String,
      city: json['city'] as String,
      university: json['university'] as String,
      year: json['year'] as String,
      universityNumber: json['universityNumber'] as String,
    );
  }
}// TODO Implement this library.