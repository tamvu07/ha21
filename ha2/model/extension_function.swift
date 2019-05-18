//
//  extention_function.swift
//  ha2
//
//  Created by vuminhtam on 4/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class chucnang{
    
    // dang xuat tai khoan hien tai
    func dangxuat()  {
        let firebaseAuth = Auth.auth()
        do {
            try
                firebaseAuth.signOut()
                User_flag = 0
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }

    
//    func get_HS_status_user1() -> Int
//    {
//        var HS = 0
//        var tablename = ref.child("Nguoidung").child("Ungvien")
//        // Listen for new comments in the Firebase database
//        tablename.observe(.childAdded, with: { (snapshot) in
//            // nếu lấy được dữ liệu postDict từ sever về và id của user có trong postDict
//            print("...1: la \(currenUser.id)......2 la :\(snapshot.key)...")
//            if let postDict = snapshot.value as? [String : AnyObject], currenUser.id == snapshot.key
//            {
//                let User_current = (postDict["Thongtincanhan"]) as! NSMutableDictionary
//                let email:String = (User_current["Email"])! as? String ?? "000@gmail.com"
//                let linkAvatar:String = (User_current["LinkAvatar"])! as? String ?? "000"
//                let hoso:String = (User_current["Hoso"])! as? String ?? "0"
//                HS = Int(hoso)!
//                print("co lay dc ho so ma 1... la :\(HS)\n")
//            }else if let postDict = snapshot.value as? [String : AnyObject], currenUser.id != snapshot.key{
//                print("kho g lay dc ho so")
//            }
//            
//        })
//          return HS
//    }
  
    func set_status_HS_User1() {
        currentUser_1 = User_1(id: currentUser_1.id, email: currentUser_1.email, linkAvatar: currentUser_1.linkAvatar, status_HS: 1)
        let tableUser = ref.child("Nguoidung").child("Ungvien").child(currentUser_1.id).child("Thongtincanhan")
        
        let t1:Dictionary<String,String> = [
            "Email": currentUser_1.email,
            "LinkAvatar":currentUser_1.linkAvatar,
            "Hoso": String(currentUser_1!.status_HS)
        ]
        
        tableUser.setValue(t1)
    }
    
    
}

