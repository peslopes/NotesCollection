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
    
    var notes: [PostIt]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postItCollection.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollectionViewDelegate(delegate: UICollectionViewDelegate) {
        postItCollection.delegate = delegate
        postItCollection.reloadData()
    }

}

extension PostItCollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = postItCollection.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? PostItCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.bodyLabel.text = notes[indexPath.row].body
        cell.titleLabel.text = notes[indexPath.row].title
        cell.noteView.backgroundColor = UIColor(named: notes[indexPath.row].noteType.bodyColor)
        cell.titleView.backgroundColor = UIColor(named: notes[indexPath.row].noteType.titleColor)
        cell.bodyView.backgroundColor = UIColor(named: notes[indexPath.row].noteType.bodyColor)
        
        cell.titleView.roundTop()
        cell.bodyView.roundBottom()
        cell.noteView.backgroundColor = .white
        cell.noteView.addNoteTypeShaddow()
        
        return cell
    }
    
    
}
