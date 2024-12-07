public class Console {
    let questionRepository = QuestionRepository()

    func welcome() {
        print("Bienvenue dans trivia !")
        self.showQuestions()
    }

    func showQuestions() {
        Task {
            do {
                let questions = try await questionRepository.fetchQuestions()
                var questionNumber = 1
                
                questions.forEach { question in
                    showQuestion(question: question, questionNumber: questionNumber)

                    showAnswers(answers: question.answers)

                    showSeparation()
                    
                    questionNumber += 1
                }
            } catch {
                print("❌ Failed to fetch questions: \(error)")
            }
        }
    }

    func showQuestion(question: Question, questionNumber: Int) {
        print("\n🌟 Question \(questionNumber):")
        print("\(question.question)")
    }

    func showAnswers(answers: Array<String>) {
        print("\nAnswers:")

        var answerNumber: Int = 1

        answers.forEach { answer in
            print("  \(answerNumber). \(answer)")
            answerNumber += 1
        }
    }

    func showSeparation() {
        print("\n" + String(repeating: "=", count: 50))
    }
}
