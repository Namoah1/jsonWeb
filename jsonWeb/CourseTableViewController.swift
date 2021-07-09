//
//  CourseTableViewController.swift
//  jsonWeb
//
//  Created by Nana Adwoa Odeibea Amoah on 7/8/21.
//

import UIKit

class CourseTableViewController: UITableViewController {
    
    var courses: [Course] = []

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
                    if let coursesFromAPI = try? JSONDecoder().decode([Course].self, from: data!){
                        
                        //To run the code on the main thread as soon as it's possbile
                        DispatchQueue.main.async {
                            self.courses = coursesFromAPI
                            self.tableView.reloadData() //self needed because inside closure
                        }
                       
                    }
                    
                }
                
            }.resume()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath)
        let course = courses[indexPath.row]
        
        cell.textLabel?.text = course.title
        return cell
    }


}
