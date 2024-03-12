//
//  ViewController.swift
//  test
//
//  Created by DKI on 05.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    
    
    
    
    
    class A {
        var key:String
        var value:String
        
        init(key: String, value: String) {
            self.key = key
            self.value = value
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        var intArr = [4,52,75,44,25,66, 3]
//        var intArr2 = [3,52,4,75,44,44,77,88,99]
//        intArr.sort()
//        
//        print(intArr)
//        
//        var strArr = ["abc", "xyza", "baeeee", "def"]
//        strArr.sort()
//        
//        print(strArr)
//        
//        var index: Int = intArr.firstIndex(of: 4) ?? -1
//        print(index)
//        
//        print(countFreq(arr: intArr, value: 9))
//        
//        print(findCommon(arr1: intArr, arr2: intArr2))
//        
//        print(createString(str: "abcdefxyz", n: 3))
//        
//        print(secondSmallest(arr: intArr))
        
        
        
        
        
    }

    @IBAction func btnOnClick(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    
    
    
    func countFreq(arr: [Int], value:Int) -> Int {
        var n = 0
        for a in arr {
            if a == value {
                n+=1
            }
        }
        return n
    }
    
    func findCommon(arr1: [Int], arr2: [Int]) -> [Int] {
        var common: [Int] = []
        var set1 = Set(arr1)
        var set2 = Set(arr2)
        
        for a in set1 {
            if set2.contains(a) {
                common.append(a)
            }
        }
        return common
    }
    
    func createString(str: String, n: Int) -> String {
        return str.prefix(n).appending(str.suffix(n))
    }
    
    func secondSmallest(arr:[Int]) -> Int {
        var first = Int(INT64_MAX)
        var second = Int(INT64_MAX)
        for a in arr {
            if (a < first) {
                first = a
            }
            if (a > first && a < second) {
                second = a
            }
            
        }
        return second
    }
}

