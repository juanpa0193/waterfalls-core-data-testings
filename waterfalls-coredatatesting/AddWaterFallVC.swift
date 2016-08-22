//
//  AddWaterFallVC.swift
//  waterfalls-coredatatesting
//
//  Created by JuanPa Villa on 7/19/16.
//  Copyright © 2016 JuanPa Villa. All rights reserved.
//

import UIKit
import CoreData

class AddWaterFallVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var waterfallTitle: UITextField!
    @IBOutlet weak var waterfallLocation: UITextField!
    @IBOutlet weak var waterfallDescription: UITextField!
    @IBOutlet weak var waterfallImage: UIImageView!
    @IBOutlet weak var addImgBttn: UIButton!
    
    
    var imagePicker: UIImagePickerController!
    

    override func viewDidLoad() {
        super.viewDidLoad()


        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        waterfallImage.layer.cornerRadius = 4.0
        waterfallImage.clipsToBounds = true
    
    }


    @IBAction func addImgBttnPressd(sender: UIButton) {
        addImgBttn.titleLabel?.text = ""
        presentViewController(imagePicker, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func createWaterfallBttnPressd(sender: AnyObject) {
        
        if let title = waterfallTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Waterfalls", inManagedObjectContext: context)
            let waterfall = Waterfalls(entity: entity!, insertIntoManagedObjectContext: context)
            waterfall.title = waterfallTitle.text
            waterfall.location = waterfallLocation.text
            waterfall.waterfallDescription = waterfallDescription.text
            waterfall.setWaterfallImage(waterfallImage.image!)
            
            //Below we save, remember context is the scratch pad. It is not saved until we call .save()
            
            context.insertObject(waterfall)
            
            //We create a do try just in case our saving fails
            
            do {
                try context.save()
            } catch {
                print("Could not save")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
        
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        waterfallImage.image = image
        
    }
    
    

    

}
