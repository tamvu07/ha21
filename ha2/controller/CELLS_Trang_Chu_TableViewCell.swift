//
//  CELLS_Trang_Chu_TableViewCell.swift
//  ha2
//
//  Created by vuminhtam on 4/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CELLS_Trang_Chu_TableViewCell: UITableViewCell {

    
    @IBOutlet weak var Avatar: UIImageView!
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var lb2: UILabel!
    @IBOutlet weak var lb3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
