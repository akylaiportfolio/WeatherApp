//
//  SearchModel.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 2/3/24.
//

import Foundation

struct SearchModel: Codable, Equatable {
    let name: String
    let lat, lon: Double
    let country: String
}
