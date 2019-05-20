//
//  Hosoungtuyen.swift
//  ha2
//
//  Created by vuminhtam on 5/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

struct Hosoungtuyen {
    let id:String!
    let nghanh:String!
    let vitrituyen:String!
    
    init()
    {
        id = ""
        nghanh = ""
        vitrituyen = ""
    }
    
    init(id:String,nghanh:String,vitrituyen:String) {
        self.id = id
        self.nghanh = nghanh
        self.vitrituyen = vitrituyen

    }
    
}
