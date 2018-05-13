import UIKit

final class ApplicationController {

    init(dependencies: ApplicationDependenciesProvider) {
        self.dependencies = dependencies
    }

    private let dependencies: ApplicationDependenciesProvider

    private(set) lazy var rootViewController: UINavigationController = {
        let rootViewController = CharactersViewController(viewModel: CharactersViewModel(charactersService: dependencies.charactersService), flowLayoutProvider: FlowLayoutProvider())
        let navigationController = UINavigationController(rootViewController: rootViewController)
        return navigationController
    }()
}
