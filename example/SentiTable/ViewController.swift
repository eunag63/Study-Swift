//
//  ViewController.swift
//  SentiTable
//
//  Created by 김은아 on 2021/09/05.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //1. http 통신 방법 - urlsession
    //2. JSON 데이터 형태 {"돈":"100"} {["100","500","1000"]}
    //3. 테이블뷰의 데이터 매칭!! + 통보, 그리기
    var newsData :Array<Dictionary<String, Any>>?
    
    
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=16d3bddc346a4f638ee1f70ef47a09eb")!) { (data, response, error) in
            //어떠한 정보를 http 통신을 하면 아래 코드로 json 데이터가 들어옴
            if let dataJson = data {
                //json으로 변환
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    
                    //dictionary
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    self.newsData = articles
                    
                    //그리기
                    DispatchQueue.main.async {
                        self.TableViewMain.reloadData()
                    }
                    
                    //반복문으로 타이틀 다 가져오기
//                    for (idx, value) in articles.enumerated() {
//                        if let v = value as? Dictionary<String, Any> {
//                            print("\(v["title"])")
//                            v["description"]
//                        }
//
//                    }
                }
                catch{}
                
            }
        }
        
        task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //데이터 몇개 숫자
        
        //뉴스의 숫자로 바꾸기
        if let news = newsData {
            return news.count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //데이터 무엇 반복?
        //1. 임의의 셀 만들기 : 연습
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
//        cell.textLabel?.text = "\(indexPath.row)"
        
        //2.스토리보드 + id : 실전
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        let idx = indexPath.row
        if let news = newsData{
            
            let row = news[idx]
            if let r = row as? Dictionary<String, Any> {
                if let title = r["title"] as? String{
                    cell.LabelText.text = title
                }
            }
        }
        
        
        
        return cell
    }
    
   
    
    //3-1. 클릭시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click!! \(indexPath.row)")
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "NewsDetailController") as! NewsDetailController
        
        if let news = newsData {
            let row = news[indexPath.row]
            if let r = row as? Dictionary<String, Any> {
                if let imageUrl = r["urlToImage"] as? String{
                    controller.imageUrl = imageUrl
                }
                if let desc = r["description"] as? String{
                    controller.desc = desc
                }
            }
        }
        //이동! - 수동
//        showDetailViewController(controller, sender: nil)
        
    }
    //3-2. 세그웨이 : 부모(가나다)-자식(가나다)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "NewsDetail" == id {
            if let controller = segue.destination as? NewsDetailController {
                
                if let news = newsData {
                    if let indexPath = TableViewMain.indexPathForSelectedRow{
                        let row = news[indexPath.row]
                        if let r = row as? Dictionary<String, Any> {
                            if let imageUrl = r["urlToImage"] as? String{
                                controller.imageUrl = imageUrl
                            }
                            if let desc = r["description"] as? String{
                                controller.desc = desc
                            }
                            
                        }
                    }
                }
            }
        }
        //이동! - 자동
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //함수 호출
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
        
    }
    
    
    //tableview 테이블로 된 뷰 = 여러개이 행이 모여있는 목록 뷰(화면)
    //깔끔하게 보여주기 위해서 사용
    //전화번호부에 대표적으로 쓰임
    
    //1.데이터 무엇인지 -> 전화번호부 목록
    //2. 데이터가 몇개인지 -> 100, 1000 등
    //3. 옵션 - 데이터 행 눌렀다! -> 클릭
    
    @IBOutlet weak var TableViewMain: UITableView!
    
}

