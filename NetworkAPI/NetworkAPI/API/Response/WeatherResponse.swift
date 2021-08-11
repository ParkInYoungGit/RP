//
//  WeatherResponse.swift
//  NetworkAPI
//
//  Created by YOUNG on 2021/08/07.
//

import Foundation

struct WeatherResponse: Decodable {
    
    var coord: coord
    var weather: [weather]
    var base: String
    var main: main
    var visibility: Int
    var wind: wind
    var clouds: clouds
    var dt: Int
    var sys: sys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}

struct coord: Decodable {
    
    var lon: Float
    var lat: Float
}

struct weather: Decodable {
    
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct main: Decodable {
    
    var temp: Float
    var feels_like: Float
    var temp_min: Float
    var temp_max: Float
    var pressure: Float
    var humidity: Float
}

struct wind: Decodable {
    
    var speed: Float
    var deg: Int
}

struct clouds: Decodable {
    var all: Int
}

struct sys: Decodable {
    
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}

