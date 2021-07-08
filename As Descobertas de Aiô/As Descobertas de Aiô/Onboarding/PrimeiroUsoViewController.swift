//
//  PrimeiroUsoViewController.swift
//  As Descobertas de Aiô
//
//  Created by Francisca Rosa on 08/07/21.
//

import UIKit

class PrimeiroUsoViewController: UIViewController {

	@IBOutlet weak var falasView: UIView!
	@IBOutlet weak var aioImagem: UIImageView!
	
	@IBOutlet weak var balaoAio: UIImageView!
		
	@IBOutlet weak var maiaImagem: UIImageView!
	
	@IBOutlet weak var balaoMaia: UIImageView!
	
	@IBOutlet weak var falasLabel: UILabel!
		
//	@IBAction func proximoBotao(_ sender: Any) {
//		pagina = pagina + 1
//		quefalaExibir()
//
//	}
	
	var pagina = 0
	let falando = FalasOnboarding()
	
	func quefalaExibir() {
		
		falasLabel.text = falando.falas[pagina]
		balaoAio.isHidden = falando.quemTaFalando[pagina].aio
		balaoMaia.isHidden = falando.quemTaFalando[pagina].maia
		
		if pagina > falando.falas.count - 1 {
			performSegue(withIdentifier: "paraMain", sender: nil)
		}
	}
	override func viewDidLoad() {
        super.viewDidLoad()
		
		falasView.layer.cornerRadius = 13
		aioImagem.isHidden = false
		balaoAio.isHidden = false
        // Do any additional setup after loading the view.
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
