//
//  Datos.swift
//  appChuckNorris
//
//  Created by jimbo on 17/12/24.
//

import Foundation
struct JokeResponse: Codable {
    let value: String
}

struct JokeCategoryResponse: Codable {
    let categories: [String]
}
