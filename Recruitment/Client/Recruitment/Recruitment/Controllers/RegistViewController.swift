//
//  RegistViewController.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding
import MBProgressHUD
class RegistViewController: UIViewController {
    //UI
    lazy var hud: MBProgressHUD = {
        let _hud = MBProgressHUD(view: self.view)
        return _hud
    }()
    let service = UserService()
    lazy var logoLabel: UILabel = {
        let _logoLabel = UILabel(frame: CGRect(x: 0, y: 90, width: SCREEN_WIDTH, height: 48))
        _logoLabel.textAlignment = .center
        _logoLabel.text = "注册"
        _logoLabel.font = UIFont.systemFont(ofSize: 46)
        return _logoLabel
    }()
    
    lazy var descLabel: UILabel = {
        let _descLabel = UILabel(frame: CGRect(x: 0, y: self.logoLabel.frame.maxY + 20, width: SCREEN_WIDTH, height: 18))
        _descLabel.textAlignment = .center
        _descLabel.text = "请输入信息进行用户注册"
        _descLabel.font = UIFont.systemFont(ofSize: 16)
        return _descLabel
    }()
    
    lazy var formView: TPKeyboardAvoidingScrollView = {
        let _formView = TPKeyboardAvoidingScrollView(frame: CGRect(x: 30, y: self.descLabel.frame.maxY + 100, width: SCREEN_WIDTH - 60, height: 300 ))
        return _formView
    }()
    
    lazy var emailInput: UITextField = {
        let _emailInput = UITextField(frame: CGRect(x: 0, y: 0, width: self.formView.frame.size.width, height: 44))
        _emailInput.placeholder = "请输入邮箱"
        _emailInput.layer.borderColor = UIColor.gray.cgColor
        _emailInput.layer.borderWidth = 0.5
        _emailInput.layer.cornerRadius = 4
        _emailInput.font = UIFont.systemFont(ofSize: T1)
        return _emailInput
    }()
    
    lazy var passwordInput: UITextField = {
        let _passwordInput = UITextField(frame: CGRect(x: 0, y: self.emailInput.frame.maxY + 20, width: self.formView.frame.size.width, height: 44))
        _passwordInput.placeholder = "请输入密码"
        _passwordInput.isSecureTextEntry = true
        _passwordInput.layer.borderColor = UIColor.gray.cgColor
        _passwordInput.layer.borderWidth = 0.5
        _passwordInput.layer.cornerRadius = 4
        _passwordInput.font = UIFont.systemFont(ofSize: T1)
        return _passwordInput
    }()
    
    lazy var registButton: UIButton = {
        let _registButton = UIButton(frame: CGRect(x:0, y: self.passwordInput.frame.maxY + 40, width: self.formView.frame.size.width, height: 44))
        _registButton.backgroundColor = .green
        _registButton.layer.masksToBounds = true
        _registButton.layer.cornerRadius = 4
        _registButton.titleLabel?.font = UIFont.systemFont(ofSize: T1)
        _registButton.setTitle("注册", for: .normal)
        _registButton.addTarget(self, action: #selector(RegistViewController.postRegist), for: .touchUpInside)
        return _registButton
    }()
    
    lazy var backButton: UIButton = {
        let _backButton = UIButton(frame: CGRect(x:0, y: self.registButton.frame.maxY + 20, width: self.formView.frame.size.width, height: 44))
        _backButton.backgroundColor = .grayDark
        _backButton.layer.masksToBounds = true
        _backButton.layer.cornerRadius = 4
        _backButton.titleLabel?.font = UIFont.systemFont(ofSize: T1)
        _backButton.setTitle("返回", for: .normal)
        _backButton.addTarget(self, action: #selector(RegistViewController.popToLoginVC), for: .touchUpInside)
        return _backButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(logoLabel)
        view.addSubview(descLabel)
        view.addSubview(formView)
        formView.addSubview(emailInput)
        formView.addSubview(passwordInput)
        formView.addSubview(registButton)
        formView.addSubview(backButton)
        
        view.addSubview(hud)
        
        
    }

    //network
    func postRegist()  {
        guard let email = emailInput.text else {
            HudHelper.show(hud: self.hud, text: "邮箱不能为空")
            return
        }
        guard let password = passwordInput.text else {
            HudHelper.show(hud: self.hud, text: "密码不能为空")
            return
        }
        
        service.regist(email: email,password: password) { (error) -> (Void) in
            if error != nil {
                self.hud.mode = .text
                self.hud.label.text = error?.description
                self.hud.show(animated: true)
                self.hud.hide(animated: true, afterDelay: 2)
            }else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    func popToLoginVC()  {
        _ = navigationController?.popViewController(animated: true)
    }

}
