class Quiz {
  String question;
  List<String> choices;
  String answer;
  String? image;

  Quiz({required this.question, required this.choices, required this.answer, this.image});


 dynamic toJson() => {
    'question': question,
    'choices': choices,
    'answer': answer,
    'image': image
  };

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      question: json['question'],
      choices: json['choices'].cast<String>(),
      answer: json['answer'],
      image: json['image'],
    );
  }
}