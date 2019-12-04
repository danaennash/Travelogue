//
//  TripTableViewCell.swift
//  Travelogue
//
//  Created by Danae N Nash on 12/4/19.
//  Copyright © 2018 Danae N Nash. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var tripLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
