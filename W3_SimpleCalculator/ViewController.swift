//
//  ViewController.swift
//  W3_SimpleCalculator
//
//  Created by MacBook Pro on 02/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CalculationLabel: UILabel!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet var ButtonCalculator: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for button in ButtonCalculator{
                  button.layer.cornerRadius = button.frame.size.height/2;
              }
    }
    var number: String = ""
    
     func clear(){
         number = ""
         CalculationLabel.text = ""
         ResultLabel.text = ""
     }
     func addNomor(value:String){
        
         number = number + value
         CalculationLabel.text = number
     }
    @IBAction func ClearAll(_ sender: Any) {
        clear()
    }
    @IBAction func Back(_ sender: Any) {
        if(!number.isEmpty){
               number.removeLast()
               CalculationLabel.text = number
           }
    }
    
    @IBAction func percent(_ sender: Any) {
        addNomor(value: " *0.01 ")
    }
    
    @IBAction func divide(_ sender: Any) {
        addNomor(value: " / ")
    }
    @IBAction func multiply(_ sender: Any) {
        addNomor(value: " * ")
    }
    @IBAction func plus(_ sender: Any) {
        addNomor(value: " + ")
    }
    @IBAction func minus(_ sender: Any) {
        addNomor(value: " - ")
    }
    
    @IBAction func nine(_ sender: Any) {
        addNomor(value: "9")
    }
    @IBAction func eight(_ sender: Any) {
        addNomor(value: "8")
    }
    @IBAction func seven(_ sender: Any) {
        addNomor(value: "7")
    }
    @IBAction func six(_ sender: Any) {
        addNomor(value: "6")
    }
    @IBAction func five(_ sender: Any) {
        addNomor(value: "5")
    }
    
    @IBAction func four(_ sender: Any) {
        addNomor(value: "4")
    }
    @IBAction func three(_ sender: Any) {
        addNomor(value: "3")
    }
    @IBAction func two(_ sender: Any) {
        addNomor(value: "2")
    }
    @IBAction func one(_ sender: Any) {
        addNomor(value: "1")
    }
    @IBAction func zero(_ sender: Any) {
        addNomor(value: "0")
    }
    @IBAction func decimal(_ sender: Any) {
        addNomor(value: ".")
    }
    @IBOutlet weak var equals: NSLayoutConstraint!
    func validInput() ->Bool{
        
        var hitung = 0
        var index = [Int]()
        var before: Int = -1
        for symbol in number
        {
            if specialCharacter(symbol: symbol)
            {
                index.append(hitung)
            }
            hitung  += 1
        }
        
        for index in index{
            if(index == 0)
            {
                return false
            }
            if(index == number.count - 1)
            {
                return false
            }
            if(before != -1){
                if(index - before == 1)
                {
                    return false
                }
                before = index
            }
        }
        return true
    }
    func specialCharacter (symbol:Character) -> Bool
    {
        if(symbol == "/"){
            return true
        }
        if(symbol == "*"){
            return true
        }
        if(symbol == "+"){
            return true
        }
        if(symbol == "-"){
            return true
        }
        return false
    }

    @IBAction func equals(_ sender: Any) {
      
     
 
        var nomorArr = number.components(separatedBy: " ")

    for (index, nomor) in nomorArr.enumerated() {
        
        if (nomor != "/" && nomor != "*" && nomor != "+" && nomor != "-" && nomor != "*0.01" && nomor != "=" && nomor != "") && !nomor.contains(".")
        {
            nomorArr[index] += ".0"
        }
    }
//    print(nomorArr)
            var percent = number.replacingOccurrences(of: "%", with: " *0.01 ")
            percent = nomorArr.joined(separator: " ")
   
            let symbol = NSExpression(format: percent)
            
            let result = symbol.expressionValue(with: nil, context: nil) as! Double
            var resultString = String(result)
        let numArray = resultString.components(separatedBy: ".")
        if numArray[1] == "0" {
            ResultLabel.text = numArray[0]
        }
        else{
            ResultLabel.text = resultString
        }
    
    }
   
}

