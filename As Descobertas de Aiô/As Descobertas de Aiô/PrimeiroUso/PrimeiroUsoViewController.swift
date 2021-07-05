//
//  PrimeiroUsoViewController.swift
//  As Descobertas de Aiô
//
//  Created by Francisca Rosa on 02/07/21.
//

import UIKit

class PrimeiroUsoViewController: UIViewController {
	
	@IBOutlet weak var apresentacaoLabel: UILabel!
	let falas = Falas()
	var paginaInicio = 0
	
	@IBOutlet weak var balaoView: UIView!
	
	@IBAction func avancar(_ sender: Any) {
		paginaInicio = paginaInicio + 1
		
		switch paginaInicio {
		case 5:
			performSegue(withIdentifier: "paraMain", sender: nil)
		default:
			apresentacaoLabel.text = falas.falasPrimeiroUso[paginaInicio]
		}
//				if paginaInicio > 4 {
////					performSegue(withIdentifier: "paraMain", sender: nil)
//					apresentacaoLabel.text = falas.falasPrimeiroUso[paginaInicio]
//				}
				
		
	}
	//	@IBAction func avancar(_ sender: Any) {
//		paginaInicio = paginaInicio + 1
//
//		if paginaInicio >= falas.falasPrimeiroUso.count {
//			performSegue(withIdentifier: "paraMain", sender: nil)
//		}
//		apresentacaoLabel.text = falas.falasPrimeiroUso[paginaInicio]
//	}
	override func viewDidLoad() {
        super.viewDidLoad()
			
			balaoView.layer.cornerRadius = 13
		
		
	}
	
	
		
		

}
