//
//  Recompensa.swift
//  As Descobertas de Aiô
//
//  Created by Manoela Ferreira on 08/07/21.
//

import UIKit

class Recompensa:UIViewController{
    
    @IBOutlet weak var balaoView: UIView!
    @IBOutlet weak var maiaView: UIImageView!
    @IBOutlet weak var aioView: UIImageView!
    @IBOutlet weak var recompensaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        animarComponentes()
    }
    
    private func animarComponentes(){
        //animação Maia
        UIView.animate(withDuration: 3.0, delay: 0.6, options: .curveEaseOut, animations: {
          var frameMaia = self.maiaView.frame
          frameMaia.origin.x = 136
          self.maiaView.frame = frameMaia
        }, completion: { finished in self.balaoView.isHidden = false })
    }
    
    @IBAction func mostrarFigurinha(){
        if(!balaoView.isHidden){
            balaoView.isHidden = true
            recompensaView.isHidden = false
        }else{
            performSegue(withIdentifier: "irMapa", sender: self)
        }
    }
    
    @IBAction func sair(){
        performSegue(withIdentifier: "irMapa", sender: self)
    }
}
