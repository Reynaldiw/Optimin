//
//  StoryCell.swift
//  Optimin
//
//  Created by Reynaldi Wijaya on 30/03/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class StoryCell: UITableViewCell {

    @IBOutlet weak var backgroundCardView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    @IBOutlet weak var storyImageView: UIImageView!
    
    func configure(story: Story) {
        self.storyImageView.image = UIImage(named: story.posterStory!)
        self.labelTitle.text = story.titleStory
        self.labelOverview.text = story.overviewStory
    }
    
    
}
