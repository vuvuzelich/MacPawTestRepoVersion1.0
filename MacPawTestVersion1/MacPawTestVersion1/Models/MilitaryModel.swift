//
//  Stats.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 25.08.2023.
//

import Foundation


struct MilitaryModel: Codable {
    let equipmentOryx, model: String
    let manufacturer: Manufacturer
    let lossesTotal: Int
    let equipmentUa: EquipmentUa

    enum CodingKeys: String, CodingKey {
        case equipmentOryx = "equipment_oryx"
        case model, manufacturer
        case lossesTotal = "losses_total"
        case equipmentUa = "equipment_ua"
    }
}

enum EquipmentUa: String, Codable {
    case aircrafts = "Aircrafts"
    case antiAircraftWarfareSystems = "Anti-aircraft Warfare Systems"
    case armouredPersonnelCarriers = "Armoured Personnel Carriers"
    case artillerySystems = "Artillery Systems"
    case helicopters = "Helicopters"
    case multipleRocketLaunchers = "Multiple Rocket Launchers"
    case specialEquipment = "Special Equipment"
    case tanks = "Tanks"
    case unmannedAerialVehicles = "Unmanned Aerial Vehicles"
    case vehicleAndFuelTank = "Vehicle and Fuel Tank"
    case warshipsBoats = "Warships, Boats"
}

enum Manufacturer: String, Codable {
    case iran = "Iran"
    case israel = "Israel"
    case italy = "Italy"
    case poland = "Poland"
    case russia = "Russia"
    case theCzechRepublic = "the Czech Republic"
    case theSovietUnion = "the Soviet Union"
}



//extension MilitaryModel {
//    public static func getMockArray() -> [MilitaryModel] {
//        return [MilitaryModel(equipmentOryx: "T92", model: "t44", manufacturer: .russia, lossesTotal: 83, equipmentUa: .tanks),
//                MilitaryModel(equipmentOryx: "T32723232", model: "t4767754", manufacturer: .russia, lossesTotal: 83, equipmentUa: .tanks),
//                MilitaryModel(equipmentOryx: "T72", model: "t46456544", manufacturer: .russia, lossesTotal: 83, equipmentUa: .tanks), ]
//    }
//    
//}
