//
//  WeatherRequest.swift
//  NetworkAPI
//
//  Created by YOUNG on 2021/08/07.
//

import Alamofire
import Foundation

class WeatherRequest {
    
    func getWeatherData(_ viewController: ViewController) {
        
        let url = "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=70712209ed38b3c9995cdcdd87bda250"
        
        let params: Parameters = [
            "q" : "seoul",
            "appid" : "70712209ed38b3c9995cdcdd87bda250"
        ]
        
        // HTTP Method: GET
        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: nil)
            .responseDecodable(of: WeatherResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    print("DEBUG>> OpenWeather Response \(response) ")
                    viewController.didSuccess(response)
                    
                case .failure(let error):
                    print("DEBUG>> OpenWeather Get Error : \(error.localizedDescription)")
                    
                }
            }
    }
    
}
