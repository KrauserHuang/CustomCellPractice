//
//  SectionFooter.swift
//  CustomCellPractice
//
//  Created by Tai Chin Huang on 2021/10/17.
//

import UIKit

class SectionFooter: UITableViewHeaderFooterView {
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "applelogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Copyright © 2021 Apple Inc. All rights reserved."
        label.textColor = .systemGray4
        label.font = .systemFont(ofSize: 8, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        let bgView = UIView()
        bgView.backgroundColor = .clear
        backgroundView = bgView
        
        contentView.addSubview(iconImageView)
        iconImageView.anchor(
            top: contentView.topAnchor,
            padding: .init(top: 30, left: 0, bottom: 0, right: 0),
            centerX: contentView.centerXAnchor,
            width: 28, height: 28
        )
        
        contentView.addSubview(label)
        label.anchor(
            top: iconImageView.bottomAnchor,
            padding: .init(top: 5, left: 0, bottom: 0, right: 0),
            centerX: contentView.centerXAnchor
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
