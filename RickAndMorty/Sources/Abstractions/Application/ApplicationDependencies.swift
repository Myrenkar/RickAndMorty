import Foundation

/// Describes a type that is providing application dependencies.
protocol ApplicationDependenciesProvider {
    var apiClient: APIClient { get }
    var remoteImageDownloader: RemoteImageDownloadProtocol { get }
}

final class DefaultApplicationDependenciesProvider: ApplicationDependenciesProvider {
    private(set) lazy var apiClient: APIClient = { [unowned self] in
       return DefaultAPIClient()
    }()

    private(set) lazy var remoteImageDownloader: RemoteImageDownloadProtocol = {
        return RemoteImageDownloader(session: .shared)
    }()
}
