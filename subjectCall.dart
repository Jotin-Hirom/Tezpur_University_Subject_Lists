import 'dart:convert';
import 'dart:io';

// Define a Subject class
class Subject {
  final String code;
  final String courseName;

  Subject({required this.code, required this.courseName});

  // Convert JSON -> Dart object
  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(code: json['code'], courseName: json['course_name']);
  }

  // Convert Dart object -> JSON (optional)
  Map<String, dynamic> toJson() {
    return {'code': code, 'course_name': courseName};
  }
}

void main() async {
  // Read JSON file
  final file = File('subjectCode.json');
  final contents = await file.readAsString();

  // Decode JSON
  final jsonData = jsonDecode(contents);

  // Parse into a list of Subject objects
  final subjects = (jsonData['subjects'] as List)
      .map((item) => Subject.fromJson(item))
      .toList();

  // Print them out
  print('Tezpur University Subjects:');
  for (var subject in subjects) {
    print('${subject.code} - ${subject.courseName}');
  }

  // Example: find a subject by code
  final searchCode = 'MS101';
  final found = subjects.firstWhere(
    (s) => s.code == searchCode,
    orElse: () => Subject(code: 'N/A', courseName: 'Not Found'),
  );
  print('\nSearch result for "$searchCode": ${found.courseName}');
}
