//
//  AjustesViewController.swift
//  As Descobertas de Aiô
//
//  Created by Francisca Rosa on 29/06/21.
//

import UIKit

class ContaViewController: UIViewController {

    @IBOutlet weak var dividendLabel: UILabel!
    @IBOutlet weak var divisorLabel: UILabel!
    @IBOutlet weak var answerField: UITextField!
    
    
    var dividend:Int = 0, divisor:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dividend = Int.random(in: 11...99)
        divisor = Int.random(in: 2...9)
        
        while dividend%divisor != 0 {
            dividend = Int.random(in: 11...99)
        }
        
        dividendLabel.text = String(dividend)
        divisorLabel.text = String(divisor)
//        answerField.placeholder = String(dividend/divisor)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if answerField.text == String(dividend/divisor) {
            performSegue(withIdentifier: "ContaParaAjustes", sender: sender)
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
