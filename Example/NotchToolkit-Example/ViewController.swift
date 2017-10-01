//
//  ViewController.swift
//  NotchToolkit-Example
//
//  Created by Ahmed Bekhit on 9/25/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit
import NotchToolkit

// MARK: Tool Icons Arrays
extension ViewController {
    /**
     This is a custom array used to show more info when an icon is tapped
     */
    var iconListInfo:[String] {
        return ["Pika-Pikachu CHAAAAA", "AYYEE AYYEE CAPTAIN!","Just thinking, brb.", "Oh nerdy, my fav emoji.", "An iPhone compiling apps wirelessly.", "hacker", "hacker", "checklist", "sooooo liitttt"]
    }
    
    /**
     This array contains all the tool icons info.
     **NOTE**: an array of [UIImage, String] is displayed as one icon with the string content as a title.
     */
    var toolListIcons:[Any] {
        return [
            [UIImage(named:"pikachusquare")!, "Pikachu"],
            [UIImage(named:"spongebob")!, "Spongebob"],
            "🤔", "🤓",
            "📱", "👩‍💻",
            "👨‍💻", "✅",
            "🔥"]
    }
}

//Step 1. add `NotchToolbarDelegate`
//Step 2. implement delegate functions, check NotchToolkit Delegates

class ViewController: UIViewController {
    
    //Step 3. initialize `NotchToolbar`
    let toolbar = NotchToolbar()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Step 4. setup `NotchToolbar` options
        
        //Set to true to make the toolbar visible initially--default is false.
        toolbar.notch.isVisible = false
        
        //Set the height of the NotchBar--default is 250.
        toolbar.notch.height = 250
        
        //`toolList` array accepts Strings, UIImage or an array of both types
        toolbar.iconWithNameFont = UIFont(name: "Avenir-Medium", size: 10.0)!
        toolbar.toolList = toolListIcons
        
        toolbar.delegate = self
        toolbar.initializeToolbar(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - NotchToolkit Delegates
extension ViewController: NotchToolbarDelegate {
    func deviceDidRotate() {
        //Step 5. call `autoResize` in the `deviceDidRotate` function
        toolbar.autoResize()
    }
    
    // This delegate function allows you to detect which toolbar icon was selected.
    func didTapToolIcon(_ tools: UICollectionView, toolIndex: IndexPath, section: Int, row: Int) {
        print("this icon #\(row) in section #\(section)")
        let alert = UIAlertController(title: "NotchToolkit Alert", message: iconListInfo[row], preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "k", style: UIAlertActionStyle.cancel, handler: {
            (UIAlertAction)in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - ViewController Buttons IBAction
extension ViewController {
    @IBAction func showAction(_ sender: UIButton) {
        if toolbar.notch.isVisible {
            sender.setTitle("Show Notch Toolbar", for: .normal)
        }else{
            sender.setTitle("Hide Notch Toolbar", for: .normal)
        }
        toolbar.showOrHide()
    }
}
