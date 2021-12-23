//
//  MusicVideoTableViewController.swift
//  Homework45MusicVideoPlayer
//
//  Created by 黃柏嘉 on 2021/12/23.
//

import UIKit
import AVKit

class MusicVideoTableViewController: UITableViewController {
    
    //定義兩個Cell的名稱
    struct PropertyKeys{
        static let titleCellIdentifier = "titleCell"
        static let videoCellIdentifier = "videoCell"
    }
    
    //生成我們的資料
    let musicVideoInfoData = VideoInfoData()
    //紀錄使用者點選的cell
    var videoIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    //傳遞資料
    @IBSegueAction func passVideoData(_ coder: NSCoder) -> AVPlayerViewController? {
        let controller = AVPlayerViewController(coder: coder)
        let selectVideo = musicVideoInfoData.videoInfoDataArray[videoIndex].videoName
        let url = Bundle.main.url(forResource: selectVideo, withExtension: ".mp4")
        controller?.player = AVPlayer(url: url!)
        controller?.player?.play()
        return controller
    }
    
    
    //TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return musicVideoInfoData.videoInfoDataArray.count+1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
           let titleCell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.titleCellIdentifier, for: indexPath) as! VideoInfoTableViewCell
            titleCell.titleImage.image = UIImage(named: "周杰倫")
            return titleCell
        }else{
            let videoCell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.videoCellIdentifier, for: indexPath) as! VideoInfoTableViewCell
            videoCell.jayChouImage.image = UIImage(named: "周杰倫logo")
            videoCell.videoTitleLabel.text = musicVideoInfoData.videoInfoDataArray[indexPath.row-1].videoTitle
            videoCell.videoDurationLabel.text = musicVideoInfoData.videoInfoDataArray[indexPath.row-1].videoDuration
            videoCell.videoImageView.image = UIImage(named: musicVideoInfoData.videoInfoDataArray[indexPath.row-1].videoImageName)
            return videoCell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 60
        }else{
            return 300
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        videoIndex = indexPath.row-1
        performSegue(withIdentifier: "playVideo", sender: nil)
    }
}
