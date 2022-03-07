//
//  StartScreenViewController.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import UIKit
import SnapKit

class StartScreenViewController: BaseViewController {
    
    private let tableView = UITableView()
    private let viewModel: StartScreenViewModelProtocol

    init(_ viewModel: StartScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }

    private func setupUI() {
        view.backgroundColor = .applicationPurpleColor
        view.addSubview(tableView)
        setupTableView()
    }

    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
    }

    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WavesCell.self, forCellReuseIdentifier: WavesCell.identifier)
        tableView.register(StartScreenTextCell.self, forCellReuseIdentifier: StartScreenTextCell.identifier)
    }
}

extension StartScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModel.cellViewModel(for: indexPath)
        let cell = tableView.cell(for: viewModel, indexPath: indexPath)
        viewModel.configure(any: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            animateWaves(cell: cell, duration: 1)
        } else {
            animateCell(cell: cell, duration: CGFloat(indexPath.row))
        }
    }

    private func animateCell(cell: UITableViewCell, duration: CGFloat) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: -500, y: 0)
        UIView.animate(withDuration: duration) {
            cell.alpha = 1
            cell.transform = CGAffineTransform.identity
        }
    }

    private func animateWaves(cell: UITableViewCell, duration: CGFloat) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 0, y: -500)
        UIView.animate(withDuration: duration) {
            cell.transform = CGAffineTransform.identity
            cell.alpha = 1
        }
    }
}

