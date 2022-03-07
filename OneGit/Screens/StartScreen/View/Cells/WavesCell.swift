//
//  WavesCell.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import UIKit

class WavesCell: UITableViewCell {
    private var pictureView = UIImageView.initWith(baseImageStyle)

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
        contentView.addSubview(pictureView)
        pictureView.image = .startScreenTopImage
    }
    
    private func setupLayout() {
        pictureView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(428)
        }
    }
}
