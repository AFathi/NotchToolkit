//
//  CornerOvalViewController.swift
//  NotchToolkit-Example
//
//  Created by Ahmed Bekhit on 9/26/17.
//  Copyright © 2017 Ahmed Fathi Bekhit. All rights reserved.
//

import UIKit

class CornerOvalViewController: UIViewController {
    @IBOutlet var aView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func drawOval(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
           aView.draw(.oval, position: .right, curve: 1.5)
        }else if sender.selectedSegmentIndex == 1 {
            aView.draw(.oval, position: .left, curve: 1.5)
        }else if sender.selectedSegmentIndex == 2 {
            aView.draw(.oval, position: .top, curve: 1.5)
        }else if sender.selectedSegmentIndex == 3 {
            aView.draw(.oval, position: .bottom, curve: 1.5)
        }else if sender.selectedSegmentIndex == 4 {
            aView.draw(.oval, position: .horizontalSides, curve: 1.5)
        }else if sender.selectedSegmentIndex == 5 {
            aView.draw(.oval, position: .verticalSides, curve: 1.5)
        }else if sender.selectedSegmentIndex == 6 {
            aView.draw(.oval, position: .all, curve: 1.5)
        }
    }
    @IBAction func drawCorner(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            aView.draw(.corner, position: .right, curve: 35)
        }else if sender.selectedSegmentIndex == 1 {
            aView.draw(.corner, position: .left, curve: 35)
        }else if sender.selectedSegmentIndex == 2 {
            aView.draw(.corner, position: .top, curve: 35)
        }else if sender.selectedSegmentIndex == 3 {
            aView.draw(.corner, position: .bottom, curve: 35)
        }else if sender.selectedSegmentIndex == 4 {
            aView.draw(.corner, position: .diagonalAC, curve: 35)
        }else if sender.selectedSegmentIndex == 5 {
            aView.draw(.corner, position: .diagonalBD, curve: 35)
        }else if sender.selectedSegmentIndex == 6 {
            aView.draw(.corner, position: .all, curve: 35)
        }
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        self.dismiss(animated: true, completion:nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
