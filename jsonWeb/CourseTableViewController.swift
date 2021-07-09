//
//  CourseTableViewController.swift
//  jsonWeb
//
//  Created by Nana Adwoa Odeibea Amoah on 7/8/21.
//

import UIKit

class CourseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getCourses()
        
    }
    
    //Function that hits API for info
    func getCourses(){
        //Creating URL object
        if let url = URL(string: "https://zappycode.com/api/courses") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) {(data, response, error) in
                //When we've got a response from URL
                if error != nil {
                    print("There was an error")
                } else if data != nil{
                    print(String(data: data!, encoding: .utf8))
                }
                
            }.resume()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
