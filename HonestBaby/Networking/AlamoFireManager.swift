////
////  AlamoFireManager.swift
////  HonestBaby
////
////  Created by Aakash Sareen on 3/6/15.
////  Copyright (c) 2015 Aakash Sareen. All rights reserved.
////
//
//import Foundation
//import Alamofire
//
//
//
//
//class  AlamoFireManager{
//    
//    func login() {
//        
//        let user = [
//            "email": "thanh@honest.com",
//            "password": "foobar"]
//        
//        let parameters = ["user":user]
//        
//        
//        
//        let URL = NSURL(string: "https://qa.honestqa.com/users/sign_in")
//        var request = NSURLRequest(URL: URL!)
//        
//        let encoding = Alamofire.ParameterEncoding.URL
//        
//        
//        //        Alamofire.request(.GET, "https://qa:aq@qa.honestqa.com/users/sign_in", parameters: loginParameters)
//        //            (_, _, data, _) in
//        //            println(data)
//        //        }
//        
//        let username = "qa"
//        let password = "aq"
//        
//        Alamofire.request(.GET, "http://\(username):\(password)@qa.honestqa.com/users/sign_in", parameters: parameters, encoding: .URL)
//            .authenticate(user: username, password: password)
//            .response { (request, response, data, error) in
//                println(request)
//                println(response)
//                println(error)
//                
//                
//        }
//        
//    }
//    func getKids(){
//        Alamofire.request(.GET, "https://api-qa.honestqa.com/v1/users/:user_id/kids", encoding: .JSON)
//            .response { (request, response, data, error) in
//                println(request)
//                println(response)
//                println(error)
//                
//                
//
//        }
//    }
//    
//}
