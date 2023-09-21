//
//  ViewController.swift
//  Quantum IT Project
//
//  Created by Sneh on 02/09/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.configureData(article: news[indexPath.row])
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let data = news[indexPath.row]
        goToDetailScreen(article: data)
    }

    @IBOutlet weak var myTableView: UITableView!
    var news: [Article] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getnews()
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.layer.cornerRadius = 10
        
    }


    func getnews() {
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&language=en&apiKey=42e89487730947399b8fe71075e7efbf")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if  let error = error {
                print (error.localizedDescription)
                return
                
            }
            
            if let data = data {
                print(data.prettyPrintedJSONString)
            let decoder =  JSONDecoder()
                do{
                    let model = try decoder.decode(newsModel.self, from: data)
                    print(model)
                    self.news = model.articles
                    DispatchQueue.main.async {
                        self.myTableView.reloadData()
                    }
                }catch let error{
                    print(error)
                }
                
            }
        }.resume()
        
    }
    
    
    func goToDetailScreen(article: Article) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.aricle = article
     //   vc.sty
//        self.navigationController?.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }

}


extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}


