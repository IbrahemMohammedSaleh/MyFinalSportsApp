//
//  FavouriteTableViewController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import UIKit
import Network


class FavouriteTableViewController: UITableViewController{

    var leagueList = [StableTable]()
    @IBOutlet var favTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        favTableView.dataSource = self
        favTableView.delegate  = self


    }

    override func viewDidAppear(_ animated: Bool) {


    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leagueList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as! FavouriteTableViewCell
        cell.layer.cornerRadius = 20

        

                
        return cell
    }

    @IBAction func clearBtnPressed(_ sender: Any) {
//    let alert = UIAlertController(title: "Removing Alert", message: "Remove all leagues from favourite list?", preferredStyle: .alert)
//               alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
//                if (self.favItems!.isEmpty == false){
//                    for item in self.favItems! {
//                        self.favPresenter?.deleteItem(item: item)
//                    }
//                    self.favItems?.removeAll()
//                    self.tableView.reloadData()
//
//                }
//
//                   print("deleted")
//               }))
//               alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//               self.present(alert, animated: true, completion: nil)
    }
}
 
extension FavouriteTableViewController {
func showalert(){
    let alert = UIAlertController(title: "Alert", message: "You are Not connect to Network ", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
    
    }
}

// MARK: - Func check network
extension FavouriteTableViewController {
    
    
    func monitorNetwork(){
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async { [self] in
                    print("internet Connected")
                    favTableView.reloadData()
                    
                }
            } else {
                DispatchQueue.main.async { [self] in
                showalert()
                    favTableView.reloadData()
                }
            }
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
    }
}
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.alpha = 0
//        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
//        cell.layer.transform = transform
//        UITableView.animate(withDuration: 1.0) {
//            cell.alpha = 1
//            cell.layer.transform = CATransform3DIdentity
//        }
//    }
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            let alert = UIAlertController(title: "Removing Alert", message: "Remove \"\(favItems?[indexPath.row].strLeague ?? "empty")\" from favourite leagues list?", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
//                self.favPresenter?.deleteItem(item: self.favItems?[indexPath.row])
//                self.favItems?.remove(at:indexPath.row)
//                self.tableView.deleteRows(at: [indexPath], with: .fade)
//                if self.favItems?.isEmpty ?? true{
//
//                    self.tableView.backgroundView?.addSubview (UIImageView(image: UIImage(named: "empty.png")))
//
//                }
//                print("deleted")
//            }))
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

     }
    */
