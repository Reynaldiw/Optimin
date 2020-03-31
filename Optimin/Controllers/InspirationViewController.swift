//
//  InspirationViewController.swift
//  Optimin
//
//  Created by Reynaldi Wijaya on 30/03/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class InspirationViewController: UIViewController {

    @IBOutlet weak var inspirationTableView: UITableView!
    
    var stories: [Story] = [Story]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0...5 {
            let story = Story(posterStory: "exampleList", titleStory: "Lorem Ipsum", overviewStory: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book")
            
            stories.append(story)
        }
        
        setupTableView()
    }
    
    func setupTableView() {
        self.inspirationTableView.separatorColor = UIColor.clear
        self.inspirationTableView.rowHeight = UITableView.automaticDimension
        self.inspirationTableView.estimatedRowHeight = 100
        self.inspirationTableView.register(UINib(nibName: "StoryCell", bundle: nil), forCellReuseIdentifier: "StoryCell")
       }
    
}

extension InspirationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryCell
        
        cell.configure(story: stories[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
