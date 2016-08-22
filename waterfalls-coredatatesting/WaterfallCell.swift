//
//  WaterfallCell.swift
//  waterfalls-coredatatesting
//
//  Created by JuanPa Villa on 7/19/16.
//  Copyright © 2016 JuanPa Villa. All rights reserved.
//

import UIKit

class WaterfallCell: UITableViewCell {
    
    
    @IBOutlet weak var waterfallImg: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    func configureCell(waterfall: Waterfalls) {
        waterfallImg.image = waterfall.getWaterfallImg()
        title.text = waterfall.title
    }
    
    


}
