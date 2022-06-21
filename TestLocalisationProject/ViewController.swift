//
//  ViewController.swift
//  TestLocalisationProject
//
//  Created by Kanstantsin Ausianovich on 21.06.22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    lazy var testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test_key".localized
        label.textColor = .black
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setSubviews()
        self.activateConstraints()
    }

    func setSubviews() {
        self.view.addSubview(self.testLabel)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            self.testLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.testLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

}

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}


