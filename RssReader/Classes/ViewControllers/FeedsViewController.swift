//
//  FeedsViewController.swift
//  RssReader
//
//  Created by AppCoda on 11/20/14.
//  Copyright (c) 2014 AppCoda Limited. All rights reserved.
//  Enable PUSH NOTIFICATIONS on every page

import UIKit

class FeedsViewController: UITableViewController {
    @IBOutlet var navigationHeaderButton: UIButton!
    
   
    var navigationHeaderLabel:UILabel?
    private var _currentFeeds: (title: String, url: String)?
    private let slideUpTransitionAnimator = SlideUpTransitionAnimator()
    var urlbutton: UIButton?
   
    
    var currentFeeds: (title: String, url: String)? {
        set (newValue){
            _currentFeeds = newValue
            loadTableView(_currentFeeds?.url, title: _currentFeeds?.title)
        }
        get {
            return _currentFeeds
        }
    }
    
    // Data source for UITableView
    lazy var dataSource: ArticleDataSource? = {
        return ArticleDataSource(configureCellClosure: { (var articleCell, article, indexPath) -> () in
           
            // Display article title
           articleCell.titleLabel.text = article.title
        
            
            // display atom id for front page
            
        articleCell.idLabel.text = article.id
        articleCell.descriptionLabel.textAlignment = NSTextAlignment.Justified
            
       //    articleCell.fpdescriptionlabel.text = "Click here to read the rest of the story"
            
            //article.rawDescription?.stringByReplacingOccurrencesOfString("\n", withString: "").stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            

            
           
          

            
            
            
                         //Change the ID of web URL to something presentable and legible
            
            

        if  articleCell.idLabel.text!.lowercaseString.rangeOfString("electricliterature") != nil {
            articleCell.idLabel.text = "Electric Literature"
            articleCell.idLabel.backgroundColor = UIColor(red: 192.0/255.0, green: 57.0/255.0, blue: 43.0/255.0, alpha: 0.98)
            articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
            articleCell.fpdescriptionlabel.text = "Read this story and more on Electric Literature →"
       
            }
           
            
            
            if  articleCell.idLabel.text!.lowercaseString.rangeOfString("anthill") != nil {
                articleCell.idLabel.text = "The Anthill"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Anthill →"

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("quaint") != nil {
                articleCell.idLabel.text = "Quaint Magazine"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Quaint Magazine →"

        //        articleCell.idLabel.backgroundColor = UIColor(red: 108.0/255.0, green: 122.0/255.0, blue: 137.0/255.0, alpha: 0.98)
         //       articleCell.authorLabel.backgroundColor = UIColor(red: 108.0/255.0, green: 122.0/255.0, blue: 137.0/255.0, alpha: 0.98)
        //         articleCell.titleLabel.backgroundColor = UIColor(red: 108.0/255.0, green: 122.0/255.0, blue: 137.0/255.0, alpha: 0.98)
         //        articleCell.authorLabel.backgroundColor = UIColor(red: 108.0/255.0, green: 122.0/255.0, blue: 137.0/255.0, alpha: 0.98)
               
            }
            
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("atticus") != nil {
                articleCell.idLabel.text = "Atticus Review"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Atticus Review →"
                

                 articleCell.idLabel.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                 articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
        //         articleCell.titleLabel.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
        //         articleCell.authorLabel.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("brainpickings") != nil {
                articleCell.idLabel.text = "Brain Pickings"
                articleCell.idLabel.backgroundColor = UIColor(red: 247.0/255.0, green: 202.0/255.0, blue: 24.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.text = "Read this story and more on Brain Pickings →"
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 247.0/255.0, green: 202.0/255.0, blue: 24.0/255.0, alpha: 0.98)
                
            }

            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("deadmule") != nil {
                articleCell.idLabel.text = "Dead Mule"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Dead Mule →"
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("eighteen") != nil {
                articleCell.idLabel.text = "EighteenBridges"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Eighteen Bridges →"
                articleCell.idLabel.backgroundColor = UIColor(red: 244.0/255.0, green: 179.0/255.0, blue: 80.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 244.0/255.0, green: 179.0/255.0, blue: 80.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("geist") != nil {
                articleCell.idLabel.text = "Geist"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Geist →"
                articleCell.idLabel.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("hazlitt") != nil {
                articleCell.idLabel.text = "Hazlitt"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Hazlitt →"
                articleCell.idLabel.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 25.0/255.0, alpha: 0.98)
                 articleCell.fpdescriptionlabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("purplepassion") != nil {
                articleCell.idLabel.text = "Purple Passion Press →"

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("offing") != nil {
                articleCell.idLabel.text = "The Offing Mag"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on The Offing Mag →"
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                 articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("poeticentanglement") != nil {
                articleCell.idLabel.text = "Poetic Entaglement"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Poetic Entanglement →"
                articleCell.idLabel.backgroundColor = UIColor(red: 70.0/255.0, green: 122.0/255.0, blue: 70.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 70.0/255.0, green: 122.0/255.0, blue: 70.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("mcsweeney") != nil {
                articleCell.idLabel.text = "McSweeneys"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on McSweeneys →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("feathertale") != nil {
                articleCell.idLabel.text = "Feathertale"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Feathertale →"
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
            }
            
    
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("necessaryfiction") != nil {
                articleCell.idLabel.text = "Necessary Fiction"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Necessary Fiction →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                
                
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("masters") != nil {
                articleCell.idLabel.text = "Master's Review"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on The Master's Review →"
                articleCell.idLabel.backgroundColor = UIColor(red: 3.0/255.0, green: 201.0/255.0, blue: 169.0/255.0, alpha: 0.98)
                articleCell.authorLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 3.0/255.0, green: 201.0/255.0, blue: 169.0/255.0, alpha: 0.98)
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("bisonjack") != nil {
                articleCell.idLabel.text = "The Journal of Bison Jack"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on The Journal of Bison Jack →"
                articleCell.idLabel.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 0.98)
                articleCell.authorLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                 articleCell.fpdescriptionlabel.textColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 0.98)
           //     articleCell.titleLabel.shadowColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 0.98)
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("bisonjack") != nil {
                articleCell.idLabel.text = "The Journal of Bison Jack"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Journal of Bison Jack →"
                articleCell.idLabel.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 0.98)
                articleCell.authorLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 0.98)
                //     articleCell.titleLabel.shadowColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 0.98)
                
            }
            

            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("chicago") != nil {
                articleCell.idLabel.text = "Chicago Literati"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Chicago Literati →"
                articleCell.idLabel.backgroundColor = UIColor(red: 22.0/255.0, green: 160.0/255.0, blue: 133.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("3am") != nil {
                articleCell.idLabel.text = "3am Magazine"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on 3am Magazine →"
                articleCell.idLabel.backgroundColor = UIColor(red: 171.0/255.0, green: 181.0/183.0, blue: 63.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/183.0, blue: 255.0/255.0, alpha: 0.98)
                 articleCell.fpdescriptionlabel.textColor = UIColor(red: 171.0/255.0, green: 181.0/183.0, blue: 63.0/255.0, alpha: 0.98)
   
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("buenosaires") != nil {
                articleCell.idLabel.text = "The Buenos Aires Review"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on The Buenos Aires Review →"
                articleCell.idLabel.backgroundColor = UIColor(red: 253.0/255.0, green: 223.0/183.0, blue: 167.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/183.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 253.0/255.0, green: 223.0/183.0, blue: 167.0/255.0, alpha: 0.98)
            }
         
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("augury") != nil {
                articleCell.idLabel.text = "Augury Books"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Augury Books →"
                articleCell.idLabel.backgroundColor = UIColor(red: 30.0/255.0, green: 130.0/183.0, blue: 76.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/183.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 30.0/255.0, green: 130.0/183.0, blue: 76.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("carvezine") != nil {
                articleCell.idLabel.text = "Carve Magazine"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Carve Magazine →"
                articleCell.idLabel.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/183.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/183.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/183.0, blue: 255.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("americanshortfiction") != nil {
                articleCell.idLabel.text = "American Short Fiction"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on American Short Fiction →"
                articleCell.idLabel.backgroundColor = UIColor(red: 46.0/255.0, green: 204.0/183.0, blue: 113.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/183.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 46.0/255.0, green: 204.0/183.0, blue: 113.0/255.0, alpha: 0.98)
                
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("publicbooks") != nil {
                articleCell.idLabel.text = "Public Books"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Public Books →"
                articleCell.idLabel.backgroundColor = UIColor(red: 46.0/255.0, green: 204.0/183.0, blue: 113.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/183.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 46.0/255.0, green: 204.0/183.0, blue: 113.0/255.0, alpha: 0.98)
            }
            
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("pithead") != nil {
                articleCell.idLabel.text = "Pithead Chapel"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Pithead Chapel →"
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/191.0, blue: 113.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/183.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/191.0, blue: 113.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("pshares") != nil {
                articleCell.idLabel.text = "Ploughshares"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Ploughshares →"
                articleCell.idLabel.backgroundColor = UIColor(red: 58.0/255.0, green: 83.0/255.0, blue: 155.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 63.0/255.0, green: 195.0/255.0, blue: 128.0/255.0, alpha: 0.98)
                
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 58.0/255.0, green: 83.0/255.0, blue: 155.0/255.0, alpha: 0.98)
           
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("thewalrus") != nil {
                articleCell.idLabel.text = "The Walrus"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on The Walrus →"
                articleCell.idLabel.backgroundColor = UIColor(red: 58.0/255.0, green: 83.0/255.0, blue: 155.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/183.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 58.0/255.0, green: 83.0/255.0, blue: 155.0/255.0, alpha: 0.98)
            }
            
            
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("theawl") != nil {
                articleCell.idLabel.text = "The Awl"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Awl →"
                articleCell.idLabel.backgroundColor = UIColor(red: 65.0/255.0, green: 131.0/255.0, blue: 215.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 63.0/255.0, green: 195.0/183.0, blue: 128.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 65.0/255.0, green: 131.0/255.0, blue: 215.0/255.0, alpha: 0.98)
    
            
               
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("harpers") != nil {
                articleCell.idLabel.text = "Harper's"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 31.0/255.0, green: 58.0/255.0, blue: 157.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 31.0/255.0, green: 58.0/255.0, blue: 157.0/255.0, alpha: 0.98)
                    articleCell.fpdescriptionlabel.text = "Read this story and more on Harper's →"

                

                                }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("theamericanreader") != nil {
                articleCell.idLabel.text = "The American Reader"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The American Reader →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 31.0/255.0, green: 58.0/255.0, blue: 157.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("theparisreview") != nil {
                articleCell.idLabel.text = "The Paris Review"
      
                articleCell.idLabel.backgroundColor = UIColor(red: 104.0/255.0, green: 204.0/255.0, blue: 153.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Paris Review →"
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 104.0/255.0, green: 204.0/255.0, blue: 153.0/255.0, alpha: 0.98)

                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("newyorker") != nil {
                articleCell.idLabel.text = "The New Yorker"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The New Yorker →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("rustytoque") != nil {
                articleCell.idLabel.text = "The Rusty Toque"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Rusty Toque →"
                articleCell.idLabel.backgroundColor = UIColor(red: 219.0/255.0, green: 10.0/255.0, blue: 91.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 219.0/255.0, green: 10.0/255.0, blue: 91.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("poetryisdead") != nil {
                articleCell.idLabel.text = "Poetry is Dead"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Poetry is Dead →"
                articleCell.idLabel.textColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 0.98)

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("tor.com") != nil {
                articleCell.idLabel.text = "Tor Magazine"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Tor →"

                articleCell.idLabel.backgroundColor = UIColor(red: 242.0/255.0, green: 38.0/255.0, blue: 19.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("escapepod") != nil {
                articleCell.idLabel.text = "Escape Pod"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Escape Pod →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 31.0/255.0, green: 58.0/255.0, blue: 157.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)


            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("lightspeed") != nil {
                articleCell.idLabel.text = "Lightspeed Magazine"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Lightspeed Magazine →"
                articleCell.idLabel.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("guts") != nil {
                articleCell.idLabel.text = "GUTS Magazine"
                articleCell.fpdescriptionlabel.text = "Read this story and more on GUTS Magazine →"
                
                articleCell.idLabel.backgroundColor = UIColor(red: 63.0/255.0, green: 195.0/255.0, blue: 128.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 63.0/255.0, green: 195.0/255.0, blue: 128.0/255.0, alpha: 0.98)


            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("believermag") != nil {
                articleCell.idLabel.text = "Believer Mag"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Believer Magazine →"

                     articleCell.idLabel.backgroundColor = UIColor(red: 150.0/255.0, green: 140.0/255.0, blue: 27.0/255.0, alpha: 0.98)
                    articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                    articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("apex-mag") != nil {
                articleCell.idLabel.text = "Apex Magazine"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Apex Magazine →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("shortfictionbreak") != nil {
              articleCell.idLabel.text = "Short Fiction Break"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Short Fiction Break →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)

                

         //     articleCell.authorLabel.backgroundColor = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 0.98)
         //     articleCell.authorLabel.textColor = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 0.98)
         //     articleCell.titleLabel.backgroundColor = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 0.98)
         //       articleCell.authorLabel.backgroundColor = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("autumnSky") != nil {
                articleCell.idLabel.text = "Autumn Sky Poetry Daily"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Autumn Sky Daily Poetry →"

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("nereview") != nil {
                articleCell.idLabel.text = "Northeast Review"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                 articleCell.idLabel.backgroundColor = UIColor(red: 103.0/255.0, green: 128.0/255.0, blue: 159.0/255.0, alpha: 0.98)
                 articleCell.fpdescriptionlabel.textColor = UIColor(red: 103.0/255.0, green: 128.0/255.0, blue: 159.0/255.0, alpha: 0.98)
                
                articleCell.fpdescriptionlabel.text = "Read this story and more on Northeast Review →"

                
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("writersalmanac") != nil {
                articleCell.idLabel.text = "Writer's Almanac"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Writer's Almanac →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
       
            }
            
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("shenandoah") != nil {
                articleCell.idLabel.text = "Shenandoah"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Shenandoah →"
                articleCell.idLabel.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("triquarterly") != nil {
                articleCell.idLabel.text = "triquarterly"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Triquarterly →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("thesunmag") != nil {
                articleCell.idLabel.text = "The Sun Magazine"
                articleCell.idLabel.textColor = UIColor(red: 27.0/255.0, green: 163.0/255.0, blue: 255.0/153.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.descriptionLabel.textColor = UIColor(red: 255.0/255.0, green: 227.0/255.0, blue: 167.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Sun Magazine →"

            
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("blackmountain") != nil {
                articleCell.idLabel.text = "witnessmagazine"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Witness Magazine →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("thebarking") != nil {
                articleCell.idLabel.text = "The Barking Magazine"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Barking Magazine →"
                articleCell.idLabel.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("idahoreview") != nil {
                articleCell.idLabel.text = "The Idaho Review"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Idaho Review →"
                articleCell.idLabel.backgroundColor = UIColor(red: 211.0/255.0, green: 84.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 211.0/255.0, green: 84.0/255.0, blue: 0.0/255.0, alpha: 0.98)

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("americanscholar") != nil {
                articleCell.idLabel.text = "The American Scholar"
                articleCell.fpdescriptionlabel.text = "Read this story and more on the American Scholar →"

        
                articleCell.idLabel.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                

                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("chelseastation") != nil {
                articleCell.idLabel.text = "Chelsea Station"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Chelsea Station →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 31.0/255.0, green: 58.0/255.0, blue: 157.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("pen.org") != nil {
                articleCell.idLabel.text = "PEN"
                articleCell.fpdescriptionlabel.text = "Read this story and more on PEN →"
                articleCell.idLabel.textColor = UIColor(red: 210.0/255.0, green: 215.0/255.0, blue: 211.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 210.0/255.0, green: 215.0/255.0, blue: 211.0/255.0, alpha: 0.98)

                

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("kenyonreview") != nil {
                articleCell.idLabel.text = "The Kenyon Review"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Kenyon Review →"

                articleCell.idLabel.backgroundColor = UIColor(red: 242.0/255.0, green: 38.0/255.0, blue: 19.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 242.0/255.0, green: 38.0/255.0, blue: 19.0/255.0, alpha: 0.98)

                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("narrativemag") != nil {
                articleCell.idLabel.text = "Narrative Magazine"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Narrative Magazine →"
                articleCell.idLabel.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("kirkus") != nil {
                articleCell.idLabel.text = "Kirkus Reviews"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Kirkus Reviews →"
                articleCell.idLabel.backgroundColor = UIColor(red: 36.0/255.0, green: 116.0/255.0, blue: 169.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 36.0/255.0, green: 116.0/255.0, blue: 169.0/255.0, alpha: 0.98)
            
            }
            //News
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("queenmobs") != nil {
                articleCell.idLabel.text = "Queen Mob's Teahouse"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Queen Mob's →"
                articleCell.idLabel.backgroundColor = UIColor(red: 36.0/255.0, green: 116.0/255.0, blue: 169.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 36.0/255.0, green: 116.0/255.0, blue: 169.0/255.0, alpha: 0.98)
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("galleycat") != nil {
                articleCell.idLabel.text = "Galleycat"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Galleycat →"
                articleCell.idLabel.backgroundColor = UIColor(red: 46.0/255.0, green: 216.0/255.0, blue: 114.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
              articleCell.idLabel.backgroundColor = UIColor(red: 46.0/255.0, green: 216.0/255.0, blue: 114.0/255.0, alpha: 0.98)

            }
            
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("lrb.co.uk") != nil {
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 31.0/255.0, green: 58.0/255.0, blue: 157.0/255.0, alpha: 0.98)
                articleCell.idLabel.text = "The London Review of Books"
                articleCell.fpdescriptionlabel.text = "Read this story and more on the London Review of Books →"

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("npr.org") != nil {
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 31.0/255.0, green: 58.0/255.0, blue: 157.0/255.0, alpha: 0.98)
                articleCell.idLabel.text = "NPR"
                articleCell.fpdescriptionlabel.text = "Read this story and more on NPR →"

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("omnivoracious") != nil {
                articleCell.idLabel.text = "Omnivoracious"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Omnivoracious →"


                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
              
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("themillions") != nil {
                articleCell.idLabel.text = "The Millions"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Millions →"
                articleCell.idLabel.backgroundColor = UIColor(red: 235.0/255.0, green: 149.0/255.0, blue: 50.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 235.0/255.0, green: 149.0/255.0, blue: 50.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("latimes") != nil {
                articleCell.idLabel.text = "The Los Angeles Times Books"
                articleCell.fpdescriptionlabel.text = "Read this story and more on the LA Times Books →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("lithub") != nil {
                articleCell.idLabel.text = "Lithub"
                 articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 255.0/255.0, green: 239.0/255.0, blue: 216.0/255.0, alpha: 0.98)
                 articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 239.0/255.0, blue: 216.0/255.0, alpha: 0.98)
                
                articleCell.fpdescriptionlabel.text = "Read this story and more on Lithub →"
                
                
               articleCell.descriptionLabel.text = article.summary
              
                
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("bookriot") != nil {
                articleCell.idLabel.text = "Book Riot"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Book Riot →"
                articleCell.idLabel.backgroundColor = UIColor(red: 247.0/255.0, green: 202.0/255.0, blue: 24.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 247.0/255.0, green: 202.0/255.0, blue: 24.0/255.0, alpha: 0.98)
                

            }
            

            if articleCell.idLabel.text!.lowercaseString.rangeOfString("nybooks") != nil {
                articleCell.idLabel.text = "NY Books"
                articleCell.fpdescriptionlabel.text = "Read this story and more on the New York Review of Books →"
                articleCell.idLabel.textColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)

            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("globeandmail") != nil {
                articleCell.idLabel.text = "Globe and Mail Books"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Globe and Mail Books →"

                articleCell.idLabel.backgroundColor = UIColor(red: 242.0/255.0, green: 38.0/255.0, blue: 19.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                  articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                
  
            }
                        
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("worldliteraturetoday") != nil {
                articleCell.idLabel.text = "World Literature Today"
                articleCell.fpdescriptionlabel.text = "Read this story and more on World Literature Today →"
                articleCell.idLabel.backgroundColor = UIColor(red: 58.0/255.0, green: 83.0/255.0, blue: 155.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 58.0/255.0, green: 83.0/255.0, blue: 155.0/255.0, alpha: 0.98)
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("theguardian") != nil {
                
                articleCell.idLabel.text = "The Guardian Books"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Guardian →"
          //      articleCell.authorLabel.backgroundColor = UIColor(red: 58.0/255.0, green: 83.0/255.0, blue: 185.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 58.0/255.0, green: 83.0/255.0, blue: 185.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 58.0/255.0, green: 83.0/255.0, blue: 185.0/255.0, alpha: 0.98)
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("flavorwire") != nil {
                articleCell.idLabel.text = "Flavorwire"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Flavorwire →"
                articleCell.idLabel.backgroundColor = UIColor(red: 58.0/255.0, green: 83.0/255.0, blue: 155.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 58.0/255.0, green: 83.0/255.0, blue: 155.0/255.0, alpha: 0.98)
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("nytimes") != nil {
                articleCell.idLabel.text = "New York Times"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The New York Times →"
                  articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                 articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("tag:,2016") != nil {
                articleCell.idLabel.text = "Words Without Borders"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Words Without Borders →"
                articleCell.idLabel.backgroundColor = UIColor(red: 34.0/255.0, green: 167.0/255.0, blue: 240.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 34.0/255.0, green: 167.0/255.0, blue: 240.0/255.0, alpha: 0.98)

                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("medium.com") != nil {
                articleCell.idLabel.text = "Made Up Words"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Made Up Words →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
                
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("typepad") != nil {
                articleCell.idLabel.text = "Times Literary Supplement"
                articleCell.fpdescriptionlabel.text = "Read this story and more on The Times Literary Supplement →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 155.0/255.0, green: 89.0/255.0, blue: 182.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 155.0/255.0, green: 89.0/255.0, blue: 182.0/255.0, alpha: 0.98)
            
            
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("wordhaus") != nil {
                articleCell.idLabel.text = "Wordhaus"
                articleCell.fpdescriptionlabel.text = "Read this story and more on Wordhaus →"
                articleCell.idLabel.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("vqronline") != nil {
                articleCell.idLabel.text = "The Virginia Quarterly Review"
                articleCell.fpdescriptionlabel.text = "Read this story and more on the Virginia Quarterly Review →"
                articleCell.idLabel.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("rattle") != nil {
                articleCell.idLabel.text = "Rattle"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Rattle →"
                articleCell.idLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
                articleCell.idLabel.backgroundColor = UIColor(red: 31.0/255.0, green: 58.0/255.0, blue: 157.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
       //         articleCell.titleLabel.shadowColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
            }
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("fiction") != nil {
                articleCell.idLabel.text = "Ducts.org"
                 articleCell.fpdescriptionlabel.text = "Read this story and more on Ducts.org →"
                articleCell.idLabel.backgroundColor = UIColor(red: 235.0/255.0, green: 149.0/255.0, blue: 50.0/255.0, alpha: 0.98)
                articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.98)
                articleCell.fpdescriptionlabel.textColor = UIColor(red: 235.0/255.0, green: 149.0/255.0, blue: 50.0/255.0, alpha: 0.98)
       //         articleCell.titleLabel.shadowColor = UIColor(red: 235.0/255.0, green: 149.0/255.0, blue: 50.0/255.0, alpha: 0.98)
            }
            
            
            
            if articleCell.idLabel.text!.lowercaseString.rangeOfString("orphans") != nil {
            articleCell.idLabel.text = "Literary Orphans"
            articleCell.fpdescriptionlabel.text = "Read this story and more on Literary Orphans →"
            articleCell.idLabel.backgroundColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 0.98)
            articleCell.idLabel.textColor = UIColor(red: 0.0/255.0, green: 0.0/183.0, blue: 0.0/255.0, alpha: 0.98)
            articleCell.fpdescriptionlabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.98)
            }
            
       
            
           if articleCell.idLabel.text == ""  {
            articleCell.idLabel.hidden = true
            articleCell.fpdescriptionlabel.textColor = UIColor(red: 235.0/255.0, green: 149.0/255.0, blue: 50.0/255.0, alpha: 0)

           }
            
     //       articleCell.categoryLabel.text = article.categories.first?.uppercaseString
            
            
            if let authorName = article.authorName {
                articleCell.authorLabel.text = (authorName == "") ? "" : "By \(authorName) "
            
            }
            
                   
            // Display article date
   //         let dateFormatter = NSDateFormatter()
   //        dateFormatter.dateFormat = "MMM dd HH:mm"
   //        articleCell.dateTimeLabel.text = dateFormatter.stringFromDate(article.publicationDate)
            
            // If the comment count is zero, hide the comment label
            if article.commentsCount != 0 {
                if articleCell.commentsCountLabel != nil {
                    articleCell.commentsCountLabel.text = String(article.commentsCount)
                }
            } else {
                if articleCell.commentsCountLabel != nil {
                    articleCell.commentsCountLabel.hidden = true
                    articleCell.commentsLabel.hidden = true
                }
            }
            
            // Article Description (Supported by Main_iPhone-2.storyboard and Main_iPad.storyboard
            if articleCell.descriptionLabel != nil {
                articleCell.descriptionLabel.text = article.description
            }

            // Load article image
            if let articleImageURL = article.headerImageURL {
                if articleImageURL != "" {
                    if self.storyboard!.valueForKey("name")! as! String == "Main_iPhone-2" {
                        if articleCell.imageViewConstraintHeight != nil {
                            articleCell.imageViewConstraintHeight.constant = 320.0
                        }
                        self.tableView.estimatedRowHeight = 357.0
                        
                    } else if self.storyboard!.valueForKey("name")! as! String == "Main_iPhone-2" {
                        if ConfigurationManager.displayMode() == "Image" {
                        articleCell.imageViewConstraintHeight.constant = 300.0
                        articleCell.imageViewConstraintWidth.constant = 450.0
                        } else if ConfigurationManager.displayMode() == "Text" {
                            articleCell.imageViewConstraintHeight.constant = 0.0
                            articleCell.imageViewConstraintWidth.constant = 0.0
                        } else if ConfigurationManager.displayMode() == "Text+Image" {

                            let isText = (indexPath.row % 2 == 0) ? true : false
                            if isText {
                                articleCell.imageViewConstraintHeight.constant = 0.0
                                articleCell.imageViewConstraintWidth.constant = 0.0
                            } else {
                                articleCell.imageViewConstraintHeight.constant = 320.0
                                articleCell.imageViewConstraintWidth.constant = 120.0
                            }
                            
                        }
                        self.tableView.estimatedRowHeight = 400.0
                        
                    } else if self.storyboard!.valueForKey("name")! as! String == "Main_iPad" {
                        if articleCell.imageViewConstraintHeight != nil {
                            articleCell.imageViewConstraintHeight.constant = 400.0
                            self.tableView.estimatedRowHeight = 500.0
                        }
                    }

                    // Download the article image
                    if self.storyboard!.valueForKey("name")! as! String == "Main_iPhone" ||
                        (self.storyboard!.valueForKey("name")! as! String == "Main_iPhone-2" && ConfigurationManager.displayMode() != "Text") || self.storyboard!.valueForKey("name")! as! String == "Main_iPad" {
                            articleCell.headerImageView.sd_setImageWithURL(NSURL(string: articleImageURL)) { (image: UIImage!, error: NSError!, cacheTYpe: SDImageCacheType, url: NSURL!) -> Void in
                                
                                // Sometimes, the default image is too small to display.
                                // In this case, we will hide the thumbnail
                                
                                if image == nil || image.size.width < 100
                                  {
                                    
                                    do {
                                        
                                        var random = arc4random_uniform(8)
                                        switch(random){
                                            
                                        case 0: articleCell.headerImageView.image = UIImage(named: "Books")
                                            break
                                            
                                            
                                        case 1: articleCell.headerImageView.image = UIImage(named: "cliffbook")
                                            break
                                            
                                        case 2: articleCell.headerImageView.image = UIImage (named: "Mountains")
                                            break
                                            
                                        case 3: articleCell.headerImageView.image = UIImage (named: "Typist")
                                            break
                                            
                                        case 4: articleCell.headerImageView.image = UIImage(named: "placehold7")
                                            break
                                            
                                        case 5: articleCell.headerImageView.image = UIImage(named: "placehold8")
                                            break
                                            
                                        case 6: articleCell.headerImageView.image = UIImage (named: "placehold10")
                                            break
                                            
                                        case 7: articleCell.headerImageView.image = UIImage (named: "moon")
                                            break
                                            
                                            
                                        default: articleCell.headerImageView.image = UIImage (named: "water")
                                        break;
                                            
                                            }
                                            
                                        }
                                    
                                    //try else
                                  if articleCell.imageViewConstraintWidth != nil {
                                    do {
                                        
                                        var random = arc4random_uniform(8)
                                        switch(random){
                                            
                                        case 0: articleCell.headerImageView.image = UIImage(named: "Books")
                                            break
                                        case 1: articleCell.headerImageView.image = UIImage(named: "cliffbook")
                                            break
                                        case 2: articleCell.headerImageView.image = UIImage (named: "Mountains")
                                            break
                                        case 3: articleCell.headerImageView.image = UIImage (named: "Typist")
                                            break
                                        case 4: articleCell.headerImageView.image = UIImage(named: "placehold7")
                                            break
                                        case 5: articleCell.headerImageView.image = UIImage(named: "placehold8")
                                            break
                                        case 6: articleCell.headerImageView.image = UIImage (named: "placehold10")
                                            break
                                        case 7: articleCell.headerImageView.image = UIImage (named: "threebooks")
                                            break
                                        default: articleCell.headerImageView.image = UIImage (named: "water")
                                        break;
                                            
                                        }
                                        
                                        }
                                    }
                                    
                                } else {
                                    articleCell.headerImageView.image = image
                                }
                            }
                    }
                }
                
                else
                
                
                {
                    // In case there is no image, we decrease the width/height constraint to zero
                    
                   if articleCell.headerImageView.image != nil {
                    do {
                        
                        var random = arc4random_uniform(8)
                        switch(random){
                            
                        case 0: articleCell.headerImageView.image = UIImage(named: "Books")
                            break
                        case 1: articleCell.headerImageView.image = UIImage(named: "cliffbook")
                            break
                        case 2: articleCell.headerImageView.image = UIImage (named: "Mountains")
                            break
                        case 3: articleCell.headerImageView.image = UIImage (named: "threebooks")
                            break
                        case 4: articleCell.headerImageView.image = UIImage(named: "Typist")
                            break
                        case 5: articleCell.headerImageView.image = UIImage(named: "placehold7")
                            break
                        case 6: articleCell.headerImageView.image = UIImage (named: "placehold10")
                            break
                        case 7: articleCell.headerImageView.image = UIImage (named: "placehold8")
                            break
                            
                        default: articleCell.headerImageView.image = UIImage (named: "water")
                        break;

                         
                        
                        }
                        
            
                        

                        
                        }
                    }
                    
                    //photo logo replacements
                    if articleCell.idLabel.text!.lowercaseString.rangeOfString("lithub") != nil {
                        articleCell.headerImageView.image = UIImage (named: "lithub" )
                    }
                    
                    if articleCell.idLabel.text!.lowercaseString.rangeOfString("mcsweeney") != nil {
                        articleCell.headerImageView.image = UIImage (named: "mcsweeney" )
                        
                   }
                    
                   if articleCell.idLabel.text!.lowercaseString.rangeOfString("electric") != nil {
                       articleCell.headerImageView.image = UIImage (named: "electriclit2" )
                        
                   }
                    
                    if articleCell.idLabel.text!.lowercaseString.rangeOfString("writersalmanac") != nil {
                        articleCell.headerImageView.image = UIImage (named: "Writersalmanac" )
                        
                    }
                    
                    if articleCell.idLabel.text!.lowercaseString.rangeOfString("theamericanscholar") != nil {
                        articleCell.headerImageView.image = UIImage (named: "scholar" )
                        
                    }
                    
                    if articleCell.idLabel.text!.lowercaseString.rangeOfString("atticus") != nil {
                        articleCell.headerImageView.image = UIImage (named: "AtticusReview" )
                        
                    }
                    
                    if articleCell.idLabel.text!.lowercaseString.rangeOfString("wordhaus") != nil {
                        articleCell.headerImageView.image = UIImage (named: "wordhaus2" )
                        
                    }
                    
                    if articleCell.idLabel.text!.lowercaseString.rangeOfString("guardian") != nil {
                        articleCell.headerImageView.image = UIImage (named: "Guardian" )
                        
                    }
                    
                  
                    
                    
   //                 if articleCell.imageViewConstraintWidth != nil {
       //                 do {
                    
      //                      var random = arc4random_uniform(5)
       //                     switch(random){
                    
       //                     case 0: articleCell.headerImageView.image = UIImage (named: "/Users/philjames/Downloads/TapestryFirstDraft/Third Iteration/RssReader/Images.xcassets/fab2.imageset/fab2.png")
         //                       break
                                
         //                   case 1: articleCell.headerImageView.image = UIImage (named: "/Users/philjames/Downloads/TapestryFirstDraft/Third Iteration/RssReader/Images.xcassets/fab2.imageset/fab2.png")
            //                    break
                                
           //                 case 2: articleCell.headerImageView.image = UIImage (named: "/Users/philjames/Downloads/TapestryFirstDraft/Third Iteration/RssReader/Images.xcassets/fab2.imageset/fab2.png")
             //                   break
                                
            //                case 3: articleCell.headerImageView.image = UIImage (named: "/Users/philjames/Downloads/TapestryFirstDraft/Third Iteration/RssReader/Images.xcassets/fab2.imageset/fab2.png")
             //                   break
                        
            //                default: articleCell.headerImageView.image = UIImage (named: "/Users/philjames/Downloads/TapestryFirstDraft/Third Iteration/RssReader/Images.xcassets/fab2.imageset/fab2.png")
          //                      break;
        //                    }
                        
         //               }
        //            }
                    self.tableView.estimatedRowHeight = 130.0
                }
            } else {
                    articleCell.headerImageView.image = nil
            }
            
        

        })
    }()
    
    
    // Dropdown Menu Configuration
    lazy var navigationMenu: REMenu = {
        var dropdownMenu = REMenu()
        dropdownMenu.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        dropdownMenu.separatorColor = UIColor.clearColor()
        dropdownMenu.highlightedBackgroundColor = UIColor.blackColor()
        dropdownMenu.highlightedSeparatorColor = UIColor.whiteColor()
        dropdownMenu.borderColor = UIColor.clearColor()
        dropdownMenu.textColor = UIColor.whiteColor()
        dropdownMenu.highlightedTextColor = UIColor.whiteColor()
        dropdownMenu.font = UIFont(name: ConfigurationManager.defaultBarFont(), size: 10.5)
        dropdownMenu.separatorHeight = 0

        // Uncomment if you want to use live blur
        /*
        dropdownMenu.liveBlur = true
        dropdownMenu.liveBlurTintColor = UIColor.blackColor()
        */
        
        return dropdownMenu
    }()
    
    // Feed URLs - Configure via ReaderConf.plist
    var feedsURLs: [[String: String]] = ConfigurationManager.sharedConfigurationManager().feeds
    
    lazy var feedsMenuItems: [DropdownMenuItem] = {
        var feedsItems = [DropdownMenuItem]()
        
        for feed in self.feedsURLs {
            let title = feed["name"]
            let url = feed["url"]
            
            var item = DropdownMenuItem(title: title, image: UIImage(), highlightedImage: UIImage(), action: { [unowned self] (item: REMenuItem!) -> Void in
                let _item = item as! DropdownMenuItem
                let urlPath = _item.url?.relativePath
                self.currentFeeds = (title: item.title, url: urlPath!)
            })
            item.url = NSURL(fileURLWithPath: url!)
            feedsItems.append(item);
        }

        return feedsItems
    }()
    
    lazy var service: FeedsService? = {
        return FeedsService()
    }()
    
    // MARK: - ViewController overrides
    override func viewDidLoad() {
        super.viewDidLoad();
        
        
        // Get the first feed in the list
        currentFeeds = (title: feedsURLs[0]["name"]!, url: feedsURLs[0]["url"]!)
        
        
        // Configure title label/dropdown menu depending on your settings
        if ConfigurationManager.isDropdownMenuEnabled() {
            navigationItem.titleView = navigationHeaderButton;
            navigationHeaderButton.titleLabel?.font = UIFont(name: ConfigurationManager.defaultBarFont(), size: 26.0)
            switch ConfigurationManager.defaultTheme() {
                case "dark":
                    navigationHeaderButton.tintColor = UIColor.whiteColor()
                case "light":
                    navigationHeaderButton.tintColor = UIColor(red: 166.0/255.0, green: 37.0/255.0, blue: 15.0/255.0, alpha: 1.0)
                default: break
            }
            
        } else {
            navigationHeaderLabel = UILabel(frame: CGRectMake(0, 0, 200, 40))
            navigationHeaderLabel?.text = feedsURLs[0]["name"]!
            navigationHeaderLabel?.textAlignment = .Center
            navigationHeaderLabel?.font = UIFont(name: ConfigurationManager.defaultBarFont(), size: 17.0)
            

            switch ConfigurationManager.defaultTheme() {
                case "dark":
                    navigationHeaderLabel?.textColor = UIColor.whiteColor()
                case "light":
                    navigationHeaderLabel?.textColor = UIColor(red: 166.0/255.0, green: 37.0/255.0, blue: 15.0/255.0, alpha: 1.0)
                default: break
            }
            
            navigationItem.titleView = navigationHeaderLabel
        }
        
        //make the category label on the home page the url
        
        
        // Configure the slide-out menu
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            revealViewController().draggableBorderWidth = view.frame.width
            revealViewController().rearViewRevealWidth = view.frame.width * 0.7
            navigationController?.navigationBar.addGestureRecognizer(revealViewController().panGestureRecognizer())
            view.addGestureRecognizer(revealViewController().panGestureRecognizer())
            view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
        }
        
        // Pull-to-refresh
        refreshControl = UIRefreshControl()
        switch ConfigurationManager.defaultTheme() {
            case "dark":
                refreshControl?.backgroundColor = UIColor.blackColor()
                refreshControl?.tintColor = UIColor.whiteColor()
            case "light":
                refreshControl?.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 215.0/255.0, alpha: 1.0)
                refreshControl?.tintColor = UIColor.whiteColor()
            default:
                break
        }
        
        

        
        refreshControl?.addTarget(self, action: "refreshTableView", forControlEvents: UIControlEvents.ValueChanged)
        
        // Add dropdown menu to navigation bar
        navigationHeaderButton?.setTitle(feedsURLs[0]["name"]! + " ▾", forState: UIControlState.Normal);
        navigationMenu.items = feedsMenuItems
        navigationHeaderButton?.hidden = !ConfigurationManager.isDropdownMenuEnabled()

        // Define table view delegate
        tableView.dataSource = self.dataSource
        
        // Enable Ad (depending on the settings)
        canDisplayBannerAds = ConfigurationManager.isHomeScreenAdsEnabled()

        // Enable self sizing cells
        self.tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    override func viewDidAppear(animated: Bool) {
        // Make sure the navigation bar is not hidden
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Button handlers
    @IBAction func navigationHeaderButtonDidPressed(sender: UIButton) {
        if !navigationMenu.isOpen {
            navigationMenu.showFromNavigationController(self.navigationController);
        } else {
            navigationMenu.close()
        }
    }
    
    @IBAction func sideMenuButtonDidpressed(sender: UIBarButtonItem) {
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            revealViewController().revealToggleAnimated(true)
        }
    }
    
    // MARK: - Table reload handlers
    func loadTableView(url: String!, title: String?) {
        self.service?.getFeedsWithURL(url, completion: { [unowned self] (articles) -> () in
            // Table rows to delete
            let countOfCurrentArticles = self.dataSource?.articles.count
            var indexPathsToDelete = [NSIndexPath]()
            for _index in 0..<countOfCurrentArticles! {
                indexPathsToDelete.append(NSIndexPath(forRow: _index, inSection: 0))
            }

            // Table rows to insert
            var indexPathsToInsert = [NSIndexPath]()
            for row in 0..<articles.count {
                indexPathsToInsert.append(NSIndexPath(forRow: row, inSection: 0))
            }
            
            // Update the table view to display the articles
            if indexPathsToInsert.count > 0 {
                self.dataSource?.articles = articles
                self.tableView.beginUpdates()
                self.tableView.deleteRowsAtIndexPaths(indexPathsToDelete, withRowAnimation: .None)
                self.tableView.insertRowsAtIndexPaths(indexPathsToInsert, withRowAnimation: .None)
                self.tableView.endUpdates()
            }
            
            // Scroll to the top of the table view
            self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            
            
            // Hide refreshing control
            if let isRefreshing = self.refreshControl?.refreshing {
                if isRefreshing {
                    NSOperationQueue.mainQueue().addOperationWithBlock({
                        self.refreshControl?.endRefreshing()
                    })
                }
            }
            
            // let headerButton = self.navigationHeaderButton!
            if let menuTitle = title {
                self.navigationHeaderButton?.setTitle(menuTitle + " ▾", forState: UIControlState.Normal)
                self.navigationHeaderLabel?.text = menuTitle
            }

        }) { (error: NSError) -> (Void) in
            print("Error: \(error.localizedDescription)", terminator: "")
            
            // Display alert
            let alertController = UIAlertController(title: "Download Error", message: "Failed to retrieve articles from \(title!). Please try again later.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            alertController.addAction(okAction)
            self.presentViewController(alertController, animated: true, completion: nil)

            // Hide refreshing control
            if let isRefreshing = self.refreshControl?.refreshing {
                if isRefreshing {
                    NSOperationQueue.mainQueue().addOperationWithBlock({
                        self.refreshControl?.endRefreshing()
                    })
                }
            }
        }
    }
    
    // Action method when the user triggers a refresh
    func refreshStatusDidChange() {
        refreshTableView()
    }
    
    // Reload the table data from the selected feed
    func refreshTableView() {
        // Update last-update date
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let currentDateTime = dateFormatter.stringFromDate(NSDate())
        refreshControl?.attributedTitle = NSAttributedString(string: "Last Updated: \(currentDateTime)", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        loadTableView(currentFeeds?.url, title: currentFeeds?.title)
    }

    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController:DetailArticleViewController
                destinationViewController = segue.destinationViewController as! DetailArticleViewController
                destinationViewController.article = dataSource?[indexPath.row] // selectedArticle
                
                // Use custom transition animator for Main_iPhone-2.storyboard
                if self.storyboard!.valueForKey("name")! as! String == "Main_iPhone-2" {
                    UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Slide)
                    destinationViewController.transitioningDelegate = slideUpTransitionAnimator
                }
            }
          
            
            
        }
    }
    

    @IBAction func ShareButton(sender: AnyObject) {
        
        
        let textToShare = "[Via Tapestry on iOS]"
        
        if let myWebsite = NSURL(string: "http://www.codingexplorer.com/") {
            let objectsToShare = [textToShare, myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
    }


    @IBAction func unwindToFeedScreen(segue: UIStoryboardSegue) {
        if UIApplication.sharedApplication().statusBarHidden {
            UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.Slide)
        }
    }


}