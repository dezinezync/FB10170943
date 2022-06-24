//
//  TextViewController.swift
//  UIFindInteractionDemo
//
//  Created by Nikhil Nigade on 24/06/22.
//

import UIKit

final class TextViewController: UIViewController {
  
  let textView = UITextView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    view.backgroundColor = .systemBackground
    
    title = "Article"
    
    setupTextView()
    setupNavBar()
  }
  
  private func setupTextView() {
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.isEditable = false
    textView.font = .preferredFont(forTextStyle: .body)
    textView.textColor = .label
    textView.isFindInteractionEnabled = true
    
    view.addSubview(textView)
    NSLayoutConstraint.activate([
      textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
    
    guard let path = Bundle.main.path(forResource: "lipsum", ofType: "txt"),
          let data = try? Data(contentsOf: URL(filePath: path)),
          let text = String(data: data, encoding: .utf8) else {
      textView.text = "Failed to load text from App bundle"
      return
    }
    
    textView.text = text
    // scroll to top
    textView.scrollRangeToVisible(NSMakeRange(0, 1))
  }
  
  private func setupNavBar() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch(_:)))
  }
  
  // MARK: Actions
  @objc func didTapSearch(_ sender: Any?) {
    guard let findInteraction = textView.findInteraction else {
      return
    }
    
    if findInteraction.isFindNavigatorVisible {
      findInteraction.dismissFindNavigator()
    }
    else {
      findInteraction.presentFindNavigator(showingReplace: false)
    }
  }
}
