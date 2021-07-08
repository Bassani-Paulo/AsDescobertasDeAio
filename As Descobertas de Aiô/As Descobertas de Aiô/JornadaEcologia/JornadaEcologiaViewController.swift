//
//  JornadaEcologiaViewController.swift
//  As Descobertas de Aiô
//
//  Created by Francisca Rosa on 29/06/21.
//

import UIKit

class JornadaEcologiaViewController: UIViewController {
    let xAjust:CGFloat = 215
    let yAjust:CGFloat = 275            //não me pergunte o porque desses números, só sei que funciona assim
    let currentColor = #colorLiteral(red: 0.9466858506, green: 0.3942022324, blue: 0.3425135016, alpha: 1)
    let unlockedColor = #colorLiteral(red: 1, green: 0.7467753291, blue: 0.2597047091, alpha: 1)
    let lockedColor = #colorLiteral(red: 0.423489809, green: 0.4235547483, blue: 0.4234755933, alpha: 1)

    @IBOutlet weak var discoFase1: UIButton!
    @IBOutlet weak var discoFase2: UIButton!
    @IBOutlet weak var discoFase3: UIButton!
    @IBOutlet weak var AioPin: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // imagine uma leitura de json aqui
        discoFase1.tintColor = currentColor
        discoFase2.tintColor = unlockedColor
        discoFase3.tintColor = lockedColor
    }
    
    @IBAction func didTapDisco1(_ sender: UIButton) {
        if discoFase1.tintColor == currentColor {
            performSegue(withIdentifier: "goToFase1", sender: sender)
        }
        if discoFase1.tintColor == unlockedColor {
            resetDiscColors()
            discoFase1.tintColor = currentColor
            AioPin.transform = CGAffineTransform(translationX: discoFase1.frame.midX - xAjust , y: discoFase1.frame.midY - yAjust)
        }
    }
    
    @IBAction func didTapDisco2(_ sender: UIButton) {
        if discoFase2.tintColor == currentColor {
            performSegue(withIdentifier: "goToFase2", sender: sender)
        }
        if discoFase2.tintColor == unlockedColor {
            resetDiscColors()
            discoFase2.tintColor = currentColor
            AioPin.transform = CGAffineTransform(translationX: discoFase2.frame.midX - xAjust, y: discoFase2.frame.midY - yAjust)
        }
    }
    
    private func resetDiscColors() {
        if discoFase1.tintColor == currentColor {
            discoFase1.tintColor = unlockedColor
        }
        if discoFase2.tintColor == currentColor {
            discoFase2.tintColor = unlockedColor
        }
        if discoFase3.tintColor == currentColor {
            discoFase3.tintColor = unlockedColor
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
