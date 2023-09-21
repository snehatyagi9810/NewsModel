//
//  MyTableViewCell.swift
//  Quantum IT Project
//
//  Created by Sneh on 02/09/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myImageView: UIImageView!

    @IBOutlet weak var authorLabel: UILabel!

    @IBOutlet weak var dateLabel: UILabel!


    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myView.layer.cornerRadius = 10
        myImageView.layer.cornerRadius = 10
    }

  
    
    func configureData(article:Article){
        myImageView.image = nil
        authorLabel.text = article.author
        titleLabel.text = article.title
        if let url = URL(string: article.urlToImage ?? ""){
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
