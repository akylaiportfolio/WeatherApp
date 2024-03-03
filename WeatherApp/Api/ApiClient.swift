//
//  ApiClient.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 2/3/24.
//

import Foundation

class ApiClient {
    
    public static let shered = ApiClient()
    
    private let baseURL = "http://api.openweathermap.org/"
    
    private let key = "2f2d4e37af21bbbd0fc80ade5dbd3b12"
    
    func searchCity(name: String, _ result: @escaping (Result<[SearchModel], DecoderError>) -> Void) {
        let endpoint = "geo/1.0/direct"
        
        createTask(method: "GET", endpoint: endpoint, params: ["q" : name, "limit" : "30", "appid" : key], result)
    }
    
    func weather(_ model: SearchModel, _ result: @escaping (Result<WeatherModel, DecoderError>) -> Void) {
        let endpoint = "data/2.5/forecast"
        
        createTask(method: "GET", endpoint: endpoint, params: ["lat" : String(model.lat), "lon" : String(model.lon), "appid" : key], result)
    }
    
    private func createTask<T: Codable>(method: String, endpoint: String, params: [String: String], _ result: @escaping (Result<T, DecoderError>) -> Void) {
        var urlComponents = URLComponents(string: baseURL + endpoint)
        
        urlComponents?.queryItems = params.map { it in
            URLQueryItem(name: it.key, value: it.value)
        }
        
        guard let url = urlComponents?.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let model = try JSONDecoder().decode(T.self, from: data)
                        
                        result(.success(model))
                    } catch {
                        result(.failure(DecoderError(message: "\(self.baseURL + endpoint) parse not work")))
                    }
                } else {
                    result(.failure(DecoderError(message: "\(self.baseURL + endpoint) data not")))
                }
            }
        }.resume()
    }
}
