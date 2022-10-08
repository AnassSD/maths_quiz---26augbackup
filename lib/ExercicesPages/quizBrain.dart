// ignore_for_file: file_names

class Content {
  String? title, awnser1, awnser2, awnser3, awnser4;
  String? questionText;
  int? rightIndex;
  Content(
      {this.title,
      this.awnser1,
      this.awnser2,
      this.awnser3,
      this.awnser4,
      this.questionText,
      this.rightIndex});
}

List<Content> page1 = [
      Content(
          questionText:
              r'Avoir \(\cos(\theta) =-\frac{1}{2}\) et \(\sin(\theta) = \frac{\sqrt{3}}{2}\). Alors',
          awnser1: r'\theta = \frac{2\pi}{3}',
          awnser2: r'\theta = \frac{\pi}{6}',
          awnser3: r'\theta = -\frac{2\pi}{3}',
          awnser4: r'\theta = -\frac{\pi}{3}',
          rightIndex: 1),
      Content(
        questionText:
            r'Choisir le somme supérieur a cent',
        awnser1: r'37 + 48',
        awnser2: r'99 + 15',
        awnser3: r'68 + 17',
        awnser4: r'70 + 13',
        rightIndex: 2,
      ),
      Content(
          questionText:
              r'Avoir hhh \(\cos(\theta) =-\frac{1}{2}\) et \(\sin(\theta) = \frac{\sqrt{3}}{2}\). Alors',
          awnser1: r'\theta = \frac{2\pi}{3}',
          awnser2: r'\theta = \frac{\pi}{6}',
          awnser3: r'\theta = -\frac{2\pi}{3}',
          awnser4: r'\theta = -\frac{\pi}{3}',
          rightIndex: 1),
      Content(
        questionText:
            'Which of the following statements about the domain and range of a relation is always true?',
        awnser1: 'Tblabalalalallalalal.',
        awnser2: 'The range must always have at least two values.',
        awnser3: 'The range must always have at ',
        awnser4: '322',
        rightIndex: 2,
      ),
      Content(
          questionText:
              r'Avoir \(\cos(\theta) =-\frac{1}{2}\) et \(\sin(\theta) = \frac{\sqrt{3}}{2}\). Alors',
          awnser1: r'\theta = \frac{2\pi}{3}',
          awnser2: r'\theta = \frac{\pi}{6}',
          awnser3: r'\theta = -\frac{2\pi}{3}',
          awnser4: r'\theta = -\frac{\pi}{3}',
          rightIndex: 1),
      Content(
          questionText:
              r'Avoir \(\cos(\theta) =-\frac{1}{2}\) et \(\sin(\theta) = \frac{\sqrt{3}}{2}\). Alors',
          awnser1: r'\theta = \frac{2\pi}{3}',
          awnser2: r'\theta = \frac{\pi}{6}',
          awnser3: r'\theta = -\frac{2\pi}{3}',
          awnser4: r'\theta = -\frac{\pi}{3}',
          rightIndex: 1),
    ],
    page2 = [
      Content(
          questionText:
              'Which owf the following statements about functions and relations is always true?',
          awnser1: 'A adedwW always a relation.',
          awnser2: 'A relation is always a function.',
          awnser3: 'A relation must have at least two ordered pairs.',
          awnser4: '322',
          rightIndex: 1),
      Content(
        questionText:
            'Which of the following statements about the domain and range of a relation is always true?',
        awnser1: 'Tblabalalalallalalal.',
        awnser2: 'The range must always have at least two values.',
        awnser3: 'The range must always have at ',
        awnser4: '322',
        rightIndex: 2,
      )
    ],
    page3 = [
      Content(
          questionText:
              'Which of the following statements about functions and relations is always true?',
          awnser1: 'A adedwW always a relation.',
          awnser2: 'A relation is always a function.',
          awnser3: 'A relation must have at least two ordered pairs.',
          awnser4: '322',
          rightIndex: 1),
      Content(
        questionText:
            'Which of the following statements about the domain and range of a relation is always true?',
        awnser1: 'Tblabalalalallalalal.',
        awnser2: 'The range must always have at least two values.',
        awnser3: 'The range must always have at ',
        awnser4: '322',
        rightIndex: 2,
      )
    ],
    page4 = [
      Content(
          questionText:
              'Which of the following statements about functions and relations is always true?',
          awnser1: 'A adedwW always a relation.',
          awnser2: 'A relation is always a function.',
          awnser3: 'A relation must have at least two ordered pairs.',
          awnser4: '322',
          rightIndex: 1),
      Content(
        questionText:
            'Which of the following statements about the domain and range of a relation is always true?',
        awnser1: 'Tblabalalalallalalal.',
        awnser2: 'The range must always have at least two values.',
        awnser3: 'The range must always have at ',
        awnser4: '322',
        rightIndex: 2,
      )
    ];
int questionNumber = 0;

class QuizBrain {
  List<List<Content>> pages = [
    page1,
    page2,
    page3,
    page4,
  ];
  void nextQuestion() {
    questionNumber++;
  }
}
