//
//  ViewController.swift
//  Demo
//
//  Created by iMac on 2019/6/20.
//  Copyright © 2019 iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let fullScreenSize = UIScreen.main.bounds.size
    var imageArray = [#imageLiteral(resourceName: "dimond"),#imageLiteral(resourceName: "crown"),#imageLiteral(resourceName: "bar"),#imageLiteral(resourceName: "seven"),#imageLiteral(resourceName: "cherry"),#imageLiteral(resourceName: "lemon")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(sender: AnyObject) {
        
    }
    
    // pickerView setting
    
    // rowNum
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    // colNum
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // width
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return imageArray[component].size.width + 35
    }
    
    // height
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return imageArray[component].size.height + 5
    }
    
    // content
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        for i in 0...3 {
            pickerView.selectRow(50, inComponent: i, animated: true)
        }
        return UIImageView(image: imageArray.randomElement())
    }
    
    
}

