//
//  ConquistasViewController.swift
//  As Descobertas de Aiô
//
//  Created by Francisca Rosa on 29/06/21.
//

import UIKit

class ConquistasViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let todasConquistas = Conquistas().todasConquistas
    var conquistas = Conquistas().todasConquistas["Geral"]!

    let conquistasCollectionViewCellId = "ConquistasCollectionViewCell"
    
    @IBOutlet weak var botaoGeral: UIButton!
    @IBOutlet weak var botaoReciclagem: UIButton!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var botaoSelecionado: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: conquistasCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: conquistasCollectionViewCellId)
        
        collectionView.reloadData()
        
        botaoSelecionado = botaoGeral
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func didTapExit(_ sender: UIButton) {
        performSegue(withIdentifier: "BackToMain", sender: sender)
      }
    
    func trocarCorBotao(botao: UIButton, selecionado: Bool) {
        let fundoBotaoSelecionado = "FundoBotaoRoxo"
        let corBotaoSelecionado = UIColor.white
        let fundoBotaoNaoSelecionado = "FundoBotaoBranco"
        let corBotaoNaoSelecionado = UIColor.black
        
        if(selecionado) {
            botao.setBackgroundImage(UIImage(named: fundoBotaoSelecionado), for: UIControl.State.normal)
            botao.setTitleColor(corBotaoSelecionado, for: UIControl.State.normal)
        } else {
            botao.setBackgroundImage(UIImage(named: fundoBotaoNaoSelecionado), for: UIControl.State.normal)
            botao.setTitleColor(corBotaoNaoSelecionado, for: UIControl.State.normal)
        }
    }
    
    @IBAction func escolherTipoDeConquista(_ sender: UIButton) {
        let tipo = sender.currentTitle
        
        trocarCorBotao(botao: botaoSelecionado, selecionado: false)
        trocarCorBotao(botao: sender, selecionado: true)
        botaoSelecionado = sender
        
        titulo.text = tipo!
        conquistas = todasConquistas[tipo!]!
        collectionView.reloadData()
    }
    
    // FUNCOES DE CONTROLE DA COLLECTION VIEW
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conquistas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 420, height: 103)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: conquistasCollectionViewCellId, for: indexPath) as! ConquistasCollectionViewCell
        
        let conquista = conquistas[indexPath.row]
        cell.tituloLabel.text = conquista.titulo
        cell.descricaoLabel.text = conquista.descricao
        cell.figurinhaImage.image = UIImage(named: conquista.imagem)
        cell.checkImage.isHidden = !conquista.concluida
        
        return cell
    }
}

