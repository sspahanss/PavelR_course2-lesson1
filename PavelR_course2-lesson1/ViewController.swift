//
//  ViewController.swift
//  PavelR_course2-lesson1
//
//  Created by Павел on 17.08.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var loginText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardShow), name: NSNotification.Name(rawValue: UIResponder.keyboardAnimationCurveUserInfoKey), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc
    private func keyBoardShow(notification: Notification) {
        guard
            let keyBoardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
            else { return }
        
        scrollView.contentSize.height = keyBoardFrame.height
        print("keyboard show")
    }
    
    @IBAction func buttonTapped (_ sender: Any) {
        
        let login = loginText.text
        let password = passwordText.text
        
        if login == "admin" && password == "root" {
            print("вход успешен")
        } else {
            print("не верно")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

