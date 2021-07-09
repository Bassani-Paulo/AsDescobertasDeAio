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
	
	
	var pagina = 0
	let oQueApareceNoLabel = FalasOnboarding()
	@IBAction func botaoSeguinte(_ sender: Any) {
		pagina += 1
		
		if pagina > oQueApareceNoLabel.falas.count - 1 {
					performSegue(withIdentifier: "paraMain", sender: nil)
		} else {
		falaLabel.text = oQueApareceNoLabel.falas[pagina]
		}
	}
	
	
	

	//func quefalaExibir() {

		
//		balaoAio.isHidden = oQueApareceNoLabel.quemTaFalando[pagina].aio
//		balaoMaia.isHidden = oQueApareceNoLabel.quemTaFalando[pagina].maia

	//}
	override func viewDidLoad() {
        super.viewDidLoad()

//		falasView.layer.cornerRadius = 13
//		aioImagem.isHidden = false
//		balaoAio.isHidden = false
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
