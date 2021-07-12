//
//  ExplorarViewController.swift
//  As Descobertas de Aiô
//
//  Created by Francisca Rosa on 29/06/21.
//

import youtube_ios_player_helper
import UIKit

struct CustomData {
    var title: String
    var videoID: String
}

class ExplorarViewController: UIViewController {
    
    let data = [
        CustomData(title: "COMO FAZER PAPEL RECICLADO em casa ",
                   videoID: "fjt5gWCx120"),
        CustomData(title: "Como reciclar tubo de pasta de dente em casa ",
                   videoID: "vAnuoulkzdI"),
        CustomData(title: "Como fazer um pulmão artificial caseiro ",
                   videoID: "DNbF6bnCoio"),
    ]

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 50
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AudioManager.shared.pauseMusic()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Fundo.png")!)
        
        view.addSubview(collectionView)
        view.addSubview(exploreLabel)
        view.addSubview(closeExploreButton)
        view.addSubview(lineView)
        
        collectionView.backgroundColor = UIColor(white: 1, alpha: 0)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 97).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        exploreLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        exploreLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        exploreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 26).isActive = true
        exploreLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -335).isActive = true
        exploreLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 63).isActive = true
        
        closeExploreButton.widthAnchor.constraint(equalToConstant: 23).isActive = true
        closeExploreButton.heightAnchor.constraint(equalToConstant: 23).isActive = true
        closeExploreButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 26).isActive = true
        closeExploreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -335).isActive = true
        closeExploreButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        
        lineView.widthAnchor.constraint(equalToConstant: 700).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 63).isActive = true
        lineView.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 63).isActive = true
        lineView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -63).isActive = true

    }
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var exploreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Explorar"
        label.font = UIFont(name: "SF Pro Rounded", size: CGFloat(30))
        return label
    }()
    
    lazy var closeExploreButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .secondaryLabel
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.backAction(_:)), for: .touchUpInside)

        return button
    }()
    
    @IBAction func backAction(_ sender: UIButton!) {
        let _ = self.dismiss(animated: true, completion: nil)
        AudioManager.shared.playMusic()
    }

}

extension ExplorarViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.width/3.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        return cell
    }
    
}

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            yt.load(withVideoId: data.videoID,
                    playerVars: ["playsinline":1])
        }
    }
    
    fileprivate let yt: YTPlayerView = {
        let youtubeVideoView = YTPlayerView()
        youtubeVideoView.load(withVideoId: "aT6xMMGQLBc")
        youtubeVideoView.translatesAutoresizingMaskIntoConstraints = false
        youtubeVideoView.contentMode = .scaleAspectFill
        youtubeVideoView.clipsToBounds = true
        youtubeVideoView.layer.cornerRadius = 10
        return youtubeVideoView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(yt)
        yt.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        yt.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        yt.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        yt.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

