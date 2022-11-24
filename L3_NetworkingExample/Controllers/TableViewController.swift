//
//  TableViewController.swift
//  L3_NetworkingExample
//
//  Created by lera on 07.11.2022.
//

import UIKit



class TableViewController: UIViewController, UITableViewDelegate {
    var searchRecipes: RecipesQueryResponse?
    let apiAlamofire = ApiAlamofire()
   // let apiSession = ApiSesson()
    
    @IBAction func SearchRecipes(_ sender: Any) {
        searchDishRecipes()
    }
    
    @IBOutlet private weak var SearchBar: UISearchBar!
    @IBOutlet weak var dishTable: UITableView!
    var searchText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchBar.delegate = self
        dishTable.keyboardDismissMode = .onDrag
        setupTable()
    }
    func setupTable(){
        dishTable.delegate = self
        dishTable.dataSource = self
      
    }
    func searchDishRecipes(){
        Task {
            let data = try? await apiAlamofire.searchRecipes(text: searchText)
            if let data = data {
                print(data)
                searchRecipes = data
                dishTable.reloadData()
            } else {
                print("Error!")
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController,
            let index = dishTable.indexPathForSelectedRow?.row
        {
            destination.dish = (searchRecipes?.results[index])!
        }
    }
 
    

}
extension TableViewController: UITableViewDataSource, UISearchBarDelegate, UIPopoverPresentationControllerDelegate, SearchCellDelegate{
    
    func guessNutrition(_ sender: Any, of title: String) {
        let button = sender as? UIButton
        let popoverContentController = self.storyboard?.instantiateViewController(withIdentifier: "NutritionController") as? NutritionViewController
        popoverContentController?.modalPresentationStyle = .popover

        if let popoverPresentationController = popoverContentController?.popoverPresentationController {
           popoverPresentationController.permittedArrowDirections = .up
            popoverPresentationController.sourceView = button
           popoverPresentationController.delegate = self
           if let popoverController = popoverContentController {
               popoverController.dishTitle = title
               present(popoverController, animated: true)
           }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if(searchRecipes != nil){
           return searchRecipes!.results.count
       }
       else{
           return 0
       }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(searchRecipes != nil){
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as! TableViewCell
        cell.config(from: (searchRecipes?.results[indexPath.row])!)
        cell.delegate = self
       
        return cell
    }
    
}
