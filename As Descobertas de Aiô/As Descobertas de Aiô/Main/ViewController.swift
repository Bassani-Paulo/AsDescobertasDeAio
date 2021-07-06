//
//  ViewController.swift
//  As Descobertas de Aiô
//
//  Created by Paulo Bassani on 29/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func backToMain(_ segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AudioManager.shared.playMusic()
        // Do any additional setup after loading the view.
    }
    

}

