//
//  AddHomeViewController.swift
//  HomeKitDemo
//
//  Created by ZhangWei-SpaceHome on 2017/3/8.
//  Copyright © 2017年 zhangwei. All rights reserved.
//

import UIKit
import HomeKit

let WIDTH = UIScreen.main.bounds.size.width
let HEIGHT = UIScreen.main.bounds.size.height

class AddHomeViewController: UIViewController {

    let inputTextField = UITextField.init(frame: CGRect.init(x: 30, y: 100, width: WIDTH - 60, height: 40))
    
    var  homeManager: HMHomeManager!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        inputTextField.becomeFirstResponder()
    }
    
    func displayAlertWithTitle(title: String, message: String) {
        let controller = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        present(controller, animated: true, completion: nil)
    }
    
    func addHome() {
        
        if inputTextField.text?.endIndex == inputTextField.text?.startIndex{
            displayAlertWithTitle(title: "Home name", message: "Please enter the home name")
            return
        }
        
        homeManager.addHome(withName: inputTextField.text!) { [weak self](home, error) in
            let strongSelf = self!
            
            if error != nil{
                strongSelf.displayAlertWithTitle(title: "Error happened", message: "\(error)")
            }else{
                strongSelf.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension UIAlertController {
    class func showAlertControllerOnHostController(
        hostViewController:UIViewController,
        title:String,
        message:String,
        buttonTitle:String) {
        let controller = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        controller.addAction(UIAlertAction.init(title: buttonTitle, style: .default, handler: nil))
        hostViewController.present(controller, animated: true, completion: nil)
    }
}
