import Foundation

struct RickAndMortyService: APIService {
    var host: String { return "rickandmortyapi.com" }
    var root: String { return "api" }
}
