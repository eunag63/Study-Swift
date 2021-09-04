//
//  ViewController.swift
//  SentiTable
//
//  Created by 김은아 on 2021/09/05.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //데이터 몇개 숫자
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //데이터 무엇 반복?
        //1. 임의의 셀 만들기 : 연습
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
//        cell.textLabel?.text = "\(indexPath.row)"
        
        //2.스토리보드 + id : 실전
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        cell.LabelText.text = "\(indexPath.row)"
        
        return cell
    }
    
    //3. 클릭시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click!! \(indexPath.row)")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
    }
    
    //tableview 테이블로 된 뷰 = 여러개이 행이 모여있는 목록 뷰(화면)
    //깔끔하게 보여주기 위해서 사용
    //전화번호부에 대표적으로 쓰임
    
    //1.데이터 무엇인지 -> 전화번호부 목록
    //2. 데이터가 몇개인지 -> 100, 1000 등
    //3. 옵션 - 데이터 행 눌렀다! -> 클릭
    
    @IBOutlet weak var TableViewMain: UITableView!
    
}

