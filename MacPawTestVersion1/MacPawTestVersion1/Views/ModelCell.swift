//
//  ModelCell.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 26.08.2023.
//


import UIKit


class ModelCell: UITableViewCell {
    static let identifier = Constants.cellIdentifier
    
    private(set) var model: MilitaryModel!
    
    
    
    
    private let modelLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .black
        return iv
    }()

    private let modelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Error"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setModelLogoImage(_ image: UIImage) {
        modelLogo.image = image
    }

    public func configure(with militaryModel: MilitaryModel) {
        self.model = militaryModel
        self.modelTitle.text = model.model
        
        
        
    }

    private func setupUI() {
        addSubview(modelLogo)
        addSubview(modelTitle)

        modelLogo.translatesAutoresizingMaskIntoConstraints = false
        modelTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            modelLogo.centerYAnchor.constraint(equalTo: centerYAnchor),
            modelLogo.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            modelLogo.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            modelLogo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),

            modelTitle.leadingAnchor.constraint(equalTo: modelLogo.trailingAnchor, constant: 16),
            modelTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            modelTitle.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
    }
}

