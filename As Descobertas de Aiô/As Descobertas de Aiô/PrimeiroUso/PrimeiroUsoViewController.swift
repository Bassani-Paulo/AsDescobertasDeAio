//
//  PrimeiroUsoViewController.swift
//  As Descobertas de Aiô
//
//  Created by Francisca Rosa on 02/07/21.
//

import UIKit

class PrimeiroUsoViewController: UIViewController {
	
	@IBOutlet weak var falaAio: UIImageView!
	@IBOutlet weak var falaMaia: UIImageView!
	@IBOutlet weak var apresentacaoLabel: UILabel!
	let falas = Falas()
	var paginaInicio = 0
	
	@IBOutlet weak var balaoView: UIView!
	
	@IBAction func avancar(_ sender: Any) {
		if paginaInicio <= falas.falasPrimeiroUso.count && paginaInicio >= 0{
		paginaInicio = paginaInicio + 1
		} else
		{
			print(falas.falasPrimeiroUso[paginaInicio], "erro")
		}
		
		switch paginaInicio {
		case 5:
			performSegue(withIdentifier: "paraMain", sender: nil)
		default:
			apresentacaoLabel.text = falas.falasPrimeiroUso[paginaInicio]
		}

		
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
			
			balaoView.layer.cornerRadius = 13
		
		
	}
	
	
		
		

}
