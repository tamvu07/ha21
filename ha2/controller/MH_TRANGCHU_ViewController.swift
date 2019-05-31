//
//  MH_TRANGCHU_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/29/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
var vistor:CongTy!
var User_flag:Int!
var User_name:String!
var currentUser_1:User_1!
var currentUser_2:User!
import Firebase
var Search_1_flag:Int!
var tttk:Int!
var tttq:Int!
// tao lien ket voi database
var ref = Database.database().reference()
let storage = Storage.storage()
let storageRef = storage.reference(forURL: "gs://authileha2.appspot.com")
var nguoidung:Int!

class MH_TRANGCHU_ViewController: UIViewController {
    
    let f = chucnang()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tttk = 0
        tttq = 0
        
        if(User_flag != 1)
        {
            f.dangxuat()
        }
    }
    
    @IBAction func bt_item_chuyen_chucnang(_ sender: Any) {
        self.chuyen_MH_chucnang()
    }
    
    
    func chuyen_MH_chucnang() {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_chucnang")
        navigationController?.pushViewController(scr!, animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
