//
//  PostItCollectionTableViewCell.swift
//  NotesCollection
//
//  Created by Pedro Enrique Sobrosa Lopes on 06/06/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit
import CoreData

class PostItCollectionTableViewCell: UITableViewCell {
    @IBOutlet weak var postItCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
