//
//  CELL_Search_01_01_01TableViewCell.swift
//  ha2
//
//  Created by vuminhtam on 5/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CELL_Search_01_01_01TableViewCell: UITableViewCell {

    @IBOutlet weak var hinh_CT: UIImageView!
    @IBOutlet weak var txt_ten: UILabel!
    @IBOutlet weak var txt_dc: UILabel!
    @IBOutlet weak var txt_cv: UILabel!
    @IBOutlet weak var txt_L: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        hinh_CT.layer.cornerRadius = hinh_CT.bounds.width/2
        hinh_CT.layer.borderColor = UIColor.blue.cgColor
        hinh_CT.layer.borderWidth = 2
        hinh_CT.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
