import Quick
import Nimble
import RxTest

@testable import RickAndMorty

class CharactersViewModelSpec: QuickSpec {

    override func spec() {
        describe("CharactersViewModel") {
            var apiClientSpy: APIClientSpy!
            var sut: CharactersViewModel!

            beforeEach {
                apiClientSpy = APIClientSpy()

                sut = CharactersViewModel(apiClient: apiClientSpy)
            }

            context("when binding to characters") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<[SeriesCharacter]>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver([SeriesCharacter].self)

                    _ = sut.characters.subscribe(observer)
                }

                it("should trigger characters request") {
                    expect(apiClientSpy.performedRequest).to(beAKindOf(CharactersRequest.self))
                }

                it("should") {

                }
            }
        }
    }

}
