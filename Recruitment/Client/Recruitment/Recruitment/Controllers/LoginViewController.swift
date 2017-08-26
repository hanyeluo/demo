//
//  LoginViewController.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding
import MBProgressHUD
class LoginViewController: UIViewController {

    //UI
    lazy var hud: MBProgressHUD = {
        let _hud = MBProgressHUD(view: self.view)
        return _hud
    }()
    lazy var logoLabel: UILabel = {
        let _logoLabel = UILabel(frame: CGRect(x: 0, y: 90, width: SCREEN_WIDTH, height: 48))
        _logoLabel.textAlignment = .center
        _logoLabel.text = "招聘软件"
        _logoLabel.font = UIFont.systemFont(ofSize: 46)
        return _logoLabel
    }()
    
    lazy var descLabel: UILabel = {
        let _descLabel = UILabel(frame: CGRect(x: 0, y: self.logoLabel.frame.maxY + 20, width: SCREEN_WIDTH, height: 18))
        _descLabel.textAlignment = .center
        _descLabel.text = "请输入账号密码进行登陆"
        _descLabel.font = UIFont.systemFont(ofSize: 16)
        return _descLabel
    }()
    
    lazy var formView: TPKeyboardAvoidingScrollView = {
        let _formView = TPKeyboardAvoidingScrollView(frame: CGRect(x: 30, y: self.descLabel.frame.maxY + 100, width: SCREEN_WIDTH - 60, height: 300 ))
        return _formView
    }()
    
    lazy var emailInput: UITextField = {
        let _emailInput = UITextField(frame: CGRect(x: 0, y: 0, width: self.formView.frame.size.width, height: 44))
        _emailInput.placeholder = "请输入账号"
        _emailInput.text = "luo@163.com"
        _emailInput.layer.borderColor = UIColor.gray.cgColor
        _emailInput.layer.borderWidth = 0.5
        _emailInput.layer.cornerRadius = 4
        _emailInput.font = UIFont.systemFont(ofSize: T1)
        return _emailInput
    }()
    
    lazy var passwordInput: UITextField = {
        let _passwordInput = UITextField(frame: CGRect(x: 0, y: self.emailInput.frame.maxY + 20, width: self.formView.frame.size.width, height: 44))
        _passwordInput.placeholder = "请输入密码"
        _passwordInput.text = "password"
        _passwordInput.isSecureTextEntry = true
        _passwordInput.layer.borderColor = UIColor.gray.cgColor
        _passwordInput.layer.borderWidth = 0.5
        _passwordInput.layer.cornerRadius = 4
        _passwordInput.font = UIFont.systemFont(ofSize: T1)
        return _passwordInput
    }()
    
    lazy var loginButton: UIButton = {
        let _loginButton = UIButton(frame: CGRect(x:0, y: self.passwordInput.frame.maxY + 40, width: self.formView.frame.size.width, height: 44))
        _loginButton.backgroundColor = .blue
        _loginButton.layer.masksToBounds = true
        _loginButton.layer.cornerRadius = 4
        _loginButton.titleLabel?.font = UIFont.systemFont(ofSize: T1)
        _loginButton.setTitle("登录", for: .normal)
        _loginButton.addTarget(self, action: #selector(LoginViewController.postLogin), for: .touchUpInside)
        return _loginButton
    }()
    
    lazy var registButton: UIButton = {
        let _registButton = UIButton(frame: CGRect(x:0, y: self.loginButton.frame.maxY + 20, width: self.formView.frame.size.width, height: 44))
        _registButton.backgroundColor = .green
        _registButton.layer.masksToBounds = true
        _registButton.layer.cornerRadius = 4
        _registButton.titleLabel?.font = UIFont.systemFont(ofSize: T1)
        _registButton.setTitle("注册", for: .normal)
        _registButton.addTarget(self, action: #selector(LoginViewController.pushToRegistVC), for: .touchUpInside)
        return _registButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(logoLabel)
        view.addSubview(descLabel)
        view.addSubview(formView)
        formView.addSubview(emailInput)
        formView.addSubview(passwordInput)
        formView.addSubview(loginButton)
        formView.addSubview(registButton)
        view.addSubview(hud)
        
    }

    //network
    func postLogin()  {
        let username = emailInput.text
        let password = passwordInput.text
        AuthenticateService.login(username!, password: password!) { (error) -> (Void) in
            logInfo(error)
            if error != nil {
                self.hud.mode = .text
                self.hud.label.text = "登录失败"
                self.hud.show(animated: true)
                self.hud.hide(animated: true, afterDelay: 2)
            }else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    //action
    func pushToRegistVC()  {
        let registVC = RegistViewController()
        navigationController?.pushViewController(registVC, animated: true)
    }
}
