//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Sam Hiatt  on 10/6/21.
//

import UIKit

class AthleteFormViewController: UIViewController {
    var athlete: Athlete?
    init?(coder: NSCoder, athlete: Athlete?) {
           self.athlete = athlete
           super.init(coder: coder)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    func updateView() {
        
    }
    
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
