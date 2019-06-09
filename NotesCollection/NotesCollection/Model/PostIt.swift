//
//  PostIt.swift
//  NotesCollection
//
//  Created by Pedro Enrique Sobrosa Lopes on 08/06/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import Foundation
import CoreData

struct PostIt {
    var title: String
    var body: String
    var noteType: NoteType
    var objectID: NSManagedObjectID?
}
