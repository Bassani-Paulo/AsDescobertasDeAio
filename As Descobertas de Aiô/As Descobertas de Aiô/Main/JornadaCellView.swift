//
//  JornadaCellView.swift
//  As Descobertas de Aiô
//
//  Created by Manoela Ferreira on 05/07/21.
//

import UIKit

class JornadaCellView: UICollectionViewCell{
    
    @IBOutlet weak var imgFundo: UIImageView!
    @IBOutlet weak var efeitoBlur: UIVisualEffectView!
    @IBOutlet weak var btnJogar: UIButton!
    @IBOutlet weak var lblBloqueio: UILabel!
    @IBOutlet weak var imgBloqueio: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
