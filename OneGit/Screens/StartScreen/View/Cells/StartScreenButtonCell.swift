//
//  ButtonCell.swift
//  OneGit
//
//  Created by Misha Fedorov on 08.03.2022.
//

import Foundation
import UIKit

class StartScreenButtonCell: UITableViewCell {
    
    private var button = UIButton.initWith(pinkButtonStyle("Next"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(button)
    }

    private func setupLayout() {
        button.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.bottom.equalToSuperview().offset(-30)
            $0.left.equalToSuperview().offset(103)
            $0.right.equalToSuperview().offset(-103)
            $0.height.equalTo(78)
        }
    }
    
}
