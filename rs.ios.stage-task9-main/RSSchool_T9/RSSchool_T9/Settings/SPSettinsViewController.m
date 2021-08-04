//
// 
// Project: RSSchool_T9
// 
// Author: Mikhail Skuratov
// On: 1.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SPSettinsViewController.h"
#import "SPStrokeColorTableViewCell.h"
#import "SPColorsViewController.h"
#import "UIColor+SPColors.h"

@interface SPSettinsViewController ()


@property(strong, nonatomic)UISwitch *checkImage;
@end

@implementation SPSettinsViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Settings"];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1]];
    
    self.tabelView = [[UITableView alloc] init];
    [self.tabelView registerClass:UITableViewCell.class forCellReuseIdentifier:@"CellId"];
    [self.view addSubview:self.tabelView];
    self.tabelView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tabelView.layer.cornerRadius = 16;
    
    [NSLayoutConstraint activateConstraints:@[
    [self.tabelView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:35],
    [self.tabelView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
    [self.tabelView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20],
    [self.tabelView.heightAnchor constraintEqualToConstant:104]
    ]];
    [self.tabelView setScrollEnabled:NO];
    self.tabelView.dataSource = self;
    self.tabelView.delegate = self;
    
    
    
    
    
    
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"timerCheck"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
   
//    self.navigationItem.hidesBackButton = YES;
//        UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(back:)];
//        self.navigationItem.leftBarButtonItem = newBackButton;
    
}
//
//
//- (void) back:(UIBarButtonItem *)sender {
//    NSLog(@"work");
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    cell = [[SPStrokeColorTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellId"];
    
    if (indexPath.row == 0){
        cell.textLabel.text = @"Draw stories";
        
        self.checkImage = [[UISwitch alloc] init];
        self.checkImage.on = YES;
        [self.checkImage addTarget:self action:@selector(changeSwicher) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = self.checkImage;
        
    } else {
        
        cell.textLabel.text = @"Stroke color";
        
        
        cell.detailTextLabel.text = @"#f3af22";
        cell.detailTextLabel.textColor = [UIColor hexF3AF22Color];
        
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//
    }
    return cell;
}

- (void)changeSwicher{
    
    if (self.checkImage.on){
        [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"timerCheck"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"timerCheck"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tabelView deselectRowAtIndexPath:indexPath animated:YES];
    SPColorsViewController *colorsViewControler = [[SPColorsViewController alloc] init];
    
    
    [self.navigationController pushViewController:colorsViewControler animated:YES];
    

}





@end
