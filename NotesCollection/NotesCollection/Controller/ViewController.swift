//
//  ViewController.swift
//  NotesCollection
//
//  Created by Pedro Enrique Sobrosa Lopes on 06/06/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var categorias: [NoteType] = []
    var items: [NSManagedObject] = []
    var comeFromSecondView = false
    var infosFromSecondView: SecondViewInfos!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "YellowDark")
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if comeFromSecondView{
            comeFromSecondView = false
            editNote(currentPostIt: infosFromSecondView.postIt)
        }
        getCategories()
        tableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PostItData")
        do {
            items = try managedContext.fetch(fetchRequest)
        } catch let err as NSError {
            print(err)
        }
    }
    
    func getCategories() {
        let allCategorias: [NoteType] = [.yellow, .orange, .green, .blue, .pink]
        var someCategories: [NoteType] = []
        items.forEach {
            if $0.value(forKey: "type") != nil {
                if !someCategories.contains(getType(from: $0.value(forKey: "type") as! String)) {
                    someCategories.append(getType(from: $0.value(forKey: "type") as! String))
                }
            }
        }
        categorias = []
        for category in allCategorias {
            if someCategories.contains(category) {
                categorias.append(category)
            }
        }
        print("")
        
    }
    
    func editNote(currentPostIt: PostIt) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "PostItData", in: managedContext)!
        if currentPostIt.objectID != nil {
            managedContext.delete(managedContext.object(with: currentPostIt.objectID!))
        }
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        item.setValue(currentPostIt.title, forKey: "title")
        item.setValue(currentPostIt.body, forKey: "body")
        item.setValue(currentPostIt.noteType.description, forKey: "type")
        do {
            try managedContext.save()
            items.append(item)
        } catch let err as NSError {
            print("oh no")
            print(err)
        }
    }

    @IBAction func createNote(_ sender: Any) {
//      por alguma razão isso n tá funcionando :(
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        performSegue(withIdentifier: "goToSecondScreen", sender: nil)
    }
    
    func getType(from string: String) -> NoteType {
        var noteType: NoteType = .yellow
        NoteType.allCases.forEach{
            if $0.description == string {
                noteType = $0
            }
        }
        return noteType
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondScreen = segue.destination as? SecondViewController {
            if let currentPostIt = sender as? PostIt {
                secondScreen.postIt = PostIt(title: currentPostIt.title, body: currentPostIt.body, noteType: currentPostIt.noteType, objectID: currentPostIt.objectID)
            }
            else {
                secondScreen.postIt = PostIt(title: "Don't forget to set a title!", body: "Your text here! 😍", noteType: .yellow, objectID: nil)
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "collectionView") as? PostItCollectionTableViewCell else {
            return UITableViewCell()
        }
        
        let list = items.filter({
            $0.value(forKey: "type") as? String ?? "" == categorias[indexPath.row].description
        }).map ({
            PostIt(title: $0.value(forKey: "title") as? String ?? "", body: $0.value(forKey: "body") as? String ?? "", noteType: getType(from: $0.value(forKey: "type") as? String ?? ""), objectID: $0.objectID)
        })
        
        cell.notes = list
        cell.setCollectionViewDelegate(delegate: self)
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentTableViewCell = collectionView.superview?.superview as! PostItCollectionTableViewCell
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        performSegue(withIdentifier: "goToSecondScreen", sender: currentTableViewCell.notes[indexPath.row])
    }
}

