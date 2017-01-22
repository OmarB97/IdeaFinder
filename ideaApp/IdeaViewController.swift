//
//  IdeaViewController.swift
//  ideaApp
//
//  Created by Omar Baradei on 1/21/17.
//  Copyright © 2017 Omar Baradei. All rights reserved.
//

import UIKit

class IdeaViewController: UITableViewController {

    var categoryTitle: String!
    var mainJSON: JSON!
    var hotIdeas: [[String: Any]]?
    var points: [Int]?
    
    @IBAction func ideaDownVote(_ sender: Any) {
    }
    @IBAction func ideaUpVote(_ sender: Any) {
    }
    @IBAction func returnToCategories(_ sender: Any) {
        performSegue(withIdentifier: "backToChooseSegue", sender: self)
    }
    @IBAction func createNewIdea(_ sender: Any) {
        performSegue(withIdentifier: "newIdeaSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = categoryTitle
        let url = URL(string: "https://obscure-lowlands-65041.herokuapp.com/ideas/\(categoryTitle.lowercased())")
        if let data = try? Data(contentsOf: url!) {
            let json = JSON(data: data)
            mainJSON = json
            for dictionary in mainJSON.array! {
                let likes = dictionary["likes"]
                let id = dictionary["id"]
                let category = dictionary["category"]
                let text = dictionary["text"]
                let obj = ["likes": likes, "id": id, "category": category, "text": text]
                hotIdeas?.append(obj)
            }
            //print(mainJSON)
        }
        
    }
    
//    func httpGetRequest(for address: String) {
//        let url = URL(string: address)
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            if error != nil {
//                print(error)
//            } else {
//                do {
//                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String: Any]]
//                    let firstDictionary = parsedData[0]
//                    
//                    print(firstDictionary)
//                    
//                    let food = firstDictionary["category"] as! String
//                    print(food)
//                } catch let error as NSError {
//                    print(error)
//                }
//            }
//        }.resume()
//    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func showDataError() {
        let ac = UIAlertController(title: "Loading error", message: "Data is empty.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainJSON.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(mainJSON)
        let cell = tableView.dequeueReusableCell(withIdentifier: "hot0", for: indexPath)
        let idea = mainJSON?.arrayValue[indexPath.item]
        let title = cell.contentView.viewWithTag(1) as! UILabel
        title.text = idea?.dictionaryObject?["text"] as? String
        
        let likes = cell.contentView.viewWithTag(4) as! UILabel
        likes.text = idea?.dictionaryObject?["likes"] as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
