//
//  MenuCell.swift
//  SlideMenuUp
//
//  Created by adel radwan on 10/2/18.
//

import UIKit

class MenuCell : UITableViewCell {
    
    var menuTextFont  : UIFont  {
        get { return UIFont.systemFont(ofSize: 15) }
        set{ self.menuTitle.font = newValue }
    }
    var menuTextColor : UIColor {
        get { return .black }
        set { self.menuTitle.textColor = newValue }
    }
    var iconColor     : UIColor {
        get { return .black }
        set { self.menuIcon.tintColor = newValue }
    }
    
    lazy var menuIcon : UIImageView = {
        let i = UIImageView()
        i.tintColor = self.iconColor
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var menuTitle : UILabel = {
        let l = UILabel()
        l.font = self.menuTextFont
        l.textColor = self.menuTextColor
        l.textAlignment = .justified
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    var menuItem : MenuDataSource? {
        didSet{
            guard let d = self.menuItem else { return }
            self.menuTitle.text = d.title
            self.menuIcon.image = d.image
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(self.menuIcon)
        addSubview(self.menuTitle)
        
        NSLayoutConstraint.activate([
            self.menuIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.menuIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.menuIcon.widthAnchor.constraint(equalToConstant: 27),
            self.menuIcon.heightAnchor.constraint(equalToConstant: 27),
            
            self.menuTitle.leadingAnchor.constraint(equalTo: self.menuIcon.trailingAnchor, constant: 15),
            self.menuTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            self.menuTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.menuTitle.heightAnchor.constraint(equalToConstant: 25),
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
