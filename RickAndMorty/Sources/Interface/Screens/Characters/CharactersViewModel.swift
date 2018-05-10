import Foundation
import RxSwift
import UIKit

protocol CharactersViewModelProtocol {
    var characters: BehaviorSubject<[Character]> { get }
    
    func getCharacters()
    func getCharactersImage(withURL url: URL) -> Single<UIImage>
}

class CharactersViewModel: CharactersViewModelProtocol {
    private let dependecies: ApplicationDependenciesProvider
    private let disposeBag = DisposeBag()

    var characters: BehaviorSubject<[Character]>

    init(dependecies: ApplicationDependenciesProvider) {
        self.dependecies = dependecies
        self.characters = BehaviorSubject(value: [])
    }

    func getCharacters() {
        dependecies.apiClient.perform(request: CharactersRequest())
            .filter { $0.data != nil }
            .map { try JSONDecoder().decode(CharacterResponse.self, from: $0.data!) }
            .map { $0.characters }
            .asObservable()
            .bind(to: characters)
            .disposed(by: disposeBag)
    }

    func getCharactersImage(withURL url: URL) -> Single<UIImage> {
        return dependecies.remoteImageDownloader.downloadImage(withURL: url)
    }

}

