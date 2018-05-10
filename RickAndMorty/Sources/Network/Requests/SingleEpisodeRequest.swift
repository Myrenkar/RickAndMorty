import Foundation

struct SingleEpisodeRequest: APIRequest {
    private let episodeId: Int

    init(episodeId: Int) {
        self.episodeId = episodeId
    }

    var path: String { return "episode/\(episodeId)" }
}
