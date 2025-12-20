enum Priority {
  low,
  medium,
  high;
}

class Task {
  String? id;
  String subject;
  String content;
  String priority;
  String category;

  Task({this.id, required this.subject, required this.content,
        required this.priority, required this.category});

  Map<String, dynamic> toJson() {
    return {
      "subject": subject,
      "content": content,
      "category": category,
      "priority": priority
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'],
        subject: json['subject'],
        content: json['content'],
        priority: json['priority'],
        category: json['category']
    );
  }
}