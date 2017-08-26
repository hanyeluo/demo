//
//  CreateResumeViewController.swift
//  Recruitment
//
//  Created by luo on 2017/2/11.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit
import MBProgressHUD

class EditResumeViewController: UIViewController {

    let service = ResumeService()
    var sex = 1
    var resume: Resume?
    //UI
    lazy var hud: MBProgressHUD = {
        let _hud = MBProgressHUD(view: self.view)
        return _hud
    }()
    
    lazy var titleInput: UITextField = {
        let _titleInput = UITextField(frame: CGRect(x: 30, y: 84, width: SCREEN_WIDTH-60, height: 44))
        _titleInput.placeholder = "请输入标题"
        _titleInput.layer.borderColor = UIColor.gray.cgColor
        _titleInput.layer.borderWidth = 0.5
        _titleInput.layer.cornerRadius = 4
        _titleInput.font = UIFont.systemFont(ofSize: T1)
        return _titleInput
    }()
    lazy var descInput: UITextField = {
        let _descInput = UITextField(frame: CGRect(x: 30, y: self.titleInput.frame.maxY + 20, width: SCREEN_WIDTH-60, height: 44))
        _descInput.placeholder = "请输入描述"
        _descInput.layer.borderColor = UIColor.gray.cgColor
        _descInput.layer.borderWidth = 0.5
        _descInput.layer.cornerRadius = 4
        _descInput.font = UIFont.systemFont(ofSize: T1)
        return _descInput
    }()
    lazy var nameInput: UITextField = {
        let nameInput = UITextField(frame: CGRect(x: 30, y: self.descInput.frame.maxY + 20, width: SCREEN_WIDTH-60, height: 44))
        nameInput.placeholder = "请输入姓名"
        nameInput.layer.borderColor = UIColor.gray.cgColor
        nameInput.layer.borderWidth = 0.5
        nameInput.layer.cornerRadius = 4
        nameInput.font = UIFont.systemFont(ofSize: T1)
        return nameInput
    }()
    lazy var schoolInput: UITextField = {
        let schoolInput = UITextField(frame: CGRect(x: 30, y: self.nameInput.frame.maxY + 20, width: SCREEN_WIDTH-60, height: 44))
        schoolInput.placeholder = "请输入学校"
        schoolInput.layer.borderColor = UIColor.gray.cgColor
        schoolInput.layer.borderWidth = 0.5
        schoolInput.layer.cornerRadius = 4
        schoolInput.font = UIFont.systemFont(ofSize: T1)
        return schoolInput
    }()
    
