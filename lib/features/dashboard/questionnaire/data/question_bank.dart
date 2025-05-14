class Question {
  final String question;
  final List<String> options;

  Question({required this.question, required this.options});
}

final List<Question> questionBank = [
  Question(
    question: 'Academic Strengths and Weaknesses: (Choose the option that best describes you)',
    options: [
      'I understand the main ideas well, but sometimes struggle with the step-by-step procedures.',
      'I\'m good at solving problems, but I find it hard to remember formulas and specific facts.',
      'I feel pretty comfortable with most aspects of this subject.',
      'I find the basic concepts challenging and need extra help to keep up.',
    ],
  ),
  Question(
    question: 'Preferred Learning Style: (Choose the option that best describes how you learn)',
    options: [
      'I learn best when I see pictures, diagrams, and videos.',
      'I learn best by listening to lectures and discussions.',
      'I learn best by doing things myself, like experiments or hands-on activities.',
      'I learn best by reading textbooks and writing notes.',
    ],
  ),
  Question(
    question: 'Attention Span: (Choose the option that best describes your focus in class)',
    options: [
      'I can usually focus for a long time without getting distracted.',
      'I can focus for a while, but I need short breaks to stay engaged.',
      'I get distracted easily and find it hard to pay attention for long periods.',
      'It\'s very hard for me to focus, even for short activities.',
    ],
  ),
  Question(
    question: 'Emotional State: (Choose the option that best describes how you generally feel about learning this subject)',
    options: [
      'I usually feel positive and interested in learning this subject.',
      'Sometimes I feel a bit worried or frustrated when learning this.',
      'I often feel unmotivated or not interested in this subject.',
      'I get quite stressed or upset when learning this subject and need a lot of support.',
    ],
  ),
  Question(
    question: 'Classroom Participation: (Choose the option that best describes your participation in class)',
    options: [
      'I often raise my hand, ask questions, and share my ideas.',
      'I participate when the teacher asks me directly.',
      'I usually just listen and don\'t talk much in class.',
      'I feel uncomfortable speaking in class.',
    ],
  ),
  Question(
    question: 'Homework Submission Timeliness: (Choose the option that best describes when you usually hand in homework)',
    options: [
      'I always submit my homework on time.',
      'I usually submit my homework on time, but sometimes it\'s a little late.',
      'My homework is often late.',
      'I rarely hand in my homework.',
    ],
  ),
  Question(
    question: 'Quiz Scores: (Choose the option that best describes your quiz performance)',
    options: [
      'I usually get very high scores on quizzes.',
      'I usually get good scores on quizzes.',
      'My quiz scores are usually just average.',
      'I often get low scores on quizzes.',
    ],
  ),
  Question(
    question: 'Confidence Level: (Choose the option that best describes how confident you feel in this subject)',
    options: [
      'I feel very confident in my ability to do well in this subject.',
      'I feel somewhat confident, but I sometimes doubt myself.',
      'I don\'t feel very confident in this subject.',
      'I have very little confidence in my ability to learn this subject.',
    ],
  ),
];
