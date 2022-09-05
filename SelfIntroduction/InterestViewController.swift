//
//  InterestViewController.swift
//  SelfIntroduction
//
//  Created by AndyLin on 2022/9/4.
//

import UIKit

class InterestViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UIScrollViewDelegate {
    
    //private let reuseIdentifier = "Cell"
    
    struct CollectionViewPhoto {
        let image: String
    }
    
    let interestData = interestList // 資料
    
    let prettyPhotos: [CollectionViewPhoto] = {
            var prettyPhoto = [CollectionViewPhoto]()
            for i in 0...9 {
                let photo = CollectionViewPhoto(image: "photo\(i)")
                prettyPhoto.append(photo)
            }
            return prettyPhoto
    }()
    
    @IBOutlet weak var InterestCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCollectionView()
        print("\(interestData)")
        // Do any additional setup after loading the view.
    }
    
    func setCollectionView(){
        InterestCollectionView.delegate = self
        InterestCollectionView.dataSource = self
        
        //self.InterestCollectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interestData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterestCollectionViewCell.reuseIdentifier, for: indexPath) as! InterestCollectionViewCell
        
        cell.photoImageView.layer.cornerRadius = cell.photoImageView.frame.size.height/2 // 圓角
        cell.interestTitleLabel.text = interestData[indexPath.row].title // 顯示類別
        let photoScrollView = scrollViewInit(scrollView: cell.photoScrollView, row: indexPath.item)
        cell.addSubview(photoScrollView)
        cell.photoPageControl.numberOfPages = prettyPhotos.count
        return cell
    }
    
    func scrollViewInit(scrollView:UIScrollView,row:Int) -> UIScrollView {
        
        let frameWidth = 350
        let frameHeight = 300
        
        scrollView.frame = CGRect(x: 20, y: 90, width: frameWidth, height: frameHeight)
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false // 不顯示垂直顯示條
        scrollView.showsHorizontalScrollIndicator = false // 不顯示水平顯示條
        scrollView.isPagingEnabled = true // 開啟滾動
        
        
        let ScrollViewContentWidth = frameWidth * (interestData[row].images.count)
        let ScrollViewContentHeight = CGFloat(frameHeight) // 設定 ScrollView 內容寬、高
        scrollView.contentSize = CGSize(width: CGFloat(ScrollViewContentWidth), height: CGFloat(ScrollViewContentHeight))// 設定 ScrollView 內容寬、高
        
        //print("\(prettyPhotos.count)")
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(changePage(_:)))
        swipeGestureRecognizer.direction = .left
        
        for i in 0...(interestData[row].images.count - 1){
            // 圖片部分
            let ImageViewHeight = frameHeight
            let ImageViewWidth = frameWidth
            let ImageViewX = (CGFloat(frameWidth) * CGFloat(i))

            let imageView = UIImageView(frame: CGRect(x: Int(ImageViewX), y: 0, width: ImageViewWidth, height: ImageViewHeight))
            //print(prettyPhotos[i].image)
            imageView.image = UIImage(named: "\(interestData[row].images[i])") //顯示圖片
            imageView.contentMode = .scaleAspectFill // 圖片顯示模式
            imageView.clipsToBounds = true
            imageView.isUserInteractionEnabled = true
            
            imageView.addGestureRecognizer(swipeGestureRecognizer)
            
            scrollView.addSubview(imageView) // 將圖片加入 ScrollView
        }
        
        
        return scrollView
    }
    
    
    @objc func changePage(_ sender: UISwipeGestureRecognizer) {
            print("change")
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
