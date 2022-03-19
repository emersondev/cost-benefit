//
//  ViewController.swift
//  cost-benefit
//
//  Created by Emerson.Novais on 19/03/22.
//

import UIKit

extension Collection {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var gasPriceField: UITextField!
    @IBOutlet weak var alcoholPriceField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func calculateCostBenefit(_ sender: Any) {
        let gasField = gasPriceField.text
        let alcoholField = alcoholPriceField.text
        var condition: Bool
        
        condition = validateValues(gasPrice: gasField, alcoholPrice: alcoholField)
        
        if condition {
            resultLabel.text = calculated(gasPrice: gasField!, alcoholPrice: alcoholField!)
        } else {
            resultLabel.text = "Digite os preços para ser feito o cálculo"
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func calculated(gasPrice: String, alcoholPrice: String) -> String {
        let gas = Double(gasPrice)!
        let alcohol = Double(alcoholPrice)!
        let costBenefitValue = 0.7
        let media = alcohol / gas
        var result: String
        
        if (media >= costBenefitValue) {
            result = "Melhor utilizar Gasolina!"
        } else {
            result = "Melhor utilizar Álcool"
        }
        
        return result
    }
    
    func validateValues(gasPrice: String?, alcoholPrice: String?) -> Bool {
        var condition: Bool
        var gasCodition = false
        var alcoholCondition = false
        
        if gasPrice!.isNotEmpty {
            gasCodition = true
        }
        if alcoholPrice!.isNotEmpty {
            alcoholCondition = true
        }
        
        if gasCodition && alcoholCondition {
            condition = true
        } else {
            condition = false
        }
        
        return condition
    }

}

