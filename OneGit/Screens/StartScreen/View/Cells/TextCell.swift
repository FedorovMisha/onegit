//
//  TextCell.swift
//  OneGit
//
//  Created by Misha Fedorov on 08.03.2022.
//

import Foundation
import UIKit

class StartScreenTextCell: UITableViewCell {
    
    enum Model {
        case title(text: String)
        case plain(text: String)

        var text: String {
            switch self {
            case .title(text: let text):
                return text
            case .plain(text: let text):
                return text
            }
        }
    }
    
    private let textView = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(textView)
    }
    
    private func setupLayout() {
        textView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(32)
            $0.right.equalToSuperview().offset(-32)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
    func configure(with model: Model) {
        textView.text = model.text
        switch model {
        case .title:
            titleTextStyle(textView)
        case .plain:
            baseTextStyle(textView)
        }
    }
}
