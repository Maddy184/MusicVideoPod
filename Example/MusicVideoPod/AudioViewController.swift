//
//  AudioViewController.swift
//  Video Player
//
//  Created by Madesh on 10/04/23.
//

import UIKit
import CoreData
import AVFoundation
import MusicVideoPod

class AudioViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    // Insialize the Music asset and Audio Player
    
    var audioplayer = AVAudioPlayer()
    var musicone = String()
    var count = 0
    var tableView:UITableView = UITableView()
    var musicFile : [URL] = []
    
    override func viewDidLoad() {
        loadMusicFromFileManager()
        print(musicFile.count)
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.register(UINib(nibName: "MusicCellVC", bundle: nil), forCellReuseIdentifier: "MusicCell")
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        self.view.addSubview(tableView)
        self.navigationItem.title = "Music"
        tabBarController?.tabBar.isHidden = false
        //        loadMusicFromFileManager()
    }
    func loadMusicFromFileManager() {
        let fileManager = FileManager.default
        //        print(fileManager)
        guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
//                        print(documentsURL)
        else {
            return print("Statement not excecuted ")
        }
        do {
            print(documentsURL)
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            let audioFileExtensions = ["mp3", "m4a"]
            musicFile = fileURLs.filter { audioFileExtensions.contains($0.pathExtension.lowercased())
            }
            
            // Refresh the collection view
            tableView.reloadData()
        } catch {
            print("Error while enumerating files: \(error.localizedDescription)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicFile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCellVC
        //        cell.MusicTitle.text = self.music[indexPath.row]
        //        cell.MusicTitle.text = musicFile[indexPath.row]
        let mus = musicFile[indexPath.row]
        let mi = mus.deletingPathExtension()
        cell.MusicTitle.text = mi.lastPathComponent
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let mc = MusicPlayerViewController()
        let musicLabelName = musicFile[indexPath.row]
        let mi = musicLabelName.deletingPathExtension()
        mc.musiclabel = mi.deletingPathExtension()
        mc.musicName = musicFile[indexPath.row]
        mc.audioFiles = musicFile
        mc.currentIndex = indexPath.row
        self.navigationController?.pushViewController(mc, animated: true)
//        mc.imageView.image = UIImage(named: "Image")
    }
    
}



