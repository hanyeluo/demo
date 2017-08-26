//
//  SendMessageViewController.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit
import MBProgressHUD
class CommentViewController: UIViewController {

    var offer: Offer
    let service = CommentService()
    
    //UI
    lazy var hud: MBProgressHUD = {
        let _hud = MBProgressHUD(view: self.view)
        return _hud
    }()
    
    lazy var lineLabel: UILabel = {
        let _lineLabel = UILabel(frame: CGRect(x: 20, y: 84, width: 5, height: 20))
        _lineLabel.backgroundColor = .blue
        return _lineLabel
    }()
    
    lazy var titleLabel: UILabel = {
        let _titleLabel = UILabel(frame: CGRect(x: self.lineLabel.frame.maxX+6, y: self.lineLabel.frame.minY, width: 300, height: 20))
        _titleLabel.font = UIFont.boldSystemFont(ofSize: T1)
        _titleLabel.textColor = .blue
        _titleLabel.text = "请输入留言内容"
        return _titleLabel
    }()
    
    lazy var textView: UITextView = {
        let _textView = UITextView(frame: CGRect(x: 20, y: self.titleLabel.frame.maxY+20, width: SCREEN_WIDTH-40, height: 174))
        _textView.layer.masksToBounds = true
        _textView.layer.borderColor = UIColor.gray.cgColor
        _textView.layer.borderWidth = 0.5
        _textView.layer.cornerRadius = 4
        return _textView
    }()
    
    lazy var submitButton: UIButton = {
        let _submitButton = UIButton(frame: CGRect(x: 0, y: SCREEN_HEIGHT-44, width: SCREEN_WIDTH, height: 44))
        _submitButton.setTitle("提交", for: .normal)
        _submitButton.backgroundColor = .green
        _submitButton.titleLabel?.font = UIFont.systemFont(ofSize: T1)
        _submitButton.setTitleColor(.white, for: .normal)
        _submitButton.addTarget(self, action: #selector(CommentViewController.postComment), for: .touchUpInside)
        return _submitButton
    }()
    
    init(offer: Offer) {
        self.offer = offer
        super.init(nibName: nil, bundle: nil)
        title = "评论"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(lineLabel)
        view.addSubview(titleLabel)
        view.addSubview(textView)
        view.addSubview(submitButton)
        view.addSubview(hud)
    }

    //network
    func postComment()  {
        let dic = ["content": textView.text]
        let comment = Comment(dic: dic as NSDictionary)
        service.post(offer: offer, comment: comment) { (error) -> (Void) in
            if error != nil {
                switch error! {
                case .unAuth:
                    RouteHelper.presentLoginVC(viewController: self, completion: nil)
                default:
                    logInfo(error?.description)
                    break
                }
                
            }else {
                self.hud.mode = .text
                self.hud.label.text = "留言成功"
                self.hud.show(animated: true)
                self.hud.hide(animated: true, afterDelay: 2)
            }
        }
    }

}
