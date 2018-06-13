//
//  ViewController.swift
//  techPod
//
//  Created by 大林拓実 on 2018/06/13.
//  Copyright © 2018年 TakumiObayashi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //StoryBoardで使うTableViewの宣言
    @IBOutlet var table: UITableView!
    
    //曲名の配列
    var songNameArray: [String] = [String]()
    
    //曲名ファイルの配列
    var fileNameArray: [String] = []
    
    //音楽家画像の配列
    var imageNameArray: [String] = []
    
    //音楽再生のための変数
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //データソースメソッドの実装はこのクラス
        table.dataSource = self
        //デリゲートメソッドの実装はこのクラス
        table.delegate = self
        
        //songNameArrayに曲名を入れていく
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        
        //fileNameArrayにファイル名を入れていく
        fileNameArray = ["cannon", "elise", "aria"]
        
        //imageNameArryaに画像名を入れる
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数の設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //songNameArrayの数
        return songNameArray.count
    }
    
    //ID付きのセルを取得して，セル付属のtextlabelに表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //曲名表示
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        //音楽家画像表示
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
    }
    
    //セルが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました")
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //音楽を再生
        audioPlayer.play()
    }


}

