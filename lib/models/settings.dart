class Settings {
  bool from;
  bool to;
  bool message = true; // Static property with a default value
  bool music;

  Settings({
    required this.from,
    required this.to,
    required this.music,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      from: json['from'] ?? false, // Handle null values if any
      to: json['to'] ?? false,
      music: json['music'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
      'message': message,
      'music': music,
    };
  }
}
