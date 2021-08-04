//
// 
// Project: RSSchool_T9
// 
// Author: Mikhail Skuratov
// On: 1.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SPColorsViewController.h"
#import "UIColor+SPColors.h"

@interface SPColorsViewController ()
@property (strong, nonatomic)NSArray *namesAndColors;


@end

@implementation SPColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    
    
    self.tabelView = [[UITableView alloc] init];
    [self.tabelView registerClass:UITableViewCell.class forCellReuseIdentifier:@"CellId"];
    [self.view addSubview:self.tabelView];
    self.tabelView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tabelView.layer.cornerRadius = 16;
    
    [NSLayoutConstraint activateConstraints:@[
    [self.tabelView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:35],
    [self.tabelView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
    [self.tabelView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20],
    [self.tabelView.heightAnchor constraintEqualToConstant:572]
    ]];
    [self.tabelView setScrollEnabled:NO];
    self.tabelView.dataSource = self;
    self.tabelView.delegate = self;
    
    NSArray *colors = [[NSArray alloc]initWithObjects:
                   [UIColor hexBE2813Color],
                   [UIColor hex3802DAColor],
                   [UIColor hex467C24Color],
                   [UIColor hex808080Color],
                   [UIColor hex8E5AF7Color],
                   [UIColor hexF07F5AColor],
                   [UIColor hexF3AF22Color],
                   [UIColor hex3DACF7Color],
                   [UIColor hexE87AA4Color],
                   [UIColor hex0F2E3FColor],
                   [UIColor hex213711Color],
                   [UIColor hex511307Color],
                   [UIColor hex92003BColor]
                   , nil];
    
    NSArray *namesColors = [[NSArray alloc]initWithObjects:
                            @"#BE2813",
                            @"#3802DA",
                            @"#467C24",
                            @"#808080",
                            @"#8E5AF7",
                            @"#F07F5A",
                            @"#F3AF22",
                            @"#3DACF7",
                            @"#E87AA4",
                            @"#0F2E3F",
                            @"#213711",
                            @"#511307",
                            @"#92003B"
                            , nil];
    
    self.namesAndColors = [[NSArray alloc] initWithObjects:namesColors, colors, nil];
    
    
    
}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellId"];
    NSArray *namesColors = [[NSArray alloc] initWithArray:self.namesAndColors[0]];
    cell.textLabel.text = namesColors[indexPath.row];
    NSArray *colors = [[NSArray alloc] initWithArray:self.namesAndColors[1]];
    cell.textLabel.textColor = colors[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 13;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *checkColor = [[NSString alloc] initWithFormat:@"%ld", (long)indexPath.row];
   
    [[NSUserDefaults standardUserDefaults]setObject:checkColor forKey:@"checkColor"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
        objectForKey:@"checkColor"];
    NSLog(@"%@", savedValue);
    [self.tabelView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}




@end
