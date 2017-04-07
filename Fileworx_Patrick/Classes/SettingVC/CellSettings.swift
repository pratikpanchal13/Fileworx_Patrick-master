//
//  CellSettings.swift
//  Fileworx_Patrick
//
//  Created by indianic on 07/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class CellSettings: UITableViewCell {

    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnTitle: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
