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
    @IBOutlet weak var textoView: UIView!
    @IBOutlet weak var lblTexto: UILabel!
    @IBOutlet weak var aioView: UIImageView!
    @IBOutlet weak var indicadorBalao: UIImageView!
    @IBOutlet weak var acabouView: UIView!
    
    //variaveis que guardam posições necessárias para arrastar
    private var posicaoViewIni: CGPoint = .zero
    private var posicaoToqueIni: CGPoint = .zero
    
    //texto de feedback para o usuario
    let textos = ["Muito bem!", "Que legal!", "Demais!", "Vamos conseguir limpar tudo rapidinho!", "Incrível!", "Acho que não é isso!", "Vamos tentar pensar no material que este objeto é feito!", "Vamos tentar de novo?", "Esta não parece ser a lixeira certa!", "Que tal tentar jogar em outra lixeira?"]
    
    var qtdObjetos = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotacionarViews()
    }
    
    private func rotacionarViews(){
        indicadorBalao.transform = CGAffineTransform(rotationAngle: CGFloat(-60))
    }
    
    @IBAction func sair(_ gesture: UITapGestureRecognizer){
        
    }
    
    @IBAction func arrastarView(_ gesture: UIPanGestureRecognizer){
        if let viewTocada = gesture.view{
            if(gesture.state == .began){
                //guarda a posição inicial do toque na view e a posição inicial da view na tela
                posicaoViewIni = viewTocada.frame.origin
                posicaoToqueIni = gesture.location(in: viewTocada)
                
                textoView.isHidden = true
                aioView.image = UIImage(named: "aioNormal")
            } else if (gesture.state == .changed){ //movimento acontecendo
                let posicaoAtual = gesture.location(in: viewTocada)
                viewTocada.frame.origin = CGPoint(x: viewTocada.frame.origin.x + posicaoAtual.x - posicaoToqueIni.x, y: viewTocada.frame.origin.y + posicaoAtual.y - posicaoToqueIni.y)

            } else if (gesture.state == .ended){
                //verifica se a view está no lixo certo
                if(viewTocada.frame.intersects(getLixoCorreto(viewTocada.tag).frame)){
                    viewTocada.removeFromSuperview()
                    mostrarFeedback(certo: true)
                    qtdObjetos -= 1
                    if(qtdObjetos == 0){
                        fimJogo()
                    }
                } else{
                    viewTocada.frame.origin = posicaoViewIni
                    mostrarFeedback(certo: false)
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
    
    private func mostrarFeedback(certo:Bool){
        textoView.isHidden = false
        if(certo){
            let index = Int.random(in: 0...4)
            lblTexto.text = textos[index]
            
            //a partir do numero random escolhido uma das imagens positivas do aio é mostrada
            var nomeImagem = "aioFeliz"
            if(index % 2 == 0){
                nomeImagem = "aioSurpreso"
            }
            aioView.image = UIImage(named: nomeImagem)
        }else{
            aioView.image = UIImage(named: "aioTriste")
            lblTexto.text = textos[Int.random(in: 5...9)]
        }
    }
    
    private func fimJogo(){
        textoView.isHidden = true
        acabouView.isHidden = false
        aioView.image = UIImage(named: "aioFeliz")
        aioView.frame.origin = CGPoint(x: 550, y: 190)
    }
    
}
