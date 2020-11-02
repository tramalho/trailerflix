//
//  ViewController.swift
//  trailerflix
//
//  Created by Thiago Antonio Ramalho on 01/11/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var trailers:[Trailer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTrailers()
    }

    private func loadTrailers() {
        guard let url = Bundle.main.url(forResource: "trailers", withExtension: "json") else {return}
        
        do {
            
            let trailerData = try Data(contentsOf: url)
            trailers = try JSONDecoder().decode([Trailer].self, from: trailerData)
            
        } catch {
            print(error.localizedDescription)
        }
    }

    @IBAction func watchRandomTrailer(_ sender: UIButton) {
        let randomIndex = Int(arc4random_uniform(UInt32(trailers.count)))
        showTrailers(index: randomIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TrailerViewController, let trailer = sender as? Trailer {
            vc.trailerModel = trailer
        }
    }
    
    private func showTrailers(index:Int) {
        let trailer = trailers[index]
        performSegue(withIdentifier: "trailerSegue", sender: trailer)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let trailer = trailers[indexPath.row]
        
        cell.textLabel?.text = trailer.title
        cell.detailTextLabel?.text = "\(trailer.year)"
        cell.imageView?.image = UIImage(named: "\(trailer.poster)")
        
        return cell
    }
    
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showTrailers(index: indexPath.row)
    }
}

