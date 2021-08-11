//
//  WeatherViewController.swift
//  NetworkAPI
//
//  Created by YOUNG on 2021/08/07.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherImage: UIImageView!
    var weather : String? = ""
    var name : String = ""
    @IBOutlet weak var lblWeather: UILabel?
    @IBOutlet weak var lblUserName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        AirRequest().getAirData(self)
        lblWeather?.text = "날씨"
        lblUserName.text = name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func didSuccess2(_ response: AirRseponse) {
        // let Name = response.list[0].unitName
        weather = response.list[0].weatherContents.rawValue

        lblWeather?.text? = weather!
        
        if weather == "구름조금" {
            weatherImage.image = UIImage(named: "suncloud.png")
        }
        if weather == "구름많음" {
            weatherImage.image = UIImage(named: "cloudy.png")
        }
        if weather == "맑음" {
            weatherImage.image = UIImage(named: "sunny.png")
        }
    }
    
}
