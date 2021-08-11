//
//  AirResponse.swift
//  NetworkAPI
//
//  Created by YOUNG on 2021/08/08.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - Airreponse
struct AirRseponse: Decodable {
    let list: [List]
    let count: Int
    let message, code: String
}

// MARK: - List
struct List: Decodable {
    let unitName, unitCode, sdate, stdHour: String
    let routeNo, routeName: String
    let updownTypeCode: UpdownTypeCode
    let xValue, yValue, tmxValue, tmyValue: String
    let measurement, addr, addrCode, addrName: String
    let weatherContents: WeatherContents
    let statusNo, correctNo, cloudValue, addcloudValue: String
    let cloudformValue, tempValue, dewValue, discomforeValue: String
    let sensoryTemp, highestTemp, highestyearTemp, highestcompTemp: String
    let lowestTemp, lowestyearTemp, lowestcompTemp, rainfallValue: String
    let rainfallstrengthValue, newsnowValue, snowValue, humidityValue: String
    let windContents, windValue: String
}

enum UpdownTypeCode: String, Decodable {
    case e = "E"
    case s = "S"
}

enum WeatherContents: String, Decodable {
    case 구름많음 = "구름많음"
    case 구름조금 = "구름조금"
    case 맑음 = "맑음"
}

