//
//  EncuestaTableTableViewController.swift
//  Registro_Comunitario
//
//  Created by Tatiana Castro on 12/1/18.
//  Copyright © 2018 Tatiana Castro. All rights reserved.
//

import UIKit

struct Headline{
    var id : Int
    var title : String
}


class EncuestaTableTableViewController: UITableViewController {
    
    var headlines = [
        Headline(id: 1, title: "Encuesta 1"),
        Headline(id: 2, title: "Encuesta 2"),
        Headline(id: 3, title: "Encuesta 3"),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        cell.textLabel?.text = headlines[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Encuestas"
    }

}
