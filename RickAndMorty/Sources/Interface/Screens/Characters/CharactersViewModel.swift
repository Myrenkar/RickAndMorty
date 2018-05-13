import Foundation
import RxSwift
import UIKit

protocol CharactersViewModelProtocol {
    var characters: Observable<[SeriesCharacter]> { get }
}

class CharactersViewModel: CharactersViewModelProtocol {

    // MARK: - Properties

    private let apiClient: APIClient
    private let disposeBag = DisposeBag()

    // MARK: - CharactersViewModelProtocol

    var characters: Observable<[SeriesCharacter]> {
        return apiClient.perform(request: CharactersRequest())
            .filter { $0.data != nil }
            .map { try JSONDecoder().decode(CharacterResponse.self, from: $0.data!) }
            .map { $0.characters }
            .asObservable()
    }

    // MARK: - Init

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

}
