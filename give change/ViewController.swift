//
//  ViewController.swift
//  give change
//
//  Created by 維衣 on 2020/9/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moneyTxt: UITextField!
    @IBOutlet weak var priceLab: UILabel!
    @IBOutlet weak var answerLab: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet var numsLab: [UILabel]!
    @IBOutlet weak var countLab: UILabel!
    
    var money: Int = 0
    var price: Int = 0
    var count: Int = 0
    var answer: Int = 0
    var i: Int = 0
    var ntArray = [1000, 500, 200, 100, 50, 10, 5, 1]
    var cash: Int = 0
    var giveChange: Int = 0
    var quotient: Int = 0
    var remainder: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    @IBAction func outputBtn(_ sender: UIButton) {
  
        let money = Int(moneyTxt.text!) ?? 0
        let price = Int.random(in: 0...money)
        
        priceLab.text = String(price)
        giveChange = money - price
        answerLab.text! = String("\(money - price)")
        
        for i in 0...ntArray.count-1{
            
            let cash = giveChange.quotientAndRemainder(dividingBy: Int(ntArray[i]))
            
            remainder = cash.remainder
            numsLab[i].text! = String(cash.quotient)
            
            quotient = quotient + cash.quotient
            giveChange = remainder
            countLab.text! = String(quotient)
            
        }
    }
}

