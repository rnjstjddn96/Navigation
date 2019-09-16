//
//  EditViewController.swift
//  Navigation
//
//  Created by 권성우 on 16/09/2019.
//  Copyright © 2019 권성우. All rights reserved.
//

import UIKit

//프로토콜 : 특정 객체가 갖추어야 할 기능이나 속성에 대한 설계도. 실질적으로 아무런 내용이 없지만 단순한 선언 형태를 갖추고 있다. 실질적인 내용은 프로토콜을 이용하는 객체에서 정의.
protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, message : String)
    func didImageOnOffDone(_ controller : EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {
    var textWayValue : String = ""
    var textMessage : String = ""
    var isOn = false
    var delegate : EditDelegate?
    
    @IBOutlet var swlsOn: UISwitch!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var lblWay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swlsOn.isOn = isOn
        // Do any additional setup after loading the view.
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
        }
        else{
            isOn = false
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessageEditDone(self, message: txMessage.text!)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
