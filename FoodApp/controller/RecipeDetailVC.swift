//
//  RecipeDetailVCViewController.swift
//  ImagesProject
//
//  Created by Ahmed Ragab on 1/13/20.
//  Copyright © 2020 Ahmed Ragab. All rights reserved.
//

import UIKit

class RecipeDetailVC: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var inestraction: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    var selectedRecipes:Recipe!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImage.image=UIImage(named: selectedRecipes.imageName)
        detailTitle.text=selectedRecipes.title
        inestraction.text = selectedRecipes.instructions
    }
    
    
}
