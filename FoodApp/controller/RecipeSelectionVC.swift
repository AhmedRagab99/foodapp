//
//  RecipeSelection.swift
//  ImagesProject
//
//  Created by Ahmed Ragab on 1/13/20.
//  Copyright © 2020 Ahmed Ragab. All rights reserved.
//

import UIKit

class RecipeSelectionVc: UIViewController,UICollectionViewDataSource
,UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedRecipe:String?
    var data=DataSet()
    var recipes:[Recipe]!
    var detailrecipes:Recipe!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource=self
        collectionView.delegate=self
        recipes=data.getRecipes(forCategoryTitle:selectedRecipe!)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipe", for: indexPath) as? RecipeCell{
            cell.configureCell(recipe: recipes[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.bounds.width)/2-15, height: (view.bounds.width)/2-15)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailrecipes = recipes[indexPath.item]
        
        performSegue(withIdentifier:"recipeDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVc = segue.destination as? RecipeDetailVC{
            detailVc.selectedRecipes = detailrecipes
        }
    }
    
    
    
}
