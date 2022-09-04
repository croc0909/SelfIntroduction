//
//  IntroductionViewController.swift
//  SelfIntroduction
//
//  Created by AndyLin on 2022/9/3.
//

import UIKit

class IntroductionViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var introductionScrollView: UIScrollView!
    @IBOutlet var scrollViewContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SetScrollView()
        // Do any additional setup after loading the view.
    }
    
    func SetScrollView(){
        introductionScrollView.delegate = self
        introductionScrollView.showsVerticalScrollIndicator = false // 不顯示垂直顯示條
        introductionScrollView.showsHorizontalScrollIndicator = false // 不顯示水平顯示條
        
        let ScrollViewContentWidth = scrollViewContentView.frame.size.width
        let ScrollViewContentHeight = scrollViewContentView.frame.size.height
        introductionScrollView.contentSize = CGSize(width: ScrollViewContentWidth, height: ScrollViewContentHeight) // 設定 ScrollView 內容寬、高
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
