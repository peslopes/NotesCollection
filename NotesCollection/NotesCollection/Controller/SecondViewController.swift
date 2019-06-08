//
//  SecondViewController.swift
//  NotesCollection
//
//  Created by Luiz Pedro Franciscatto Guerra on 07/06/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var yellowButtonOutlet: UIButton!
    @IBOutlet weak var orangeButtonOutlet: UIButton!
    @IBOutlet weak var greenButtonOutlet: UIButton!
    @IBOutlet weak var blueButtonOutlet: UIButton!
    @IBOutlet weak var pinkButtonOutlet: UIButton!
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.beautifyScreen()
        //      essa linha vai sair quando for feita a função segue, pq ela vai chamar a função setData(title:body:lightBackground:darkBackground), e ela mesma muda o background!
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "YellowDark")
    }
    
    func beautifyScreen () {
        //        creating left cancel button
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: Selector(("cancelAction")))
        self.navItem.setLeftBarButton(backButton, animated: true)
        //        creating right save button
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: Selector(("saveInformation")))
        self.navItem.setRightBarButton(saveButton, animated: true)
        //        making buttons rounded
        self.yellowButtonOutlet.roundCorners()
        self.orangeButtonOutlet.roundCorners()
        self.greenButtonOutlet.roundCorners()
        self.blueButtonOutlet.roundCorners()
        self.pinkButtonOutlet.roundCorners()
//        shadowing buttons
        self.yellowButtonOutlet.addButtonTypeShaddow()
        self.orangeButtonOutlet.addButtonTypeShaddow()
        self.greenButtonOutlet.addButtonTypeShaddow()
        self.blueButtonOutlet.addButtonTypeShaddow()
        self.pinkButtonOutlet.addButtonTypeShaddow()
    }
    
    func setData (title: String, body: String, lightBackground: String, darkBackground: String) {
        self.titleTextField.text = title
        self.bodyTextView.text = body
        self.changeType(lightColor: lightBackground, darkColor: darkBackground)
    }
    
    @objc func cancelAction () {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "YellowDark")
    }
    
    @objc func saveInformation () {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        print("not saving yet")
        self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "YellowDark")
    }
    
    @IBAction func yellowButton(_ sender: Any) {
        changeType(lightColor: "YellowLight", darkColor: "YellowDark")
    }
    @IBAction func orangeButton(_ sender: Any) {
        changeType(lightColor: "OrangeLight", darkColor: "OrangeDark")
    }
    @IBAction func greenButton(_ sender: Any) {
        changeType(lightColor: "GreenLight", darkColor: "GreenDark")
    }
    @IBAction func blueButton(_ sender: Any) {
        changeType(lightColor: "BlueLight", darkColor: "BlueDark")
    }
    @IBAction func pinkButton(_ sender: Any) {
        changeType(lightColor: "PinkLight", darkColor: "PinkDark")
    }
    func changeType (lightColor: String, darkColor: String) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        UIView.animate(withDuration: 0.2, animations: {
            self.titleView.backgroundColor = UIColor(named: darkColor)
            self.view.backgroundColor = UIColor(named: lightColor)
            self.navigationController?.navigationBar.barTintColor = UIColor(named: darkColor)
        })
    }
    
}



