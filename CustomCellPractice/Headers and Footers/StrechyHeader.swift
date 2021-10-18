//
//  StrechyHeader.swift
//  CustomCellPractice
//
//  Created by Tai Chin Huang on 2021/10/17.
//

import UIKit

class StrechyTableHeaderView: UIView {
    public let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var imgHeightConstraint = NSLayoutConstraint()
    private var imgBottomConstraint = NSLayoutConstraint()
    private var containerView = UIView()
    private var dimView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
        containerView.fillSuperView()
        
        containerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        imgBottomConstraint = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imgHeightConstraint = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imgBottomConstraint.isActive = true
        imgHeightConstraint.isActive = true
        
        imageView.addSubview(dimView)
        dimView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = -(scrollView.contentOffset.y)
        print("content offset is: \(scrollView.contentOffset.y)")
        print("Current offset is: \(offsetY)")
        print("imgHeightConstraint.constant: \(imgHeightConstraint.constant)")
        containerView.clipsToBounds = offsetY <= 0
        
        imgBottomConstraint.constant = offsetY >= 0 ? 0 : -offsetY/2 // 控制圖面上移幅度減緩
        imgHeightConstraint.constant = -47 + max(offsetY, 0) // 控制圖面放大
        
        if offsetY <= 0 {
            dimView.backgroundColor = UIColor(white: 0, alpha: -offsetY/500)
        }
    }
}
