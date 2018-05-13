import Quick
import Nimble
import RxTest

@testable import RickAndMorty

class CharactersViewModelSpec: QuickSpec {

    override func spec() {
        describe("CharactersViewModel") {
            var apiClientSpy: APIClientSpy!
            var sut: CharactersViewModel!
            var scheduler: TestScheduler!
            var observer: TestableObserver<[SeriesCharacter]>!

            beforeEach {
                apiClientSpy = APIClientSpy()
                scheduler = TestScheduler(initialClock: 0)
                observer = scheduler.createObserver([SeriesCharacter].self)

                sut = CharactersViewModel(apiClient: apiClientSpy)
            }

            context("when binding to characters") {
                beforeEach {
                    _ = sut.characters.subscribe(observer)
                }

                it("should trigger characters request") {
                    expect(apiClientSpy.performedRequest).to(beAKindOf(CharactersRequest.self))
                }
            }

            context("when response does not contain data") {
                beforeEach {
                    apiClientSpy.responseData = nil

                    _ = sut.characters.subscribe(observer)
                }

                it("should emit just one event") {
                    expect(observer.events.count).to(equal(1))
                }
            }

            context("when response is valid") {
                beforeEach {
                    apiClientSpy.responseData = SeriesCharacter.testRickAndMorty

                    _ = sut.characters.subscribe(observer)
                }

                it("should return 2 characters") {
                    expect(observer.events.first!.value.element!.count).to(equal(2))
                }
            }
        }
    }

}
