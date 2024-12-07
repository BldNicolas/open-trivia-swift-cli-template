import Foundation

public struct Questions: Decodable {
    public let results: [Question]
}

public struct Question: Decodable {
    public let type: String
    public let difficulty: String
    public let category: String
    public let question: String
    public let correct_answer: String
    public let incorrect_answers: [String]
    public var answers: [String] {
        var allAnswers = incorrect_answers + [correct_answer]
        allAnswers.shuffle()
        return allAnswers
    }
    
    private enum CodingKeys: String, CodingKey {
        case type, difficulty, category, question
        case correct_answer
        case incorrect_answers
    }
}