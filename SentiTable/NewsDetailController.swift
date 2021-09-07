//
//  NewsDetailController.swift
//  SentiTable
//
//  Created by 김은아 on 2021/09/07.
//

import UIKit

class NewsDetailController: UIViewController {
    
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    //1. 이미지 주소
    //2. 본문 보내주기
    
    var imageUrl: String?
    var desc: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //값이 있으면 셋팅
        if let img = imageUrl{
            //이미지를 가져와서 보여주기
            //data
            if let data = try? Data(contentsOf: URL(string: img)!) {
                //Main Thread
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
            }
        }
        if let d = desc {
            //본문 보여주기
            self.LabelMain.text = d
        }
    }
}
