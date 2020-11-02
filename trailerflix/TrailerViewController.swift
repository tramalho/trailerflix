//
//  TrailerViewController.swift
//  trailerflix
//
//  Created by Thiago Antonio Ramalho on 01/11/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import UIKit

class TrailerViewController: UIViewController {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var trailer: UIView!
    var trailerModel:Trailer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(trailerModel?.title ?? "error")
    }
    

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
