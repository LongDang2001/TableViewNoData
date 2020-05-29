

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var noDataView: UIView!
    @IBOutlet weak var fooderData: UIView!
    
    var hasNoData: Bool = false {
        didSet { // gan gia tri
            if hasNoData == true {
                myTableView.tableFooterView = noDataView
            } else {
                myTableView.tableFooterView = fooderData
            }
        }
    }
   
    var arrayNameAnimal: [String] = ["cho","meo","ga","vit","ngan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNameAnimal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath)
        cell.textLabel?.text = arrayNameAnimal[indexPath.row]
        return cell
    }
    // goi ham xoa ra
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayNameAnimal.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .automatic)
            hasNoData = arrayNameAnimal.count == 0
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        hasNoData = arrayNameAnimal.count == 0
    }
    
}

