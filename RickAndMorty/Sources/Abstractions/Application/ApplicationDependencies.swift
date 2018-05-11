import Foundation

/// Describes a type that is providing application dependencies.
protocol ApplicationDependenciesProvider {
    var apiClient: APIClient { get }
}

final class DefaultApplicationDependenciesProvider: ApplicationDependenciesProvider {
    private(set) lazy var apiClient: APIClient = { [unowned self] in
       return DefaultAPIClient()
    }()
}
