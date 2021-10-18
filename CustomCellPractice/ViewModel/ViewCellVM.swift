//
//  ViewCellVM.swift
//  CustomCellPractice
//
//  Created by Tai Chin Huang on 2021/10/17.
//

import Foundation
import UIKit

enum CellType {
    case galleryTableViewCellType(viewModels: [GalleryCollectionViewCellVM], row: Int)
    case switchCellType(viewModel: SwitchTableViewCellVM)
    case basicTableViewCellVM(viewModel: BasicTableViewCellVM)
}

struct Section {
    let title: String
    let cellTypes: [CellType]
}

struct GalleryCollectionViewCellVM {
    let title: String
    let imageName: String
}

struct SwitchTableViewCellVM {
    let title: String
    let iconImage: UIImage?
    let iconTintColor: UIColor
    let handler: (() -> Void)
    let isOn: Bool
}

struct BasicTableViewCellVM {
    let title: String
    let iconImage: UIImage?
    let iconTintColor: UIColor
    let handler: (() -> Void)
}
