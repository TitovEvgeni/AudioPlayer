//
//  UITableViewCell.swift
//  AudioPlayer
//
//  Created by Titov, Evgeny on 11.03.21.
//

import UIKit

extension UITableViewCell {
    
    static var reuseIndetifier: String {
        return String(describing: self)
    }
}
