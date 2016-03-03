/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class MasterViewController: UITableViewController {
  
  // MARK: - Properties
  var detailViewController: DetailViewController? = nil
  var candies = [Candy]()
  var filteredCandies = [Candy]()
  let searchController = UISearchController(searchResultsController: nil)
  
  // MARK: - View Setup
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup the Search Controller
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    definesPresentationContext = true
    searchController.dimsBackgroundDuringPresentation = false
    
    // Setup the Scope Bar
    searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
    tableView.tableHeaderView = searchController.searchBar
    
    candies = [
        Candy(category:"Short Fiction & Poetry", name:"The American Reader"),
        Candy(category:"Short Fiction & Poetry", name:"American Short Fiction"),
        Candy(category:"Short Fiction & Poetry", name:"The Anthill"),
        Candy(category:"Short Fiction & Poetry", name:"Atticus Review"),
        Candy(category:"Short Fiction & Poetry", name:"Augury Books"),
        Candy(category:"Short Fiction & Poetry", name:"Autumn Sky Daily Poetry"),
        Candy(category:"Short Fiction & Poetry", name:"Blue Mesa Review"),
        Candy(category:"Short Fiction & Poetry", name:"Buenos Aires Review"),
        Candy(category:"Short Fiction & Poetry", name:"Carve Magazine"),
        Candy(category:"Short Fiction & Poetry", name:"Chelsea Station"),
        Candy(category:"Short Fiction & Poetry", name:"CrazyHorse"),
        Candy(category:"Short Fiction & Poetry", name:"Dead Mule"),
        Candy(category:"Short Fiction & Poetry", name:"Echolocation Mag"),
        Candy(category:"Short Fiction & Poetry", name:"Eighteen Bridges"),
        Candy(category:"Short Fiction & Poetry", name:"Electric Literature"),
        Candy(category:"Short Fiction & Poetry", name:"Escape Pod"),
        Candy(category:"Short Fiction & Poetry", name:"Feather Tale"),
        Candy(category:"Short Fiction & Poetry", name:"Fiction Southeast"),
        Candy(category:"Short Fiction & Poetry", name:"Geist"),
        Candy(category:"Short Fiction & Poetry", name:"Hayden's Ferry"),
        Candy(category:"Short Fiction & Poetry", name:"Hazlitt"),
        Candy(category:"Short Fiction & Poetry", name:"The Hudson Review"),
        Candy(category:"Short Fiction & Poetry", name:"The Idaho Review"),
        Candy(category:"Short Fiction & Poetry", name:"The Journal of Bison Jack"),
        Candy(category:"Short Fiction & Poetry", name:"Lithub"),
        Candy(category:"Short Fiction & Poetry", name:"Made-Up Words"),
        Candy(category:"Short Fiction & Poetry", name:"McSweeney's"),
        Candy(category:"Short Fiction & Poetry", name:"Michigan Quarterly Review"),
        Candy(category:"Short Fiction & Poetry", name:"Necessary Fiction"),
        Candy(category:"Short Fiction & Poetry", name:"The New Yorker"),
        Candy(category:"Short Fiction & Poetry", name:"The Offing"),
        Candy(category:"Short Fiction & Poetry", name:"The Paris Review"),
        Candy(category:"Short Fiction & Poetry", name:"PEN"),
        Candy(category:"Short Fiction & Poetry", name:"Poetic Entanglement"),
        Candy(category:"Short Fiction & Poetry", name:"Poetry is Dead"),
        Candy(category:"Short Fiction & Poetry", name:"Public Books"),
        Candy(category:"Short Fiction & Poetry", name:"Purple Passion Press"),
        Candy(category:"Short Fiction & Poetry", name:"Quaint Magazine"),
        Candy(category:"Short Fiction & Poetry", name:"The Rusty Toque"),
        Candy(category:"Short Fiction & Poetry", name:"Queen Mobs"),
        Candy(category:"Short Fiction & Poetry", name:"Shenandoah"),
        Candy(category:"Short Fiction & Poetry", name:"Short Fiction Break"),
        Candy(category:"Short Fiction & Poetry", name:"Sun Magazine"),
        Candy(category:"Short Fiction & Poetry", name:"3am Magazine"),
        
        Candy(category:"Short Fiction & Poetry", name:"Tor"),
        Candy(category:"Short Fiction & Poetry", name:"Triquarterly"),
        Candy(category:"Short Fiction & Poetry", name:"The Walrus"),
        
        Candy(category:"Short Fiction & Poetry", name:"Witness"),
        Candy(category:"Short Fiction & Poetry", name:"Wordhaus"),
        Candy(category:"Short Fiction & Poetry", name:"Words Without Borderds"),
        Candy(category:"Short Fiction & Poetry", name:"Writer's Almanac"),
        
        //nonfic
        
        Candy(category:"Nonfiction", name:"The American Scholar"),
        Candy(category:"Nonfiction", name:"The Barking"),
        Candy(category:"Nonfiction", name:"The Awl"),
        Candy(category:"Nonfiction", name:"Believer Magazine"),
        Candy(category:"Nonfiction", name:"Brain Pickings"),
        Candy(category:"Nonfiction", name:"Conversational Reading"),
        Candy(category:"Nonfiction", name:"Full Stop"),
        Candy(category:"Nonfiction", name:"GUTS Magazine"),
        Candy(category:"Nonfiction", name:"Harper's"),
        Candy(category:"Nonfiction", name:"The Moth"),
        Candy(category:"Nonfiction", name:"The Kenyon Review"),
        Candy(category:"Nonfiction", name:"Narrative Magazine"),
        Candy(category:"Nonfiction", name:"The New Yorker"),
        Candy(category:"Nonfiction", name:"The Virginia Quarterly Review"),
        
        //news&Reviews
        
        Candy(category:"News and Reviews", name:"Book Riot"),
        Candy(category:"News and Reviews", name:"Ecotone"),
        Candy(category:"News and Reviews", name:"Electric Literature"),
        Candy(category:"News and Reviews", name:"Flavorwire"),
        Candy(category:"News and Reviews", name:"Galleycat"),
        Candy(category:"News and Reviews", name:"Globe and Mail Books"),
        Candy(category:"News and Reviews", name:"Kirkus Reviews"),
        Candy(category:"News and Reviews", name:"LA Times Books"),
        Candy(category:"News and Reviews", name:"LitHub"),
        Candy(category:"News and Reviews", name:"London Review of Books"),
        Candy(category:"News and Reviews", name:"The Millions"),
        Candy(category:"News and Reviews", name:"New York Review of Books"),
        Candy(category:"News and Reviews", name:"New York Times Books"),
        Candy(category:"News and Reviews", name:"NPR Books"),
        Candy(category:"News and Reviews", name:"Omnivoracious"),
        Candy(category:"News and Reviews", name:"Toronto Star Books"),
        Candy(category:"News and Reviews", name:"Zyzzyva"),
        
    ]

    
    if let splitViewController = splitViewController {
      let controllers = splitViewController.viewControllers
      detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }
  }
  
  override func viewWillAppear(animated: Bool) {
 //   clearsSelectionOnViewWillAppear = splitViewController!.collapsed
    super.viewWillAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table View
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searchController.active && searchController.searchBar.text != "" {
      return filteredCandies.count
    }
    return candies.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    let candy: Candy
    if searchController.active && searchController.searchBar.text != "" {
      candy = filteredCandies[indexPath.row]
    } else {
      candy = candies[indexPath.row]
    }
    cell.textLabel!.text = candy.name
    cell.detailTextLabel!.text = candy.category
    return cell
  }
  
  func filterContentForSearchText(searchText: String, scope: String = "All") {
    filteredCandies = candies.filter({( candy : Candy) -> Bool in
      let categoryMatch = (scope == "All") || (candy.category == scope)
      return categoryMatch && candy.name.lowercaseString.containsString(searchText.lowercaseString)
    })
    tableView.reloadData()
  }
  
  // MARK: - Segues
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDetail" {
      if let indexPath = tableView.indexPathForSelectedRow {
        let candy: Candy
        if searchController.active && searchController.searchBar.text != "" {
          candy = filteredCandies[indexPath.row]
        } else {
          candy = candies[indexPath.row]
        }
        let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
        controller.detailCandy = candy
        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }
  
}

extension MasterViewController: UISearchBarDelegate {
  // MARK: - UISearchBar Delegate
  func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
  }
}

extension MasterViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResultsForSearchController(searchController: UISearchController) {
    let searchBar = searchController.searchBar
    let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
    filterContentForSearchText(searchController.searchBar.text!, scope: scope)
  }
}