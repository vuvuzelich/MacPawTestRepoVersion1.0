//
//  TodaysDataController.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 28.08.2023.
//

import UIKit

class TodaysDataController: UIViewController {
    private var todaysData: [TodaysData] = []
    private var tableView: UITableView!
    private var viewModel = TodaysDataViewModel() 
    
    init(viewModel: TodaysDataViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }// Создание экземпляра ViewModel
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        loadTodaysData()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 18)
        ]
        navigationItem.title = "Список дат"
    }
    
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TodaysDataCell.self, forCellReuseIdentifier: "TodaysDataCell")
        view.addSubview(tableView)
    }
    
    private func loadTodaysData() {
        viewModel.loadData { [weak self] in
            self?.todaysData = self?.viewModel.todaysData ?? []
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension TodaysDataController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todaysData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodaysDataCell", for: indexPath) as! TodaysDataCell
        let data = todaysData[indexPath.row]
        cell.configure(with: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = todaysData[indexPath.row]
        let detailsVC = DetailsViewController(data: selectedData)
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }
}
