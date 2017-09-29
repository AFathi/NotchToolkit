//
//  ViewController.swift
//  NotchToolkit-Example
//
//  Created by Ahmed Bekhit on 9/25/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit
import NotchToolkit

//Step 1. add `NotchToolbarDelegate`
//Step 2. implement delegate functions, check NotchToolkit Delegates

class ViewController: UIViewController, NotchToolbarDelegate {

    //Step 3. initialize `NotchToolbar`
    let toolbar = NotchToolbar()
    
    var iconListTest:[String]{
        return ["Pika-Pikachu CHAAAAA", "AYYEE AYYEE CAPTAIN!","Just thinking, brb.", "Oh nerdy, my fav emoji.", "An iPhone compiling apps wirelessly.", "hacker", "hacker", "checklist", "sooooo liitttt"]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Step 4. setup `NotchToolbar` options
        
        //Set to true to make the toolbar visible initially--default is false.
        toolbar.notch.isVisible = false
        
        //Set the height of the NotchBar--default is 250.
        toolbar.notch.height = 250
        
        //`toolList` array accepts Strings and UIImage types
        toolbar.iconWithNameFont = UIFont(name: "Avenir-Medium", size: 10.0)!
        toolbar.toolList = [[UIImage(named:"pikachusquare")!, "Pikachu"], [UIImage(named:"spongebob")!, "Spongebob"], "🤔", "🤓", "📱", "👩‍💻", "👨‍💻", "✅", "🔥"]

        toolbar.delegate = self
        toolbar.initializeToolbar(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAction(_ sender: UIButton) {
        if toolbar.notch.isVisible {
            sender.setTitle("Show Notch Toolbar", for: .normal)
        }else{
            sender.setTitle("Hide Notch Toolbar", for: .normal)
        }
        toolbar.showOrHide()
    }
    
    // MARK: - NotchToolkit Delegates
    func deviceDidRotate() {
        //Step 5. call `autoResize` in the `deviceDidRotate` function
        toolbar.autoResize()
    }
    
    // This delegate function allows you to detect which toolbar icon was selected.
    func didTapToolIcon(_ tools: UICollectionView, toolIndex: IndexPath, section: Int, row: Int) {
        print("this icon #\(row) in section #\(section)")
        let alert = UIAlertController(title: "NotchToolkit Alert", message: iconListTest[row], preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "k", style: UIAlertActionStyle.cancel, handler: {
            (UIAlertAction)in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

