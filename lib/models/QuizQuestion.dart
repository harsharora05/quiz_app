class QuizQuestion {
  const QuizQuestion(this.ques, this.answers);
  final String ques;
  final List<String> answers;

  List<String> GetShuffledList() {
    final suffledList = List.of(answers);
    suffledList.shuffle();
    return suffledList;
  }
}
