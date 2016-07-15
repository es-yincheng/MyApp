//
//  HomeViewController.m
//  MyApp
//
//  Created by 尹成 on 16/7/6.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "HomeViewController.h"
#import "QRcodeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)scanQRAction:(id)sender {
    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=WIFI"]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Bundle identifier"]];
//    
//    About — prefs:root=General&path=About
//    
//    Accessibility — prefs:root=General&path=ACCESSIBILITY
//    
//    AirplaneModeOn— prefs:root=AIRPLANE_MODE
//    
//    Auto-Lock — prefs:root=General&path=AUTOLOCK
//    
//    Brightness — prefs:root=Brightness
//    
//    Bluetooth — prefs:root=General&path=Bluetooth
//    
//    Date& Time — prefs:root=General&path=DATE_AND_TIME
//    
//    FaceTime — prefs:root=FACETIME
//    
//    General— prefs:root=General
//    
//    Keyboard — prefs:root=General&path=Keyboard
//    
//    iCloud — prefs:root=CASTLE  iCloud
//    
//    Storage & Backup — prefs:root=CASTLE&path=STORAGE_AND_BACKUP
//    
//    International — prefs:root=General&path=INTERNATIONAL
//    
//    Location Services — prefs:root=LOCATION_SERVICES
//    
//    Music — prefs:root=MUSIC
//    
//    Music Equalizer — prefs:root=MUSIC&path=EQ
//    
//    Music VolumeLimit— prefs:root=MUSIC&path=VolumeLimit
//    
//    Network — prefs:root=General&path=Network
//    
//    Nike + iPod — prefs:root=NIKE_PLUS_IPOD
//    
//    Notes — prefs:root=NOTES
//    
//    Notification — prefs:root=NOTIFICATIONS_ID
//    
//    Phone — prefs:root=Phone
//    
//    Photos — prefs:root=Photos
//    
//    Profile — prefs:root=General&path=ManagedConfigurationList
//    
//    Reset — prefs:root=General&path=Reset
//    
//    Safari — prefs:root=Safari  Siri — prefs:root=General&path=Assistant
//    
//    Sounds — prefs:root=Sounds
//    
//    SoftwareUpdate— prefs:root=General&path=SOFTWARE_UPDATE_LINK
//    
//    Store — prefs:root=STORE
//    
//    Twitter — prefs:root=TWITTER
//    
//    Usage — prefs:root=General&path=USAGE
//    
//    VPN — prefs:root=General&path=Network/VPN  
//    
//    Wallpaper — prefs:root=Wallpaper  
//    
//    Wi-Fi — prefs:root=WIFI
//    
//    Setting—prefs:root=INTERNET_TETHERING
    
    
    
//    QRcodeViewController *vc = [[QRcodeViewController alloc] init];
//    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:vc];
//    [self.navigationController presentViewController:nv animated:YES completion:nil];
}

@end
