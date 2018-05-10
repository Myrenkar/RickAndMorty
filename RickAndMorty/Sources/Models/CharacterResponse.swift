import Foundation

struct CharacterResponse: Codable {
    let characters: [Character]

    private enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
}
