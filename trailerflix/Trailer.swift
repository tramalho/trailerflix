//
//  Trailer.swift
//  trailerflix
//
//  Created by Thiago Antonio Ramalho on 01/11/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import Foundation

struct Trailer: Codable {
    let title: String
    let url: String
    let rating:Int
    let year:Int
    let poster: String
}
