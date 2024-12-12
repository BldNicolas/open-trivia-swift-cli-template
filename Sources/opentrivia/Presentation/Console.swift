import Foundation

public class Console {
    let questionRepository = QuestionRepository()

    func welcome() {
        print("Welcome in Trivia!")
        showQuestions()
    }

    func showQuestions() {
        Task {
            do {
                let questions = try await questionRepository.fetchQuestions()
                var questionNumber = 1
                
                questions.forEach { question in
                    showQuestion(question: question, questionNumber: questionNumber)

                    showAnswers(answers: question.answers)

                    let userAnswer = getUserAnswer(answers: question.answers)
                    if userAnswer == question.correct_answer {
                        print("\nCorrect answer!")
                    } else {
                        print("\nIncorrect answer!\nThe correct answer was: \(question.correct_answer)")
                    }

                    showSeparation()
                    
                    questionNumber += 1
                }
                exit(EXIT_SUCCESS)
            } catch {
                print("❌ Failed to fetch questions: \(error)")
                exit(EXIT_FAILURE)
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

    func getUserAnswer(answers: [String]) -> String {
        print("\nWhat is your answer? (Type the number of the answer)")
        while true {
            if let input = readLine(), 
            let selectedAnswer = Int(input), 
            selectedAnswer > 0, 
            selectedAnswer <= answers.count {
                return answers[selectedAnswer - 1]
            } else {
                print("\nInvalid input! Please enter a number between 1 and \(answers.count).")
            }
        }
    }
}