//
//  ViewEqvipmentControllerViewModel.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 26.08.2023.
//

import Foundation

class ViewEquipmentControllerViewModel {
    let equipment: MilitaryModel
    
    init(equipment: MilitaryModel) {
        self.equipment = equipment
    }
    
    var modelLabel: String {
        return "Модель \(equipment.model)"
    }
    
    var equipmentOryxLabel: String {
        return "Категорія \(equipment.equipmentOryx)"
    }
    
    var manufacturerLabel: String {
        return "Країна виробник \(equipment.manufacturer.rawValue)"
    }
    
    var lossesTotalLabel: String {
        return "Знищено силами ЗСУ \(equipment.lossesTotal) одиниць"
    }
    
    var equipmentUaLabel: String {
        return "Належіть до категорії \(equipment.equipmentUa.rawValue)"
    }
}

