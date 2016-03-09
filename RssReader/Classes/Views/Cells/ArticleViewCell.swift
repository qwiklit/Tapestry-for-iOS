//
//  ArticleViewCell.swift
//  RssReader
//
//  Created by AppCoda on 11/20/14.
//  Copyright (c) 2014 AppCoda Limited. All rights reserved.
//

import UIKit

class ArticleViewCell: UITableViewCell {
    
    
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageViewConstraintHeight: NSLayoutConstraint!
    @IBOutlet weak var imageViewConstraintWidth: NSLayoutConstraint!
    @IBOutlet var idLabel: UILabel!
    
    @IBOutlet weak var fpdescriptionlabel: UILabel!
    @IBOutlet weak var sharebutton: UIButton!
    @IBOutlet weak var urlbutton: UIButton!
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.updateConstraintsIfNeeded()
        self.contentView.layoutIfNeeded()
        
    }
    
    override func awakeFromNib() {
        configure()
    }
    
    func configure() -> Void {
        if ConfigurationManager.defaultCellFont() != "default" {
            titleLabel.font = UIFont(name: "Coustard", size: 43.5)
            authorLabel.font  = UIFont(name: "Raleway", size: 22.3)
             descriptionLabel?.font  = UIFont(name: "Lato-Light", size: 17.5)
  //          categoryLabel.font  = UIFont(name: ConfigurationManager.defaultCellFont(), size: 15.0)
           fpdescriptionlabel.font  = UIFont(name: "Lato-Regular", size: 21.0)
           idLabel?.font  = UIFont(name: "Lato-Regular", size: 23.0)
        } else {
            titleLabel.font = UIFont(name: "Raleway", size: 35.0)
            authorLabel.font  = UIFont(name: "AUGUSTUS", size: 13.0)
             categoryLabel.font  = UIFont(name: "Raleway", size: 12.0)
 //           dateTimeLabel.font  = UIFont(name: "Raleway", size: 0)
            descriptionLabel?.font  = UIFont(name: "Raleway", size: 14.0)
        }

    }
    
  

    
    
}
