//
//  BasicTableViewCell.swift
//  CustomCellPractice
//
//  Created by Tai Chin Huang on 2021/10/17.
//

import UIKit

class BasicTableViewCell: UITableViewCell {
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.anchor(
            leading: contentView.leadingAnchor,
            padding: .init(top: 0, left: 25, bottom: 0, right: 0),
            centerY: contentView.centerYAnchor,
            width: 25, height: 25
        )
        
        label.anchor(
            leading: iconImageView.trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 0),
            centerY: contentView.centerYAnchor
        )
    }
    
    public func configure(with viewModel: BasicTableViewCellVM) {
        iconImageView.image     = viewModel.iconImage
        iconImageView.tintColor = viewModel.iconTintColor
        label.text              = viewModel.title
    }
}
