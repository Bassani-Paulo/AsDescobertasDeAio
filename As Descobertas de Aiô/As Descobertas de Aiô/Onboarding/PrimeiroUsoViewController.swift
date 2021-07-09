//
//  PrimeiroUsoViewController.swift
//  As Descobertas de Aiô
//
//  Created by Francisca Rosa on 08/07/21.
//

import UIKit

class PrimeiroUsoViewController: UIViewController {

	@IBOutlet weak var maiaImageView: UIImageView!
	//
	@IBOutlet weak var aioImageView: UIImageView!
	
	@IBOutlet weak var falaView: UIView!
	
	@IBOutlet weak var falaLabel: UILabel!
	//
	@IBOutlet weak var balaoMaia: UIImageView!
	
	@IBOutlet weak var balaoAio: UIImageView!
	
	//HIDDEN É O OPOSTO DE SHOW, AFF
	var pagina = 0
	let oQueApareceNoLabel = FalasOnboarding()
	@IBAction func botaoSeguinte(_ sender: Any) {
		pagina += 1
		
		if pagina > oQueApareceNoLabel.falas.count - 1 {
					performSegue(withIdentifier: "paraMain", sender: nil)
		} else {
			aioImageView.isHidden = false
			falaLabel.text = oQueApareceNoLabel.falas[pagina]
			balaoAio.isHidden = oQueApareceNoLabel.quemTaFalando[pagina].aio
			balaoMaia.isHidden = oQueApareceNoLabel.quemTaFalando[pagina].maia

		}
	}
	override func viewDidLoad() {
        super.viewDidLoad()

		falaView.layer.cornerRadius = 13
		aioImageView.isHidden = true
		balaoAio.isHidden = true
        // Do any additional setup after loading the view.
    }
}
