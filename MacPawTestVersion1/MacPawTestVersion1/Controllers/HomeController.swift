//
//  ViewController.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 25.08.2023.
//

import UIKit

class HomeController: UIViewController {

    var viewModel: HomeViewModel = HomeViewModel()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.register(ModelCell.self, forCellReuseIdentifier: ModelCell.identifier)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.onEquipmentUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.loadDataFromJSON()
    }
    
    private func setupUI() {
        navigationItem.title = "Моделі"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Шукати модель"
        
        navigationItem.searchController = searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension HomeController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.updateSearchController(searchBarText: searchController.searchBar.text)
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredEquipment.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? ModelCell else {
            fatalError("Error creating ModelCell in HomeController")
        }

        let equipment = viewModel.filteredEquipment[indexPath.row]
        cell.configure(with: equipment)

        if let image = UIImage(named: equipment.model) {
            cell.setModelLogoImage(image)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let equipment = viewModel.filteredEquipment[indexPath.row]
        let vm = ViewEquipmentControllerViewModel(equipment: equipment)
        let vc = ViewInfoController(viewModel: vm)
        navigationController?.pushViewController(vc, animated: true)
    }
}





