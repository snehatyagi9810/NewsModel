//
//  DetailViewController.swift
//  Quantum IT Project
//
//  Created by Sneh on 03/09/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var aricle: Article?
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = aricle?.title
        descriptionLabel.text = aricle?.description
        authorLabel.text = aricle?.author
        if let url = URL(string: aricle?.urlToImage ?? ""){
            DispatchQueue.global().async {
                do{
                    let data = try Data(contentsOf: url)
                    let img = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.myImageView.image = img
                    }
                    
                }catch{
                    
                    
                    
                    
                    
                }
            }
        }
    }
}
