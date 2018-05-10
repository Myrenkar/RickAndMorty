import UIKit
import RxSwift
import RxCocoa

final class CharactersViewController: ViewController {
    private let disposeBag = DisposeBag()
    private let viewModel: CharactersViewModelProtocol
    private let customView: CharactersView
    private let flowLayoutProvider: FlowLayoutProvidable

    init(viewModel: CharactersViewModelProtocol, flowLayoutProvider: FlowLayoutProvidable) {
        self.viewModel = viewModel
        customView = CharactersView(flowLayoutProvider: flowLayoutProvider)
        self.flowLayoutProvider = flowLayoutProvider
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getCharacters()
    }

    override func loadView() {
        view = customView
    }

    override func setupProperties() {
        super.setupProperties()

        customView.collectionView.registerClass(CharacterCell.self)
    }

    override func setupBindings() {
        super.setupBindings()

        viewModel.characters
            .bind(to: customView.collectionView.rx.items(cellIdentifier: CharacterCell.reuseIdentifier, cellType: CharacterCell.self)) { [unowned self] _, element, cell in
                print("Downloaded")

                let localDisposeBag = DisposeBag()
                cell.nameLabel.text = element.name

                self.viewModel.getCharactersImage(withURL: element.image)
                    .asObservable()
                    .bind(to: cell.imageView.rx.image)
                    .disposed(by: localDisposeBag)
            }
            .disposed(by: disposeBag)
    }

}
