//
//  ViewController.swift
//  TechPod
//
//  Created by 所　紀彦 on 2016/05/19.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit
import AVFoundation

//UITableViewDataSource(データソース)メソッドを使うための「プロトコル宣言」を行う。
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    //曲名の配列
    var songNameArray = [String]()
    
    //曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    
    //音楽家の画像名を入れるための配列
    var imageNameArray = [String]()
    
    //音楽を再生させるための変数
    var audioPlayer : AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        table.dataSource = self
        
        //UITableが持っているデリゲートメソッドの処理の委託先をViewController.swiftに設定
        table.delegate = self
        
        //SongArrayに曲名を入れていく。
        songNameArray = ["旅の途中","Brave_Shine","Pick Me Up?"]
        
        //fileNamearrayに曲のファイル名を入れていく
        fileNameArray = ["tabinototyu","brave shine","pick me up?"]
        
        //imageArrayに音楽家の画像を入れていく
        imageNameArray = ["img.jpg","imgaa.jpg","kjimg.jpg"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数を指定。
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    //ID付きのセルを取得、textLabelに「テスト」と表示させてみる。
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!  as  UITableViewCell
            
        cell.textLabel?.text = songNameArray[indexPath.row]
        
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell
        }
    
    //セルが押された時に呼ばれるデリゲートメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%@が選ばれました。", songNameArray[indexPath.row])
        
        //音楽ファイルの設定
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[indexPath.row], ofType:  "mp3")!)
        
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOfURL: audioPath)
        
        //音楽を再生
        audioPlayer.play()
        
    }
}
