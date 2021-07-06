//
//  JogoViewController.swift
//  As Descobertas de Aiô
//
//  Created by Manoela Ferreira on 06/07/21.
//

import UIKit

enum Materais:Int {
    case Plastico = 0, Papel, Metal, Vidro
}

class JogoViewController: UIViewController{
    
    @IBOutlet weak var plasticoView: UIImageView!
    @IBOutlet weak var papelView: UIImageView!
    @IBOutlet weak var metalView: UIImageView!
    @IBOutlet weak var vidroView: UIImageView!
    
    //variaveis que guardam posições necessárias para arrastar
    private var posicaoViewIni: CGPoint = .zero
    private var posicaoToqueIni: CGPoint = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func arrastarView(_ gesture: UIPanGestureRecognizer){
        if let viewTocada = gesture.view{
            print(viewTocada)
            if(gesture.state == .began){
                //guarda a posição inicial do toque na view e a posição inicial da view na tela
                posicaoViewIni = viewTocada.frame.origin
                posicaoToqueIni = gesture.location(in: viewTocada)
                
            } else if (gesture.state == .changed){ //movimento acontecendo
                let posicaoAtual = gesture.location(in: viewTocada)
                viewTocada.frame.origin = CGPoint(x: viewTocada.frame.origin.x + posicaoAtual.x - posicaoToqueIni.x, y: viewTocada.frame.origin.y + posicaoAtual.y - posicaoToqueIni.y)

            } else if (gesture.state == .ended){
                //verifica se a view está no lixo certo
                if(viewTocada.frame.intersects(getLixoCorreto(viewTocada.tag).frame)){
                    print("ACERTÔ MIZERAVI")
                    viewTocada.removeFromSuperview()
                } else{
                    viewTocada.frame.origin = posicaoViewIni
                }
            }
        }
    }
    
    private func getLixoCorreto(_ tipo:Int) -> UIImageView{
        let resultado:UIImageView
        switch tipo {
        case 0:
            resultado = plasticoView
        case 1:
            resultado = papelView
        case 2:
            resultado = metalView
        default:
            resultado = vidroView
        }
        return resultado
    }
    
}
