//
//  ViewController.swift
//  As Descobertas de Aiô
//
//  Created by Paulo Bassani on 29/06/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var jornadasCollectionView: UICollectionView!
    @IBOutlet weak var conquistas: UIView!
    @IBOutlet weak var explorar: UIView!
    @IBOutlet weak var ajustes: UIView!
    
    var jornadasData:Jornadas!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jornadasCollectionView.dataSource = self
        
        jornadasData = Jornadas()
        
        adicionarGestureRecognizer()
    }
    
    func adicionarGestureRecognizer(){
        conquistas.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gerenciaToque(_:))))
        explorar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gerenciaToque(_:))))
        ajustes.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gerenciaToque(_:))))
    }
    
    @objc func gerenciaToque(_ gestureRecognizer: UIGestureRecognizer){
        if let viewTocada = gestureRecognizer.view{
            let segueIdentifier:String
            switch viewTocada {
            case conquistas:
                segueIdentifier = "conquistas"
            case explorar:
                segueIdentifier = "explorar"
            default:
                segueIdentifier = "ajustes"
            }
            
            performSegue(withIdentifier: segueIdentifier, sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let qtd = jornadasData.getJornadas()?.jornadas.count{
            return qtd
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "jornadaCell", for: indexPath) as! JornadaCellView
        
        if let jornadaAtual = jornadasData.getJornada(i: indexPath.row){
        
            cell.imgFundo.image = UIImage(named: jornadaAtual.imagemFundo)
        
            if(jornadaAtual.bloqueado){
                cell.efeitoBlur.effect = UIBlurEffect.init(style: UIBlurEffect.Style.systemUltraThinMaterialLight)
                cell.efeitoBlur.frame.origin = CGPoint(x: 0, y: 0)
                cell.efeitoBlur.frame.size = cell.frame.size
                cell.btnJogar.isHidden = true
            } else {
                cell.imgBloqueio.isHidden = true
                cell.lblBloqueio.isHidden = true
            }
        }
        
        return cell
    }
    

}

