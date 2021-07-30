//
//  chartViewController.swift
//  TableView
//
//  Created by YOUNG on 2021/07/29.
//

import UIKit
import Charts

var recWeight: [Int] = []
var months: [String] = []

class chartViewController: UIViewController {
    @IBOutlet weak var barChartView: BarChartView!

    var recWeight: [Int] = []
    var months: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //recWeight = [54, 56, 55 ,50, 51, 52, 55, 60, 59, 58, 57, 52]
        //months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        barChartView.noDataText = "데이터가 없습니다."
        barChartView.noDataTextColor = .lightGray
        
        
        // Do any additional setup after loading the view.
    
        let defaults = UserDefaults.standard
        let array = defaults.array(forKey: "weight")  as? [Int] ?? [Int]()
        recWeight = array

        let defaults1 = UserDefaults.standard
        let myarray = defaults1.stringArray(forKey: "months") ?? [String]()
        months = myarray

        print("chartView didLoad\(recWeight)")
        setChart(dataPoints: months, values: recWeight)
    
    }
    
    func setChart(dataPoints: [String], values: [Int]) {
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(Int(i)), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "체중")

        // 차트 컬러
        chartDataSet.colors = [.systemBlue]

        // 데이터 삽입
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        // X축 레이블 위치 조정
        barChartView.xAxis.labelPosition = .bottom
        
        // X축 레이블 포맷 지정
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        
        // X축 레이블 갯수 최대로 설정 (이 코드 안쓸 시 Jan Mar May 이런식으로 띄엄띄엄 조금만 나옴)
        barChartView.xAxis.setLabelCount(dataPoints.count, force: false)
        
        // 오른쪽 레이블 제거
        barChartView.rightAxis.enabled = false
        
        // 맥시멈
        barChartView.leftAxis.axisMaximum = 100
        // 미니멈
        barChartView.leftAxis.axisMinimum = 10
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
