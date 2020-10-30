//
//  ViewController.swift
//  DiffableDatasourcedCompositionalLayout
//
//  Created by Kevin Vishal Saldanha on 18/09/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet private weak var usersCollectionView: UICollectionView!
        
    enum Section {
        case main
    }
    
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section,User>
    typealias DataSource = UICollectionViewDiffableDataSource<Section, User>
    
    private var dataSource : DataSource!
    private var snapShot : DataSourceSnapshot!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureCollectionView()
        configureDatasource()
        fetchUsers()
    }
    
    //MARK: Get Users
    //You can have this fetch from Server too
    private func fetchUsers() -> Void {
        let user1 = User(name: "Kevin", address: "Karnataka")
        let user2 = User(name: "Vishal", address: "Goa")
        let user3 = User(name: "Avinash", address: "Assam")
        let user4 = User(name: "Manoj", address: "Pune")
        let user5 = User(name: "Sreejit", address: "Kerala")
        let user6 = User(name: "Randhir", address: "Patna")
        applySnapshot([user1,user2,user3,user4,user5, user6])
    }
    
    //MARK: Compositional Layout Setup
    
    private func configureCollectionView() -> Void {
        //you can register you CollectionViewCell, If at all you are refrencing them from separate Xib.
        self.usersCollectionView.collectionViewLayout = configureCompositionalLayout()
    }
    
    private func configureCompositionalLayout() -> UICollectionViewLayout {
        
        //Uncomment the following to make a UITableView kind of layout
//        let compositionalLyout : UICollectionViewCompositionalLayout  = {
//            let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
//            return UICollectionViewCompositionalLayout.list(using: configuration)
//        }()
        
        let compositionalLyout : UICollectionViewCompositionalLayout = {
            
            //Here We have Section , This Section embeds a group and this group embeds items
            //Our idea here is used to have 3 items in a row. So we use fraction(full width divded by 3)
            let fraction : CGFloat = 1/3
            let inset : CGFloat = 2.5
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: inset, leading: inset, bottom: inset, trailing: inset)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: inset, leading: inset, bottom: inset, trailing: inset)
            return UICollectionViewCompositionalLayout(section: section)
        }()
        return compositionalLyout
    }
    
    //MARK: DataSource
    private func configureDatasource() -> Void {
        dataSource = DataSource(collectionView: usersCollectionView) { (collectionView, indexPath, user) -> UsersCollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCollectionViewCell.reuseIdentifier, for: indexPath) as? UsersCollectionViewCell else { return nil}
            cell.nameLabel.text = user.name
            cell.addressLabel.text = user.address
            return cell
        }
    }
    
    //MARK: Snapshot
    func applySnapshot(_ users : [User]) -> Void {
        snapShot = DataSourceSnapshot()
        snapShot.appendSections([Section.main])
        snapShot.appendItems(users)
        dataSource.apply(snapShot, animatingDifferences: false)
    }
}
