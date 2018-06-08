//
//  ListViewTableViewCell.h
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewTableViewCell : UITableViewCell
@property(nonatomic,strong) IBOutlet UILabel * lblName, *lblDate, *lblTags;
@end
