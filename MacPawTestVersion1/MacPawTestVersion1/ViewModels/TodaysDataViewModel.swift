//
//  LastDayController.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 27.08.2023.
//

import Foundation

class TodaysDataViewModel {
    var todaysData: [TodaysData] = []
    
    func loadData(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/c5f7deaa838c0a2243b5a59d5b5fd9cf463b4dda/data/russia_losses_equipment.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let loadedData = try decoder.decode([TodaysData].self, from: data)
                    self.todaysData = loadedData.reversed()
                    completion()
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}


