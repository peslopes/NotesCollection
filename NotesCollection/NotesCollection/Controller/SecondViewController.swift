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
    
    var type: NoteType!
    var postIt: PostIt!
    var postItIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.beautifyScreen()
        setData(title: postIt.title, body: postIt.body, lightBackground: postIt.noteType.bodyColor, darkBackground: postIt.noteType.titleColor)
        type = postIt.noteType
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
        if let viewController = self.navigationController?.viewControllers[0] as? ViewController {
            viewController.comeFromSecondView = true
            viewController.infosFromSecondView = SecondViewInfos(index: postItIndex, postIt: PostIt(title: titleTextField.text!, body: bodyTextView.text, noteType: type, objectID: postIt.objectID))
        }
        self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "YellowDark")
    }
    
    @IBAction func yellowButton(_ sender: Any) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        changeType(lightColor: "YellowLight", darkColor: "YellowDark")
        type = .yellow
    }
    @IBAction func orangeButton(_ sender: Any) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        UIView.animate(withDuration: 0.2, animations: {
            self.changeType(lightColor: "OrangeLight", darkColor: "OrangeDark")
        })
        type = .orange
    }
    @IBAction func greenButton(_ sender: Any) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        UIView.animate(withDuration: 0.2, animations: {
            self.changeType(lightColor: "GreenLight", darkColor: "GreenDark")
        })
        type = .green
    }
    @IBAction func blueButton(_ sender: Any) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        UIView.animate(withDuration: 0.2, animations: {
            self.changeType(lightColor: "BlueLight", darkColor: "BlueDark")
        })
        type = .blue
    }
    @IBAction func pinkButton(_ sender: Any) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        UIView.animate(withDuration: 0.2, animations: {
            self.changeType(lightColor: "PinkLight", darkColor: "PinkDark")
        })
        type = .pink
    }
    func changeType (lightColor: String, darkColor: String) {
            self.titleView.backgroundColor = UIColor(named: darkColor)
            self.view.backgroundColor = UIColor(named: lightColor)
            self.navigationController?.navigationBar.barTintColor = UIColor(named: darkColor)
    }
    
}



