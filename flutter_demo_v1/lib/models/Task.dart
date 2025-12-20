enum Priority {
  low,
  medium,
  high;
}

class Task {
  String? id;
  String subject;
  String content;
  String category;
  String priority;

  Task({this.id, required this.subject, required this.content,
        required this.category, required this.priority});

  Map<String, dynamic> toJson() {
    return {
      "subject": this.subject,
      "content": this.content,
      "category": this.category,
      "priority": this.priority
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'],
        subject: json['subject'],
        content: json['content'],
        category: json['category'],
        priority: json['priority']
    );
  }
}