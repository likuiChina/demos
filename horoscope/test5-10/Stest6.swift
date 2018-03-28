//
//  Stest6.swift
//  horoscope
//
//  Created by LK on 2018/3/21.
//  Copyright © 2018年 LK. All rights reserved.
//

import UIKit

class Stest6: NSObject {

    
    var name1 = "hahah";
    var arrayTemp = [Int](repeating: 0 , count: 3);
    var arrayTemp2:[Int] = [11, 112,222,455];
    
    var dic1:[String: Int] = ["name":1,"age":99];
    
    public func showName(age : Int , name:String) -> String {
        print("hello swift----");
        
        var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        
        var oldVal = someDict[1]
        someDict[1] = "One 新的值"
        var someVar = someDict[1]
        
        print( "key = 1 旧的值 \(oldVal)" )
        print( "key = 1 的值为 \(someVar)" )
        print( "key = 2 的值为 \(someDict[2])" )
        print( "key = 3 的值为 \(someDict[3])" )
        
        
        var x = 1
        var y = 5
        swapTwoInts(a:&x, &y)
        print("x 现在的值 \(x), y 现在的值 \(y)")
        
        return("o showName a \(name1)");
    }
    
    
    func swapTwoInts(a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    var myString = "Hello, World!"
    
    func showTestDemo(showFirstName:String) -> String {
        print(myString)
        
//        return(showFirstName + "ooooo");
        return(showFirstName);
    }
    
//    @objc(initWithData:)
//    init(data: String){
//        println(data);
//    }
    
    
    
    
    
}
