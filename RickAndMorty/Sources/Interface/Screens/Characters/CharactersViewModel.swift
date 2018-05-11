import Foundation
import RxSwift
import UIKit

protocol CharactersViewModelProtocol {
    var characters: Observable<[Character]> { get }
}

class CharactersViewModel: CharactersViewModelProtocol {

    // MARK: - Properties

    private let dependecies: ApplicationDependenciesProvider
    private let disposeBag = DisposeBag()

    // MARK: - CharactersViewModelProtocol

    var characters: Observable<[Character]> {
        return dependecies.apiClient.perform(request: CharactersRequest())
            .filter { $0.data != nil }
            .map { try JSONDecoder().decode(CharacterResponse.self, from: $0.data!) }
            .map { $0.characters }
            .asObservable()
    }

    // MARK: - Init

    init(dependecies: ApplicationDependenciesProvider) {
        self.dependecies = dependecies
    }

}
