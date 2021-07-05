//
//  PrimeiroUsoViewController.swift
//  As Descobertas de Aiô
//
//  Created by Francisca Rosa on 02/07/21.
//

import UIKit

class PrimeiroUsoViewController: UIViewController {
	
	@IBOutlet weak var balaoView: UIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		balaoView.layer.cornerRadius = 13
		let falas = Falas()
		
		print (falas.falasPrimeiroUso[1]!)

		
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
