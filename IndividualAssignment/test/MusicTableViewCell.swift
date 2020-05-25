//
//  MusicTableViewCell.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 23/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import Foundation
import UIKit

class MusicTableViewCell : UITableViewCell {
    
    var mainImageView : UIImageView = {
       var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var mainLabel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var textView : UITextView = {
       var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    var moreBtn : UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(mainImageView)
        self.addSubview(mainLabel)
        self.addSubview(textView)
        self.addSubview(moreBtn)
    }
    
    override func layoutSubviews() {
        
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: self.mainImageView.heightAnchor).isActive = true
        
        mainLabel.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        mainLabel.topAnchor.constraint(equalTo: mainImageView.topAnchor).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        mainLabel.rightAnchor.constraint(equalTo: moreBtn.leftAnchor).isActive = true
        
        textView.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        moreBtn.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        moreBtn.topAnchor.constraint(equalTo: self.mainLabel.topAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
