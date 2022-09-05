//
//  InterestCollectionViewCell.swift
//  SelfIntroduction
//
//  Created by AndyLin on 2022/9/4.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "\(InterestCollectionViewCell.self)"
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoPageControl: UIPageControl!
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
}
