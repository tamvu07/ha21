//
//  MH_Search_01_01_01_DaCoHoSo_Chitietcongty_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MH_Search_01_01_01_DaCoHoSo_Chitietcongty_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //radio button
    @objc @IBAction private func logSelectedButton(_ radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected ha .\n", button.titleLabel!.text!));
            }
        } else {
            RadioButtonValue = radioButton.selected()?.titleLabel?.text!
            //            print(String(format: "%@ is selected.\n", RadioButtonValue));
            let x:String = String(format: "%@", RadioButtonValue);
            if(x == "Ứng viên")
            {
                q = x
                nguoidung = 0
            }else
                if(x == "Công ty")
                {
                    q = x
                    nguoidung = 1
            }
        }
    }



}
