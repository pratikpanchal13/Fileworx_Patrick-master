//
//  FWMessageListCell.swift
//  Fileworx_Patrick
//
//  Created by indianic on 24/02/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class FWMessageListCell: UITableViewCell {

    @IBOutlet weak var lblMessageTitle: UILabel!
    
    @IBOutlet weak var lblMessageSenderName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
