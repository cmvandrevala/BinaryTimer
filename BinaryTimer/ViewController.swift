//
//  ViewController.swift
//  BinaryTimer
//
//  Created by Cyrus Vandrevala on 7/20/15.
//  Copyright (c) 2015 Cyrus Vandrevala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelForBinaryCount: UILabel!
    @IBOutlet weak var labelForRegularCount: UILabel!
    
    var timer = NSTimer()
    var binaryCount = 0b00000
    var normalCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(sender: UIButton) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countUp", userInfo: nil, repeats: true)
    }
    
    @IBAction func reset(sender: UIButton) {
        timer.invalidate()
        binaryCount = 0b0000
        updateText()
    }
    
    func countUp() {
        binaryCount += 0b00001
        normalCount += 1
        if (binaryCount == 0b100000) { binaryCount = 0b00000 }
        if (normalCount == 32) { normalCount = 0 }
        updateText()
    }
    
    func updateText() {
        var text = String(binaryCount, radix:2)
        for i in 0..<5 - count(text) {
            text = "0" + text;
        }
        labelForBinaryCount.text = text
        labelForRegularCount.text = String(normalCount)
    }

}