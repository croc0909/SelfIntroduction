//
//  InterestViewController.swift
//  SelfIntroduction
//
//  Created by AndyLin on 2022/9/4.
//

import UIKit

class InterestViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let reuseIdentifier = "Cell"
    
    struct CollectionViewPhoto {
        let image: String
    }
    
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
        //print("\(prettyPhotos)")
        // Do any additional setup after loading the view.
    }
    
    func setCollectionView(){
        InterestCollectionView.delegate = self
        InterestCollectionView.dataSource = self
        
        self.InterestCollectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(prettyPhotos)
        return prettyPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterestCollectionViewCell.reuseIdentifier, for: indexPath) as! InterestCollectionViewCell
        
        let photoName = prettyPhotos[indexPath.item]
        cell.imageView.image = UIImage(named: photoName.image)
        return cell
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
