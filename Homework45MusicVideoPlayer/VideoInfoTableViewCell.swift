//
//  VideoInfoTableViewCell.swift
//  Homework45MusicVideoPlayer
//
//  Created by 黃柏嘉 on 2021/12/23.
//

import UIKit

class VideoInfoTableViewCell: UITableViewCell {
    //title
    @IBOutlet weak var titleImage: UIImageView!
    //musicVideoInfo
    @IBOutlet weak var jayChouImage: UIImageView!
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoDurationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
