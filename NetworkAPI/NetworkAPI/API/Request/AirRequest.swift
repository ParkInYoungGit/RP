//
//  AirRequest.swift
//  NetworkAPI
//
//  Created by YOUNG on 2021/08/08.
//

import Alamofire
import Foundation


class AirRequest {
    func makeStringKoreanEncoded(_ string: String) -> String {
    return string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? string
    }
    
    func getAirData(_ viewController: WeatherViewController) {
        
        let url = "http://data.ex.co.kr/openapi/restinfo/restWeatherList?key=test&type=json&sdate=20210805&stdHour=10"
        
        let params: Parameters = [
            "key" : "test",
            "type" : "json",
            "sdate" : "20210805",
            "stdHour" : "10"
            
        ]
        
        // HTTP Method: GET
        let convertedURL = makeStringKoreanEncoded(url)

        AF.request(convertedURL,
                   method: .get,
                   parameters: params,
                   headers: nil)
            .responseDecodable(of: AirRseponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    print("DEBUG>> OpenAir Response \(response) ")
                    viewController.didSuccess2(response)
                    
                case .failure(let error):
                    print("DEBUG>> OpenAir Get Error : \(error.localizedDescription)")
                    
                }
            }
    }
    
}
