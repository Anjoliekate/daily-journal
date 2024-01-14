//
//  ItemsViewController.swift
//  project_one
//
//  Created by Anjolie Kate Cummins on 10/27/23.
//
import UIKit

class ItemsViewController: UITableViewController {
    //
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: Any) {
        // Create a new item and add it to the store
        let newItem = itemStore.createItem()

        // Figure out where that item is in the array
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return itemStore.allItems.count
        }
    
        override func tableView(_ tableView: UITableView,
                                cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",
                                                         for: indexPath) as! ItemCell

            let item = itemStore.allItems[indexPath.row]
    
            cell.thoughtLabel.text = item.thought
            cell.promptLabel.text = item.prompt
            cell.datelabel.text = dateFormatter.string(from: item.date)
            cell.questionLabel.text = item.question
            return cell
        }
    
        override func tableView(_ tableView: UITableView,
                                commit editingStyle: UITableViewCell.EditingStyle,
                                forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let item = itemStore.allItems[indexPath.row]
                    itemStore.removeItem(item)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    
        override func tableView(_ tableView: UITableView,
                                moveRowAt sourceIndexPath: IndexPath,
                                to destinationIndexPath: IndexPath) {
            itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.rowHeight = UITableView.automaticDimension
            navigationItem.leftBarButtonItem = editButtonItem
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showItem" {
            if let row = tableView.indexPathForSelectedRow? .row{
                let item = itemStore.allItems[row]
                let detailViewCont = segue.destination as! DetailViewController
                detailViewCont.item = item
            }
        } else if segue.identifier == "addEntry" {
            let newItem = itemStore.createUniqueItem()

            // Figure out where that item is in the array
            if let index = itemStore.allItems.firstIndex(of: newItem) {
                let indexPath = IndexPath(row: index, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
                
                let detailViewCont = segue.destination as! DetailViewController
                detailViewCont.item = newItem
            }
        }
    }
}
