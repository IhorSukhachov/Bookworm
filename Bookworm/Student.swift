//
//  Student.swift
//  Bookworm
//
//  Created by Ihor Sukhachov on 06.12.2025.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
