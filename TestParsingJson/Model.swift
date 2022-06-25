//
//  Model.swift
//  TestParsingJson
//
//  Created by Алексей Гуляев on 25.06.2022.
//

import Foundation
import UIKit

struct Lesson: Decodable {
    let id: Int
    let name: String
    let date: String
    let image: String
    let link: String
}
