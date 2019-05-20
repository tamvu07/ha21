//
//  Cell_MH_HoSoUngTuyen_TableViewCell.swift
//  ha2
//
//  Created by vuminhtam on 5/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class Cell_MH_HoSoUngTuyen_TableViewCell: UITableViewCell {

    @IBOutlet weak var avatar_1: UIImageView!
    @IBOutlet weak var lb_hoten: UILabel!
    @IBOutlet weak var lb_vitrituyen: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
