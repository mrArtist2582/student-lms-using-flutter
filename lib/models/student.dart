class Student {
  final String name;
  final String profilePicture;
  final String? location;
  final String? className;
  final String? schoolName;
  final List<String>? subjects;
  final String? email;
  final String? phone;

  Student({
    required this.name,
    required this.profilePicture,
    this.location,
    this.className,
    this.schoolName,
    this.subjects,
    this.email,
    this.phone,
  });
}
