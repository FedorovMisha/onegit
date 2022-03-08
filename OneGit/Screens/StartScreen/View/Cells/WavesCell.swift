//
//  WavesCell.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import UIKit

class WavesCell: UITableViewCell {
    private let pictureView = UIImageView.initWith(baseImageStyle)
    private let logoLabel = UILabel.initWith(logoTextStyle)
    private let gitHubImageView = UIImageView.initWith(baseImageStyle)

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
        pictureView.addSubview(logoLabel)
        pictureView.addSubview(gitHubImageView)
        pictureView.image = .startScreenTopImage
        gitHubImageView.image = .gitHubLogoImage
        logoLabel.text = "ONEGIT"
    }
    
    private func setupLayout() {
        pictureView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-98)
            $0.height.equalTo(428)
        }
    
        logoLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(50)
            $0.right.lessThanOrEqualTo(gitHubImageView.snp.left).offset(0)
        }

        gitHubImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(128)
            $0.right.equalToSuperview().offset(-33)
        }
    }
}
