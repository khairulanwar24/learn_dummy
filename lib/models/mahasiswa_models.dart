class Mahasiswa {
  final String text;
  final String website;

  Mahasiswa({
    required this.text,
    required this.website,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(
      text: json['text'],
      website: json['website-link'],
    );
  }
}
