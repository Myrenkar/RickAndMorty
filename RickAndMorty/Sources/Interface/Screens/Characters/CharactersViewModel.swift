import Foundation
import RxSwift
import UIKit

protocol CharactersViewModelProtocol {
    var characters: Observable<[Character]> { get }

    func getCharacters()
    func getCharactersImage(withURL url: URL) -> Single<UIImage>
}

class CharactersViewModel: CharactersViewModelProtocol {
    private let dependecies: ApplicationDependenciesProvider
    private let charactersSubject = PublishSubject<[Character]>()
    private let disposeBag = DisposeBag()

    init(dependecies: ApplicationDependenciesProvider) {
        self.dependecies = dependecies
    }

    var characters: Observable<[Character]> {
        return charactersSubject.asObservable()
    }

    func getCharacters() {
        dependecies.apiClient.perform(request: CharactersRequest())
            .filter { $0.data != nil }
            .map { try JSONDecoder().decode(CharacterResponse.self, from: $0.data!) }
            .map { $0.characters }
            .subscribe(onSuccess: { [unowned self] in
                self.charactersSubject.onNext($0)
            })
            .disposed(by: disposeBag)
    }

    func getCharactersImage(withURL url: URL) -> Single<UIImage> {
        return dependecies.remoteImageDownloader.downloadImage(withURL: url)
    }

}

