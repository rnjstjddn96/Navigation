//
//  ViewController.swift
//  Navigation
//
//  Created by 권성우 on 16/09/2019.
//  Copyright © 2019 권성우. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named : "lamp_on.png")
    let imgOff = UIImage(named : "lamp_off.png")
    var isOn = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = imgOn
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use Bar button"
        }
        
        editViewController.delegate = self
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
    }//prepare 함수: 해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 직전에 호출되는 함수이며 데이터 전달을 위해 사용
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        }
        else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
}

