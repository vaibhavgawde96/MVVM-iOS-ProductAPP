//
//  AllCategoriesViewController.swift
//  Product
//
//  Created by Vaibhav Gawde on 13/06/23.
//

import UIKit

class AllCategoriesViewController: UIViewController {
    
    
    var serviceCall = ServiceCall()
    @IBOutlet weak var categoriesPicker: UIPickerView!
    var categories = [String]()
    var selectedCategories = [ProductResponse]()
    var comingFrom: String?
    var categoryVM = GetCategoriesVM()
    
    
    @IBOutlet weak var categoriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
    
    }
    
   
    
}

extension AllCategoriesViewController {
    
    func configuration(){
        
     
        categoriesPicker.delegate = self
        categoriesPicker.dataSource = self
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        comingFrom = "Category"
        
        categoriesTableView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
        
        initViewModel()
        observeEvent()
        
    }
    
    func initViewModel(){
        categoryVM.fetchCategories()
    }
    
  
    func observeEvent(){
        
        categoryVM.eventHandler = {
            [weak self] events in
            guard let self else{
                return
            }
            
            switch events {
                
            case .loading:
                print("Loading")
            case .stopLoading:
                print("Stop Loading")
            case .dataLoaded:
                self.categories = self.categoryVM.categoriesList
                DispatchQueue.main.async {
                    self.categoriesPicker.reloadAllComponents()
                }
            case .error(let error):
                print(error)
            }
            
        }
        
    }
    
    
    func getCategoryObserver(){
        
        categoryVM.eventHandler = {
            [weak self] events in
            guard let self else{
                return
            }
            
            switch events {
                
            case .loading:
                print("Loading")
            case .stopLoading:
                print("Stop Loading")
            case .dataLoaded:
                self.selectedCategories = self.categoryVM.productList
                DispatchQueue.main.async {
                    self.categoriesTableView.reloadData()
                }
            case .error(_):
                print("Stop Loading")
            }
        }
    }
}

//MARK: - Picker Methods


extension AllCategoriesViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        comingFrom = "SelectedCategory"
        categoryVM.fetchProductsByCategories(categorie: categories[row])
        getCategoryObserver()
        print(categories[row])
    }
    
    
    
    
}

//MARK: - TableView Methods
extension AllCategoriesViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
        
        cell.categoryID.text = String(selectedCategories[indexPath.row].id)
        cell.categoryPrice.text = String(selectedCategories[indexPath.row].price)
        cell.categoryTitle.text = selectedCategories[indexPath.row].title
        
        return cell
    }
    
    
    func getSelectedCategoryData(category: String){
        serviceCall.getURl(methodName: "SelectedCategories", subCategory: category)
        serviceCall.apiCall()
        
    }
    
    
}
