//
//  TrailerViewController.swift
//  trailerflix
//
//  Created by Thiago Antonio Ramalho on 01/11/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import UIKit
import AVKit

class TrailerViewController: UIViewController {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var trailer: UIView!
    var trailerModel:Trailer! = nil
    private var player: AVPlayer!
    private var playerViewController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        preparePlayer()
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    private func prepareView() {
        name.text = trailerModel.title
        year.text = String(describing: trailerModel.year)
        var ratingStr = "Não avaliado"
        if trailerModel.rating > 0 {
            ratingStr = ""
            for _ in 1...trailerModel.rating {
                ratingStr += "⭐️"
            }
        }
        
        rating.text = ratingStr
        poster.image = UIImage(named:"\(trailerModel.poster)-large")
    }
    
    private func preparePlayer() {
        let url = URL(fileURLWithPath: trailerModel.url)
        player = AVPlayer(url: url)
        playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.showsPlaybackControls = true
        playerViewController.view.frame = trailer.bounds
        trailer.addSubview(playerViewController.view)
        playerViewController?.player?.play()
    }
}
