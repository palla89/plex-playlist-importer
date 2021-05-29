//
//  UITextField+Extensions.swift
//  Plex Playlist Importer
//
//  created by Alberto Paladino on 28/05/21.
//

import UIKit

extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.systemGray2.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
