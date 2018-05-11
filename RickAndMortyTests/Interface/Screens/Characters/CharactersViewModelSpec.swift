import Quick
import Nimble
import RxSwift
import RxBlocking
import RxTest

@testable import RickAndMorty

class CharactersViewModelSpec: QuickSpec {

    override func spec() {
        describe("CharactersViewModel") {
            var sut: CharactersViewModel!

            beforeEach {
                sut = CharactersViewModel(dependecies: ApplicationDependenciesProviderStub())
            }
        }
    }

}

class ApplicationDependenciesProviderStub: ApplicationDependenciesProvider {
    let apiClient: APIClient = APIClientSpy()
}

class APIClientSpy: APIClient {
    func perform(request: APIRequest) -> Single<APIResponse> {
        return Single.just(APIResponse(
            data: nil,
            response: HTTPURLResponse(
                url: URL(string: "fixed_url")!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil)!
            )
        )
    }
}
