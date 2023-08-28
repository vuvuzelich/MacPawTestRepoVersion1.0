//
//  ViewInfoController.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 26.08.2023.
//

import UIKit

class ViewInfoController: UIViewController {
    
    // Variables
    let viewModel: ViewEquipmentControllerViewModel
    
    // UI Components
    
    private var scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let modelLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        return iv
    }()
    
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [modelLogo, createLabel(withText: viewModel.modelLabel),
                                                    createLabel(withText: viewModel.equipmentUaLabel),
                                                    createLabel(withText: viewModel.lossesTotalLabel),
                                                    createLabel(withText: viewModel.manufacturerLabel),
                                                    createLabel(withText: viewModel.equipmentOryxLabel)])
        vStack.axis = .vertical
        vStack.spacing = 12
        vStack.distribution = .fill
        vStack.alignment = .center
        return vStack
    }()
    
    // UI Setup
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(modelLogo)
        contentView.addSubview(vStack)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        modelLogo.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            modelLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            modelLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            modelLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            modelLogo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            modelLogo.heightAnchor.constraint(equalToConstant: 200),
            
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.topAnchor.constraint(equalTo: modelLogo.bottomAnchor, constant: 20),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func createLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = text
        label.numberOfLines = 3
        return label
    }
    
    // Lifecycle
    init(viewModel: ViewEquipmentControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .systemBackground
        navigationItem.title = viewModel.modelLabel
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .yellow
        if let image = UIImage(named: viewModel.equipment.model, in: Bundle.main, compatibleWith: nil) {
            modelLogo.image = image
        }
    }
}
