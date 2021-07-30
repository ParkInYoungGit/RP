//
//  resultViewController.swift
//  TableView
//
//  Created by YOUNG on 2021/07/28.
//

import UIKit

class resultViewController: UIViewController {

    
    var resultweight: Double = 0
    var resultheight: Double = 0
    var bmi: Double = 0.0
    var normalWeight : Double = 0
    @IBOutlet weak var bmiImages: UIImageView!
    
    @IBOutlet weak var textResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attrString = NSMutableAttributedString(string: textResult.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        textResult.attributedText = attrString
        
        bmiCalc()
        // Do any additional setup after loading the view.
    }
    
    func bmiCalc(){
        bmi = resultweight / (resultheight/100*resultheight/100)
        normalWeight = 23 * (resultheight/100 * resultheight/100)
        
        if bmi >= 35 {
            textResult.text = "bmi 지수는 \(String(format: "%.2f", bmi)) 입니다.\n당신은 초고도 비만입니다 ! 체중조절이 시급합니다 !\n\(resultweight-normalWeight)kg를 감량하면 정상체중이 될 수 있습니다."
            bmiImages.image = UIImage(named: "bmi5.png")
        }
        else if bmi >= 25 {
            textResult.text = "bmi 지수는 \(String(format: "%.2f", bmi)) 입니다.\n당신은 비만입니다 ! \n\(String(format: "%.2f",(resultweight-normalWeight)))kg를 감량하면 정상체중이 될 수 있습니다."
            bmiImages.image = UIImage(named: "bmi4.png")
        }
        else if bmi >= 23 {
            textResult.text = "bmi 지수는 \(String(format: "%.2f", bmi)) 입니다.\n당신은 과체중입니다 !\n\(String(format: "%.2f",(resultweight-normalWeight)))kg를 감량하면 정상체중이 될 수 있습니다."
            bmiImages.image = UIImage(named: "bmi3.png")
        }
        else if bmi >= 18.5 {
            textResult.text = "bmi 지수는 \(String(format: "%.2f", bmi)) 입니다. \n당신은 정상입니다 ! \n현재체중을 유지하세요"
            bmiImages.image = UIImage(named: "bmi2.png")
        }
        else {
            textResult.text = "bmi 지수는 \(String(format: "%.2f", bmi)) 입니다. \n당신은 저체중입니다 !\n\(String(format: "%.2f",(normalWeight-resultweight)))kg를 증량하면 정상체중이 될 수 있습니다."
            bmiImages.image = UIImage(named: "bmi1.png")
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
