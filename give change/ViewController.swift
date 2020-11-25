//
//  ViewController.swift
//  give change
//
//  Created by 維衣 on 2020/9/29.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var moneyTxt: UITextField!
    @IBOutlet weak var priceLab: UILabel!
    @IBOutlet weak var answerLab: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet var numsLab: [UILabel]!
    @IBOutlet weak var sumLab: UILabel!
    @IBOutlet weak var circleGraph: UIImageView!

    var moneyArray = [1000, 500, 200, 100, 50, 10, 5, 1]
    var giveChange: Int = 0
    var giveChangeFloat: CGFloat = 0
    var quotient: Int = 0
    var remainder: Int = 0
    var arraySum: CGFloat = 0
    let aDegree = CGFloat.pi / 180
    let lineWidth: CGFloat = 25
    let radius: CGFloat = 100
    let startDegree: CGFloat = 270
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyTxt.keyboardType = .numberPad
        addTapGesture()
    }
    
    func addTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func pieTask(startDegree: CGFloat, percentage: CGFloat, color:UIColor) -> CAShapeLayer{
//        let percentagePath = UIBezierPath(arcCenter: CGPoint(x: lineWidth + radius, y: lineWidth + radius), radius: radius, startAngle: aDegree * startDegree, endAngle: aDegree * (startDegree + 360 * percentage ), clockwise: true)
        
        let percentagePath = UIBezierPath(arcCenter: CGPoint(x: 314 / 2, y: 232 / 2), radius: radius, startAngle: aDegree * startDegree, endAngle: aDegree * (startDegree + 360 * percentage ), clockwise: true)
                
        let percentageLayer = CAShapeLayer()
        percentageLayer.path = percentagePath.cgPath
        percentageLayer.strokeColor = color.cgColor
        percentageLayer.lineWidth = lineWidth
        percentageLayer.fillColor = UIColor.clear.cgColor
        return percentageLayer
    }
    
    @objc private func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func outputBtn(_ sender: UIButton) {

        let money = Int(moneyTxt.text!) ?? 0
        let price = Int.random(in: 0...money)

        priceLab.text = String(price)
        giveChange = money - price
        answerLab.text! = String("\(money - price)")
        quotient = 0
        arraySum = 0
        
        for i in 0...moneyArray.count-1{
        
            let cash = giveChange.quotientAndRemainder(dividingBy: Int(moneyArray[i]))
            
            remainder = cash.remainder
            numsLab[i].text! = String(cash.quotient)
            
            quotient = quotient + cash.quotient
            giveChange = remainder
            sumLab.text! = String(quotient)
            
            arraySum += CGFloat(cash.quotient)
            
        }
            
        let start0: CGFloat = 270
        let start1: CGFloat = (start0 + 360 * CGFloat(Double(numsLab[0].text!) ?? 0) / arraySum )
        let start2: CGFloat = (start1 + 360 * CGFloat(Double(numsLab[1].text!) ?? 0) / arraySum )
        let start3: CGFloat = (start2 + 360 * CGFloat(Double(numsLab[2].text!) ?? 0) / arraySum )
        let start4: CGFloat = (start3 + 360 * CGFloat(Double(numsLab[3].text!) ?? 0) / arraySum )
        let start5: CGFloat = (start4 + 360 * CGFloat(Double(numsLab[4].text!) ?? 0) / arraySum )
        let start6: CGFloat = (start5 + 360 * CGFloat(Double(numsLab[5].text!) ?? 0) / arraySum )
        let start7: CGFloat = (start6 + 360 * CGFloat(Double(numsLab[6].text!) ?? 0) / arraySum )
            
            let color0: UIColor = #colorLiteral(red: 1, green: 0.5665194392, blue: 0, alpha: 1)
            let color1: UIColor = #colorLiteral(red: 1, green: 0, blue: 0.2098701596, alpha: 1)
            let color2: UIColor = #colorLiteral(red: 1, green: 0.6886668801, blue: 0.8422866464, alpha: 1)
            let color3: UIColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            let color4: UIColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            let color5: UIColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            let color6: UIColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            let color7: UIColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            
            let percentLayer0 = pieTask(startDegree: start0, percentage: CGFloat(Double(numsLab[0].text!) ?? 0) / arraySum, color: color0)
            let percentLayer1 = pieTask(startDegree: start1, percentage: CGFloat(Double(numsLab[1].text!) ?? 0) / arraySum, color: color1)
            let percentLayer2 = pieTask(startDegree: start2, percentage: CGFloat(Double(numsLab[2].text!) ?? 0) / arraySum, color: color2)
            let percentLayer3 = pieTask(startDegree: start3, percentage: CGFloat(Double(numsLab[3].text!) ?? 0) / arraySum, color: color3)
            let percentLayer4 = pieTask(startDegree: start4, percentage: CGFloat(Double(numsLab[4].text!) ?? 0) / arraySum, color: color4)
            let percentLayer5 = pieTask(startDegree: start5, percentage: CGFloat(Double(numsLab[5].text!) ?? 0) / arraySum, color: color5)
            let percentLayer6 = pieTask(startDegree: start6, percentage: CGFloat(Double(numsLab[6].text!) ?? 0) / arraySum, color: color6)
            let percentLayer7 = pieTask(startDegree: start7, percentage: CGFloat(Double(numsLab[7].text!) ?? 0) / arraySum, color: color7)

        let circlePath = UIBezierPath(ovalIn: CGRect(x: 58, y: 18, width: radius * 2, height: radius * 2))
            //此處XY為手調

            let circleLayer = CAShapeLayer()
            circleLayer.path =  circlePath.cgPath
            circleLayer.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            circleLayer.lineWidth = lineWidth
            circleLayer.fillColor = UIColor.clear.cgColor

            circleGraph.layer.addSublayer(circleLayer)
            circleGraph.layer.addSublayer(percentLayer0)
            circleGraph.layer.addSublayer(percentLayer1)
            circleGraph.layer.addSublayer(percentLayer2)
            circleGraph.layer.addSublayer(percentLayer3)
            circleGraph.layer.addSublayer(percentLayer4)
            circleGraph.layer.addSublayer(percentLayer5)
            circleGraph.layer.addSublayer(percentLayer6)
            circleGraph.layer.addSublayer(percentLayer7)
        }
    }


