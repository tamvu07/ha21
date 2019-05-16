//
//  CELL2_Taohoso_TableViewCell.swift
//  ha2
//
//  Created by vuminhtam on 5/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CELL2_Taohoso_TableViewCell: UITableViewCell {

    static let CELL2 = "CELL2"
    @IBOutlet weak var bt_lb: UIButton!
    @IBOutlet weak var bt_oulet_Trangchu: UIButton!
    @IBOutlet weak var bt_oulet_Xemtruoc: UIButton!
    
    
//    @IBAction func bt_Action(_ sender: Any) {
//        print("...........co ok !.................\n")
//    }
//    
//    @IBAction func bt_action_Trangchu(_ sender: Any) {
//
//        
//    }
//    
//    @IBAction func bt_action_Xemtruoc(_ sender: Any) {
//
//    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bt_lb.layer.cornerRadius = 5
        bt_lb.layer.borderWidth = 1
        bt_lb.layer.borderColor =  UIColor.black.cgColor
        
        bt_oulet_Xemtruoc.layer.cornerRadius = 5
        bt_oulet_Xemtruoc.layer.borderWidth = 1
        bt_oulet_Xemtruoc.layer.borderColor = UIColor.black.cgColor
        
        bt_oulet_Trangchu.layer.cornerRadius = 5
        bt_oulet_Trangchu.layer.borderWidth = 1
        bt_oulet_Trangchu.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
