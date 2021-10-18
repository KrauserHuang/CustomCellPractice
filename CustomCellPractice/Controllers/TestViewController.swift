//
//  TestViewController.swift
//  CustomCellPractice
//
//  Created by Tai Chin Huang on 2021/10/17.
//

import UIKit

class TestViewController: UIViewController {
    
    private let testLabel: UILabel = {
        let label = UILabel()
        label.text          = "Test Page"
        label.font          = .systemFont(ofSize: 36, weight: .bold)
        label.textColor     = .white
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(testLabel)
        testLabel.frame = view.bounds
    }
}
