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
    
}
