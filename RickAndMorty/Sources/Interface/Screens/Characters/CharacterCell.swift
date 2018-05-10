import UIKit

final class CharacterCell: CollectionViewCell {
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)

        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)

        label.font = .systemFont(ofSize: 18)
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func setupViewHierarchy() {
        super.setupViewHierarchy()

        [imageView, nameLabel].forEach(contentView.addSubview)
    }

    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 16),

            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
