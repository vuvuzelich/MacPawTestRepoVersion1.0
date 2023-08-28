//
//  DetailsViewController.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 27.08.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    private let data: TodaysData
    
    init(data: TodaysData) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        self.navigationItem.title = "Інформація на \(self.data.day) день війни"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .yellow
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.date(from: data.date)
        
        let dateLabel = UILabel()
        dateLabel.font = UIFont.boldSystemFont(ofSize: 18)
        dateLabel.text = dateFormatter.string(from: formattedDate ?? Date())
        stackView.addArrangedSubview(dateLabel)
        
        let detailLabels = [
            "Знищено На \(data.day) День війни: ",
            "\(data.aircraft) Літаків",
            "\(data.helicopter) Вертольотів",
            "\(data.tank) Танкив: ",
            "\(data.apc ?? 0) БМП",
            "\(data.fieldArtillery) Артилерії",
            "\(data.mrl) БМЛ",
            "\(data.militaryAuto ?? 0) військових Авто ",
            "Витрачено \(data.fuelTank ?? 0) Паливних баків",
            "\(data.drone) Дронів",
            "\(data.navalShip) Морськіх кораблів",
            "Знищено \(data.antiAircraftWarfare) одиниць протиповітряної оборони",
            "\(data.specialEquipment ?? 0) Спеціального обладнання",
            "Знищено \(data.mobileSRBMSystem ?? 0) мобільної системи короткого радіусу дії",
            "Напрямок найбільших втрат: \(data.greatestLossesDirection ?? "Немає")",
            "Транспортні засоби та паливні баки: \(data.vehiclesAndFuelTanks ?? 0)",
            "Кризові ракети: \(data.cruiseMissiles ?? 0)"
        ]
        
        for detail in detailLabels {
            let detailLabel = UILabel()
            detailLabel.font = UIFont.systemFont(ofSize: 16)
            detailLabel.text = detail
            detailLabel.numberOfLines = 500
            stackView.addArrangedSubview(detailLabel)
        }
    }
}

