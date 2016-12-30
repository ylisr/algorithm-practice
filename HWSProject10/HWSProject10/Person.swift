//
//  Person.swift
//  HWSProject10
//
//  Created by celia  on 30/12/2016.
//  Copyright © 2016 celia . All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
