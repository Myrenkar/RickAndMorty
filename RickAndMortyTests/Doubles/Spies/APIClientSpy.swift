import Foundation
import RxSwift

@testable import RickAndMorty

class APIClientSpy: APIClient {
    var performedRequest: APIRequest?

    func perform(request: APIRequest) -> Single<APIResponse> {
        performedRequest = request

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
