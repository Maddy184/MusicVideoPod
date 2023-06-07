//
//  ViewController.swift
//  Video Player
//
//  Created by Madesh on 06/04/23.
//

import UIKit
import AVKit
import CoreData


class MyTabBarController: UITabBarController,UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstViewController = UINavigationController(rootViewController: AudioViewController())//AudioViewController()
        let layout = UICollectionViewFlowLayout()
        let Vc = PhotoCollectionViewController(collectionViewLayout: layout)
        Vc.collectionView!.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "dataCell")
        let secondViewController = UINavigationController(rootViewController: Vc)
        firstViewController.navigationItem.title = "Music"
        firstViewController.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName:"music.note.list"), tag: 0)
        firstViewController.view.backgroundColor = .black
        secondViewController.tabBarItem = UITabBarItem(title: "Album", image: UIImage(systemName: "photo"), tag: 1)
        self.viewControllers = [firstViewController,secondViewController]
        view.backgroundColor = .red
//        createFolder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .yellow
    }
//    func createFolder() {
//        let fileManager = FileManager.default
//        
//        // Get the URL for the app's documents directory
//        guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
//            // Failed to get documents directory
//            return
//        }
//        
//        // Create a new folder URL within the documents directory
//        let folderName = "MyAppFolder"
//        let folderURL = documentsURL.appendingPathComponent(folderName)
//        
//        do {
//            // Check if the folder already exists
//            if !fileManager.fileExists(atPath: folderURL.path) {
//                // Create the folder
//                try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
//                
//                // Folder created successfully
//                print("Folder created at: \(folderURL.path)")
//            } else {
//                // Folder already exists
//                print("Folder already exists at: \(folderURL.path)")
//            }
//        } catch {
//            // Error occurred while creating the folder
//            print("Error creating folder: \(error.localizedDescription)")
//        }
//    }

    
}
//class musicPlayerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    
//    var myTableView: UITableView  =   UITableView()
//    var itemsToLoad: [String] = ["One", "Two", "Three"]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        self.myTableView.dataSource = self
//        self.myTableView.delegate = self
//        view.backgroundColor = .gray
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        myTableView.frame = view.bounds
//        myTableView.dataSource = self
//        myTableView.delegate = self
//        myTableView.register(tableViewCell.self, forCellReuseIdentifier: "myCell")
//        self.view.addSubview(myTableView)
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        return itemsToLoad.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:tableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! tableViewCell
//        //        cell.textLabel?.text = self.itemsToLoad[indexPath.row]
//        cell.musicName.text = itemsToLoad[indexPath.row]
//        return cell
//    }
//}
//
// Creating a TableViewCell for TableView

class tableViewCell:UITableViewCell{
    
    let musicName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(musicName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
