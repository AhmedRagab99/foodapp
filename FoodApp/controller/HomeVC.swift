//

import UIKit

class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    let data = DataSet()
    var categorySelected:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell{
            cell.configureCell(category: data.categories[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height/3
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categorySelected=data.categories[indexPath.row].title
        performSegue(withIdentifier:"RecipeSelection", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let  recipeVc = segue.destination as?  RecipeSelectionVc{
            recipeVc.selectedRecipe = categorySelected
        }
    }
    
}


