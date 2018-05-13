import Foundation

struct RickAndMortyRLBuilder: APIURLBuilder {
    var host: String { return "rickandmortyapi.com" }
    var root: String { return "api" }
}
