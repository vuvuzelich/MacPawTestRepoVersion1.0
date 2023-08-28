//
//  HomeControllerViewModel.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 27.08.2023.
//


import Foundation

class HomeViewModel {
    var onEquipmentUpdated: (() -> Void)?
    private(set) var filteredEquipment: [MilitaryModel] = []
    private var allEquipment: [MilitaryModel] = []
    
    func updateAllEquipment(_ newEquipment: [MilitaryModel]) {
        allEquipment = newEquipment
        updateSearchController(searchBarText: nil)
    }
    
    func updateSearchController(searchBarText: String?) {
        filteredEquipment = allEquipment
        
        if let searchText = searchBarText?.lowercased(), !searchText.isEmpty {
            filteredEquipment = filteredEquipment.filter { $0.model.lowercased().contains(searchText) }
        }
        
        onEquipmentUpdated?()
    }
    
    func loadDataFromJSON() {
        guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment_oryx.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let jsonData = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let equipments = try decoder.decode([MilitaryModel].self, from: jsonData)
                
                DispatchQueue.main.async {
                    self.updateAllEquipment(equipments)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}



