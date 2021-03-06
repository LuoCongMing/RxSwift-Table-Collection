//
//  InputValidator.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/16.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit

class InputValidator {

}

extension InputValidator {
    //判断字符串是否符合语法法则
    class func isValidEmail(_ email: String) -> Bool {
        let regular = try? NSRegularExpression(pattern: "^\\S+@\\S+\\.\\S+$", options: [])
        if let re = regular {
            let range = NSRange(location: 0, length: email.lengthOfBytes(using: .utf8))
            let result = re.matches(in: email, options: [], range: range)
            return result.count > 0
        }
        return false
    }
    
    //判断密码字符个数>8
    class func isValidPassword(_ password: String) -> Bool {
        return password.characters.count >= 8
    }
    
    //判断用户名
    class func validateUserName(_ username: String) -> Result {
        //判断字符个数是否正确
        if username.characters.count < 6 {
            return Result.failure(message: "输入的字符个数不能少于6个字符")
        }
        
        //账号可用
        return Result.success(message: "账号可用")
    }
    
    //检测密码
    class func validatePassword(_ password : String) -> Result {
        if password.characters.count < 6 {
            return Result.failure(message: "输入密码不能少于6个字符")
        }
        
        return Result.success(message: "密码可用")
    }
    
    //判断登陆陆时的账号和密码是否一致
    class func validateRepeatPassword(_ password : String, _ repeatPassword : String) -> Result {
        if password == repeatPassword && !password.isEmpty && !repeatPassword.isEmpty{
            return Result.success(message: "两次输入的密码一致")
        }
        
        return Result.failure(message: "两次输入的密码不一致")
    }
    
    //判断是否可以注册成功
    class func validateRegisterSUccess(_ username: Result, _ password : Result, _ repeatPassword : Result) -> Result {
        if username.isValid && password.isValid && repeatPassword.isValid {
            return Result.success(message: "注册成功")
        }
        
        return Result.failure(message: "注册失败")
    }
}
