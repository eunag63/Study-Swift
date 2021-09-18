//
//  ViewController2.swift
//  prTab
//
//  Created by 김은아 on 2021/09/08.
//

import UIKit

class ViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else {
             return UITableViewCell()
         }
         cell.labelTitle.text = memoTitle[indexPath.row]
         cell.labelContent.text = memoContent[indexPath.row]
         return cell
    }
    
    //cell 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 400.0
     }
    
    let memoTitle = ["싸다 싸, 가성비 값!", "럭셔리한 리모델링", "처음만 어렵다, 리모델링 시작해보기"]
    let memoContent = ["500 만 원", "5,000 만원", "1,500만원"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class CustomCell: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    @IBOutlet weak var labelImg: UIImageView!
}
