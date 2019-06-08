//
//  ViewController.swift
//  NotesCollection
//
//  Created by Pedro Enrique Sobrosa Lopes on 06/06/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "YellowDark")
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    @IBAction func createNote(_ sender: Any) {
//      por alguma razão isso n tá funcionando :(
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    
}

