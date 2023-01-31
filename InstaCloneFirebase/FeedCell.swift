//
//  FeedCell.swift
//  InstaCloneFirebase
//
//  Created by Burak Afyonlu on 31.01.2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import FirebaseAnalytics
import FirebaseInstallations
import FirebaseAuthInterop
import FirebaseCoreInternal
import FirebaseCoreExtension
import FirebaseAppCheckInterop
import FirebaseFirestore
import SDWebImage

class FeedCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var documentIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
    }

    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let firestoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            
            let fireLikeStore = ["likes" : likeCount + 1] as [String : Any]
            
            firestoreDatabase.collection("Posts").document(documentIDLabel.text!).setData(fireLikeStore, merge: true)
            
        }
    }
    
}