    lazy var maleButton: UIButton = {
        let maleButton = UIButton(frame: CGRect(x: 30, y: self.schoolInput.frame.maxY + 20, width: (SCREEN_WIDTH-80)/2, height: 44))
        maleButton.setTitle("男", for: .normal)
        maleButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        maleButton.backgroundColor = UIColor.blue
        maleButton.tag = 1
        maleButton.addTarget(self, action: #selector(EditResumeViewController.sexButtonDidChange(sender:)), for: .touchUpInside)
        return maleButton
    }()
    
    lazy var femaleButton: UIButton = {
        let femaleButton = UIButton(frame: CGRect(x: self.maleButton.frame.maxX+20, y: self.schoolInput.frame.maxY + 20, width: (SCREEN_WIDTH-80)/2, height: 44))
        femaleButton.setTitle("女", for: .normal)
        femaleButton.setTitleColor(UIColor.gray, for: .normal)
        femaleButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        femaleButton.backgroundColor = UIColor.grayDark
        femaleButton.tag = 2
        femaleButton.addTarget(self, action: #selector(EditResumeViewController.sexButtonDidChange(sender:)), for: .touchUpInside)
        return femaleButton
    }()
    
    lazy var detailInput: UITextView = {
        let _detailInput = UITextView(frame: CGRect(x: 30, y: self.maleButton.frame.maxY+20, width: SCREEN_WIDTH-60, height: 174))
        _detailInput.font = UIFont.systemFont(ofSize: T1)
        _detailInput.layer.borderColor = UIColor.gray.cgColor
        _detailInput.layer.borderWidth = 0.5
        _detailInput.layer.cornerRadius = 4
        return _detailInput
    }()
    
    lazy var submitButton: UIButton = {
        let _submitButton = UIButton(frame: CGRect(x: 0, y: SCREEN_HEIGHT-44, width: SCREEN_WIDTH, height: 44))
        _submitButton.setTitle("保存", for: .normal)
        _submitButton.backgroundColor = .green
        _submitButton.titleLabel?.font = UIFont.systemFont(ofSize: T1)
        _submitButton.setTitleColor(.white, for: .normal)
        _submitButton.addTarget(self, action: #selector(EditResumeViewController.saveButtonDidTouch), for: .touchUpInside)
        return _submitButton
    }()
    
    
    init(resume: Resume? = nil) {
        super.init(nibName: nil, bundle: nil)
        title = "简历"
        hidesBottomBarWhenPushed = true
        self.resume = resume
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleInput)
        view.addSubview(descInput)
        view.addSubview(nameInput)
        view.addSubview(schoolInput)
        view.addSubview(maleButton)
        view.addSubview(femaleButton)
        view.addSubview(detailInput)
        view.addSubview(submitButton)
        view.addSubview(hud)
        
        if resume != nil{
            titleInput.text = resume?.title
            descInput.text = resume?.desc
            nameInput.text = resume?.name
            schoolInput.text = resume?.school
            if resume?.sex == 1 {
                maleButton.backgroundColor = UIColor.blue
                femaleButton.backgroundColor = UIColor.grayDark
            }else {
                maleButton.backgroundColor = UIColor.grayDark
                femaleButton.backgroundColor = UIColor.red
            }
            detailInput.text = resume?.detail
        }
        
        
        
    }
    
    func sexButtonDidChange(sender: UIButton)  {
        sex = sender.tag
        if sex == 1 {
            maleButton.backgroundColor = UIColor.blue
            femaleButton.backgroundColor = UIColor.grayDark
        }else {
            maleButton.backgroundColor = UIColor.grayDark
            femaleButton.backgroundColor = UIColor.red
        }
    }
    
    func saveButtonDidTouch()  {
        if resume != nil {
            updateResume()
        }else {
            postResume()
        }
    }
    
    func postResume()  {
        guard let title = titleInput.text else {
            HudHelper.show(hud: self.hud, text: "标题不能为空")
            return
        }
        guard let desc = descInput.text else {
            HudHelper.show(hud: self.hud, text: "描述为空")
            return
        }
        guard let name = nameInput.text else {
            HudHelper.show(hud: self.hud, text: "姓名不能为空")
            return
        }
        guard let school = schoolInput.text else {
            HudHelper.show(hud: self.hud, text: "学校为空")
            return
        }
        guard let detail = detailInput.text else {
            HudHelper.show(hud: self.hud, text: "详细不能为空")
            return
        }
        
        let resumeDic = ["title":title, "desc":desc, "detail": detail, "school":school,"name":name,"sex":"\(sex)"]
        
        NetWorkService.shared.request(.post, url: "\(BASE_URL)/api/resumes", paramters: resumeDic) { (response, error) -> (Void) in
            if error != nil {
                switch error! {
                case .unAuth:
                    RouteHelper.presentLoginVC(viewController: self, completion: nil)
                default:
                    self.hud.mode = .text
                    self.hud.label.text = error?.description
                    self.hud.show(animated: true)
                    self.hud.hide(animated: true, afterDelay: 2)
                    break
                }
                
            }else {
                self.hud.mode = .text
                self.hud.label.text = "创建成功"
                self.hud.show(animated: true)
                self.hud.hide(animated: true, afterDelay: 2)
                
            }

        }
    }

    
    func updateResume()  {
        guard let title = titleInput.text else {
            HudHelper.show(hud: self.hud, text: "标题不能为空")
            return
        }
        guard let desc = descInput.text else {
            HudHelper.show(hud: self.hud, text: "描述为空")
            return
        }
        guard let name = nameInput.text else {
            HudHelper.show(hud: self.hud, text: "姓名不能为空")
            return
        }
        guard let school = schoolInput.text else {
            HudHelper.show(hud: self.hud, text: "学校为空")
            return
        }
        guard let detail = detailInput.text else {
            HudHelper.show(hud: self.hud, text: "详细不能为空")
            return
        }
        
        let resumeDic = ["title":title, "desc":desc, "detail": detail, "school":school,"name":name,"sex":"\(sex)"]
        
        NetWorkService.shared.request(.put, url: "\(BASE_URL)/api/resumes/\(resume!.id)", paramters: resumeDic) { (response, error) -> (Void) in
            if error != nil {
                switch error! {
                case .unAuth:
                    RouteHelper.presentLoginVC(viewController: self, completion: nil)
                default:
                    self.hud.mode = .text
                    self.hud.label.text = error?.description
                    self.hud.show(animated: true)
                    self.hud.hide(animated: true, afterDelay: 2)
                    break
                }
                
            }else {
                self.hud.mode = .text
                self.hud.label.text = "更新成功"
                self.hud.show(animated: true)
                self.hud.hide(animated: true, afterDelay: 2)
                
            }
            
        }
    }


}
