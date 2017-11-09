//
//  NotchImageViewController.swift
//  NotchToolkit-Example
//
//  Created by Ahmed Bekhit on 11/8/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit
import NotchToolkit

// MARK: - Implement NotchToolkit

//Step 1. add `NotchToolbarDelegate`
//Step 2. implement delegate functions, check NotchToolkit Delegates

class NotchImageViewController: UIViewController {
    //Step 3. initialize `NotchImageView`
    var imageView: NotchImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = NotchImageView(image: UIImage(named:"tst_img.JPG"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - NotchToolkit Delegate Methods
extension NotchImageViewController: NotchToolbarDelegate {
    func deviceDidRotate() {
        //Step 5. call `autoResize` in the `deviceDidRotate` function
        imageView?.autoResize()
    }
    
    // This delegate function allows you to detect which toolbar icon was selected.
    func didTapToolIcon(_ tools: UICollectionView, toolIndex: IndexPath, section: Int, row: Int) {
    }
}

// MARK: - ViewController Buttons IBAction
extension NotchImageViewController {
    @IBAction func loadNotchImage(_ sender: UIButton) {
        if !(imageView?.isVisible)! {
            sender.setTitle("Delete Image Object", for: .normal)
            imageView?.durationIntervals = 2.8
            imageView?.printBarColor = .red
            imageView?.printBarHeight = 5
            imageView?.delegate = self
            imageView?.prepare(in: self)
            imageView?.load()
            self.view.insertSubview(sender, aboveSubview: imageView!)
        }else{
            sender.setTitle("Load Image from Notch", for: .normal)
            imageView?.remove()
            imageView = NotchImageView(image: UIImage(named:"tst_img.JPG"))
        }
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
