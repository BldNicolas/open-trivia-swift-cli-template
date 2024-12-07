import Foundation

public class QuestionRepository {
    public init() {}

    public func fetchQuestions() async throws -> [Question] {
        let url = URL(string: "https://opentdb.com/api.php?amount=10")!

        let (data, _) = try await URLSession.shared.data(from: url)

        let decoded = try JSONDecoder().decode(Questions.self, from: data)

        return decoded.results
    }

    public func fetchQuestions(numberOfQuestions: Int) async throws -> [Question] {
        let url = URL(string: "https://opentdb.com/api.php?amount=\(numberOfQuestions)")!

        let (data, _) = try await URLSession.shared.data(from: url)

        let decoded = try JSONDecoder().decode(Questions.self, from: data)

        return decoded.results
    }

}
