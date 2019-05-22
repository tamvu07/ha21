//
//  Thongtin_Hosoungtuyen.swift
//  ha2
//
//  Created by vuminhtam on 5/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class Thongtin_Hosoungtuyen: Codable {
    var id:String!
    var nghanh:String!
    var vitrituyen:String!
    
    
    init(id: String, nghanh: String, vitrituyen:String) {
        self.id = id
        self.nghanh = nghanh
        self.vitrituyen = vitrituyen
    }
    
}
