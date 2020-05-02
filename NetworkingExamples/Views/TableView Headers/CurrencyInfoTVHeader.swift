//
//  CurrencyInfoTVHeader.swift
//  NetworkingExamples
//
//  Created by Josh R on 5/2/20.
//  Copyright © 2020 Josh R. All rights reserved.
//

import UIKit

class CurrencyInfoTVHeader: UIView {
    
    lazy var dateLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .label
        label.baselineAdjustment = .alignCenters
        
        return label
    }()
    
    lazy var baseRateLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.baselineAdjustment = .alignCenters
        
        return label
    }()
    
    let labelSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 2
        sv.distribution = .fill
        sv.alignment = .leading
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.sizeToFit()
        return sv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        
        labelSV.addArrangedSubview(baseRateLbl)
        labelSV.addArrangedSubview(dateLbl)
        self.addSubview(labelSV)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        //Not using SB so implementation isn't needed
    }
    
    
    private func setupConstraints() {
        labelSV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelSV.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            labelSV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            labelSV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            labelSV.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -12)
        ])
    }
    
}
