//
//  ViewController.swift
//  UIFindInteractionDemo
//
//  Created by Nikhil Nigade on 24/06/22.
//

import UIKit

final class ViewController: UITableViewController {
  
  let cellIdentifier = "cell"

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.title = "UIFindInteraction Demo"
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    
    var config = UIListContentConfiguration.cell()
    config.text = "Article \(indexPath.row + 1)"
    
    cell.accessoryType = .disclosureIndicator
    cell.contentConfiguration = config
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let textVC = TextViewController()
    navigationController?.pushViewController(textVC, animated: true)
  }
}

