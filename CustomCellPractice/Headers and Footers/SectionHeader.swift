//
//  SectionHeader.swift
//  CustomCellPractice
//
//  Created by Tai Chin Huang on 2021/10/17.
//

import UIKit

class SectionHeader: UITableViewHeaderFooterView {
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        let bgView = UIView()
        bgView.backgroundColor = .clear
        backgroundView = bgView
        
        contentView.addSubview(label)
        label.anchor(
            leading: contentView.leadingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 0),
            centerY: contentView.centerYAnchor
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String) {
        label.text = text
    }
}
