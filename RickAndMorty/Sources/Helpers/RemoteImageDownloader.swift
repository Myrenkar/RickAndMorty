import UIKit
import RxSwift

protocol RemoteImageDownloadProtocol {
    func downloadImage(withURL url: URL) -> Single<UIImage>
}

final class RemoteImageDownloader: RemoteImageDownloadProtocol {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func downloadImage(withURL url: URL) -> Single<UIImage> {
        return Single<UIImage>.create { [unowned self] single in

            let task = self.session.dataTask(with: url, completionHandler: { data, response, error in
                if let response = response as? HTTPURLResponse {
                    if 200..<300 ~= response.statusCode {
                        let apiResponse = APIResponse(data: data, response: response)
                        guard let data = apiResponse.data, let image = UIImage(data: data) else {
                            single(.error(TypelessError(reason: "Couldn't download the image")))
                            return
                        }
                        single(.success(image))
                    }
                } else {
                    single(.error(TypelessError(reason: "Couldn't download the image")))
                }
            })

            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
