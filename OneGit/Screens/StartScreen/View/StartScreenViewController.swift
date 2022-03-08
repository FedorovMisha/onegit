//
//  StartScreenViewController.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import UIKit
import SnapKit
import RxSwift

class StartScreenViewController: BaseViewController {
    
    private let disposeBag = DisposeBag()
    private let indexPathSubject = PublishSubject<IndexPath>()
    private let tableView = UITableView()
    private let viewModel: StartScreenViewModelProtocol
    private var animationStopFlag: Bool = false
    
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
        navigationBarStyle = .hidden
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
        tableView.register(StartScreenButtonCell.self, forCellReuseIdentifier: StartScreenButtonCell.identifier)
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
        if !animationStopFlag {
            animateCell(cell: cell, indexPath: indexPath).subscribe(onCompleted: { [weak self] in
                guard let self = self else {
                    return
                }
                self.animationStopFlag = indexPath.row == self.viewModel.numberOfRows() - 1
            }).disposed(by: disposeBag)
        }
    }
    
    private func animateCell(cell: UITableViewCell, indexPath: IndexPath) -> Completable {
        return Completable.create { [weak self] completable in
            let delay: CGFloat
            let duration: CGFloat
            let transform: CGAffineTransform
            switch indexPath.row {
            case 0:
                delay = 0
                duration = 0.5
                transform = CGAffineTransform(translationX: 0, y: -500)
            case 1:
                delay = 0.3
                duration = 0.5
                transform = CGAffineTransform(translationX: -500, y: -100)
            case 2:
                delay = 0.8
                duration = 0.5
                transform = CGAffineTransform(translationX: 500, y: 200)
            case 3:
                delay = 1.3
                duration = 0.8
                transform = CGAffineTransform(translationX: 100, y: 500)
            default:
                delay = 0
                duration = 0
                transform = CGAffineTransform.identity
            }
            cell.alpha = 0
            cell.transform = transform
            UIView.animate(withDuration: duration,delay: delay) {
                cell.transform = CGAffineTransform.identity
                cell.alpha = 1
            } completion: { _ in
                completable(.completed )
            }
            
            return Disposables.create()
        }
    }
}

