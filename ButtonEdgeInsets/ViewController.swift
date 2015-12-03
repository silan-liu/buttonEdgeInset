//
//  ViewController.swift
//  ButtonEdgeInsets
//
//  Created by liusilan on 15/12/1.
//  Copyright © 2015年 YY Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func clickButton(sender: AnyObject) {
        let tag = sender.tag - 1
        if let position = ButtonImagePosition(rawValue: tag) {
            self.change(position)
        }
    }

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func change(position: ButtonImagePosition) {

        button.updateButtonImagePostion(position, space: 0)
    }
}

