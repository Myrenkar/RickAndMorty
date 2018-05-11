import UIKit

final class CharactersView: View {
    private let flowLayoutProvider: FlowLayoutProvidable

    init(flowLayoutProvider: FlowLayoutProvidable) {
        self.flowLayoutProvider = flowLayoutProvider
        super.init()
    }

    private(set) lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayoutProvider.defaultLayout)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .gray

        return collectionView
    }()

    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        addSubview(collectionView)
    }

    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func setupProperties() {
        super.setupProperties()
        backgroundColor = .red
    }
}
