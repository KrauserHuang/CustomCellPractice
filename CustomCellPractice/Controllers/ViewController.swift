//
//  ViewController.swift
//  CustomCellPractice
//
//  Created by Tai Chin Huang on 2021/10/17.
//

import UIKit

class ViewController: UIViewController {
    
    var sections = [Section]()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    // create custom tableView object
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(GalleryTableViewCell.self, forCellReuseIdentifier: "\(GalleryTableViewCell.self)")
        
        tableView.register(BasicTableViewCell.self, forCellReuseIdentifier: "\(BasicTableViewCell.self)")
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "\(SwitchTableViewCell.self)")
        
        tableView.register(SectionHeader.self, forHeaderFooterViewReuseIdentifier: "\(SectionHeader.self)")
        tableView.register(SectionFooter.self, forHeaderFooterViewReuseIdentifier: "\(SectionFooter.self)")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.fillSuperView()
        
        let header = StrechyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        tableView.tableHeaderView = header
        
        setupViewModels()
    }
    
    private func setupViewModels() {
        sections.append(Section(title: "最近上線", cellTypes: [
            .galleryTableViewCellType(
                viewModels: [
                    GalleryCollectionViewCellVM(title: "2", imageName: "2"),
                    GalleryCollectionViewCellVM(title: "3", imageName: "3"),
                    GalleryCollectionViewCellVM(title: "4", imageName: "4"),
                    GalleryCollectionViewCellVM(title: "5", imageName: "5"),
                    GalleryCollectionViewCellVM(title: "6", imageName: "6"),
                    GalleryCollectionViewCellVM(title: "7", imageName: "7"),
                    GalleryCollectionViewCellVM(title: "8", imageName: "8"),
                ], row: 2
            )
        ]))
        sections.append(Section(title: "尋找設定", cellTypes: [
            .switchCellType(
                viewModel: SwitchTableViewCellVM(
                    title: "全球",
                    iconImage: UIImage(systemName: "globe.asia.australia"),
                    iconTintColor: .systemOrange,
                    handler: {},
                    isOn: false
                )
            ),
            .basicTableViewCellVM(
                viewModel: BasicTableViewCellVM(
                    title: "位置",
                    iconImage: UIImage(systemName: "location.fill"),
                    iconTintColor: .systemMint,
                    handler: { [weak self] in
                        self?.popVC()
                    }
                )
            )
        ]))
        
        sections.append(Section(title: "帳號設定", cellTypes: [
            .basicTableViewCellVM(
                viewModel: BasicTableViewCellVM(
                    title: "電話號碼",
                    iconImage: UIImage(systemName: "iphone"),
                    iconTintColor: .systemPink,
                    handler: { [weak self] in
                        self?.popVC()
                    }))
        ]))
    }
    
    func popVC() {
        let vc = TestViewController()
        present(vc, animated: true)
    }
}
// MARK: - TableView DataSourece/Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cellTypes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].cellTypes[indexPath.row] {
        case .galleryTableViewCellType(let viewModels, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(GalleryTableViewCell.self)", for: indexPath) as! GalleryTableViewCell
            cell.configure(with: viewModels)
            cell.delegate = self
            return cell
        case .switchCellType(viewModel: let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(SwitchTableViewCell.self)", for: indexPath) as! SwitchTableViewCell
            cell.configure(with: viewModel)
            cell.selectionStyle = .none
            return cell
        case .basicTableViewCellVM(viewModel: let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(BasicTableViewCell.self)", for: indexPath) as! BasicTableViewCell
            cell.configure(with: viewModel)
            return cell
        }
    }
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section].cellTypes[indexPath.row] {
        case .galleryTableViewCellType(viewModels: _, row: let row):
            let height: CGFloat = view.frame.size.width / 2.5 * 1.5
            return height * CGFloat(row) + Constant.padding * CGFloat(row + 1) + 1
        case .switchCellType(viewModel: _):
            return view.frame.size.width / 8
        case .basicTableViewCellVM(viewModel: _):
            return view.frame.size.width / 8
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch sections[indexPath.section].cellTypes[indexPath.row] {
        case .galleryTableViewCellType(viewModels: _, row: _):
            break
        case .switchCellType(viewModel: _):
            break
        case .basicTableViewCellVM(viewModel: let viewModel):
            viewModel.handler()
        }
    }
    // section header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(SectionHeader.self)") as! SectionHeader
            header.configure(text: sections[section].title)
            return header
        case 1:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(SectionHeader.self)") as! SectionHeader
            header.configure(text: sections[section].title)
            return header
        case 2:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(SectionHeader.self)") as! SectionHeader
            header.configure(text: sections[section].title)
            return header
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    // section footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard section == sections.count - 1 else { return nil}
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(SectionFooter.self)") as! SectionFooter
        return footer
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == sections.count - 1 ? 80 : 0
    }
}
// MARK: - GalleryTableViewDelegate
extension ViewController: GalleryTableCellDelegate {
    func didTapItem(with viewModel: GalleryCollectionViewCellVM) {
        let alertController = UIAlertController(title: viewModel.title, message: "成功點擊", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "確定", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
// MARK: - ScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StrechyTableHeaderView else { return }
        header.scrollViewDidScroll(scrollView: tableView)
    }
}
