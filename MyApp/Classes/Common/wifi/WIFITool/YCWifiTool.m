//
//  YCWifiTool.m
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "YCWifiTool.h"
#import "SimplePing.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <arpa/inet.h>
#import <netinet/in.h>
#import <ifaddrs.h>

@interface YCWifiTool()<SimplePingDelegate>

@property (nonatomic, strong) SimplePing *pinger;

@end

@implementation YCWifiTool

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)pingHostName:(NSString *)hostName{
    SimplePing *pinger = [[SimplePing alloc] initWithHostName:hostName];
    self.pinger = pinger;
    pinger.delegate = self;
    pinger.addressStyle = SimplePingAddressStyleICMPv4;
    [pinger start];
}


//获取WiFi 信息，返回的字典中包含了WiFi的名称、路由器的Mac地址、还有一个Data(转换成字符串打印出来是wifi名称)
- (NSDictionary *)getWiFiInfo{
    NSArray *ifs = (__bridge_transfer NSArray *)CNCopySupportedInterfaces();
    if (!ifs) {
        return nil;
    }
    NSDictionary *info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer NSDictionary *)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) { break; }
    }
    return info;
}


//网关信息
//- (NSString *)getGatewayIpForCurrentWiFi {
//    
//    NSString *address = @"error";
//    struct ifaddrs *interfaces = NULL;
//    struct ifaddrs *temp_addr = NULL;
//    int success = 0;
//    
//    // retrieve the current interfaces - returns 0 on success
//    success = getifaddrs(&interfaces);
//    if (success == 0) {
//        // Loop through linked list of interfaces
//        temp_addr = interfaces;
//        //*/
//        while(temp_addr != NULL) {
//            /*/
//             int i=255;
//             while((i--)>0)
//             //*/
//            if(temp_addr->ifa_addr->sa_family == AF_INET) {
//                // Check if interface is en0 which is the wifi connection on the iPhone
//                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
//                {
//                    // Get NSString from C String //ifa_addr
//                    //ifa->ifa_dstaddr is the broadcast address, which explains the "255's"
//                    //                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_dstaddr)->sin_addr)];
//                    
//                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
//                    
//                    //routerIP----192.168.1.255 广播地址
//                    NSLog(@"broadcast address--%@",[NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_dstaddr)->sin_addr)]);
//                    //--192.168.1.106 本机地址
//                    NSLog(@"local device ip--%@",[NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)]);
//                    //--255.255.255.0 子网掩码地址
//                    NSLog(@"netmask--%@",[NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_netmask)->sin_addr)]);
//                    //--en0 端口地址
//                    NSLog(@"interface--%@",[NSString stringWithUTF8String:temp_addr->ifa_name]);
//                    
//                }
//            }
//            
//            temp_addr = temp_addr->ifa_next;
//        }
//    }
//    
//    // Free memory
//    freeifaddrs(interfaces);
//    
//    in_addr_t i = inet_addr([address cStringUsingEncoding:NSUTF8StringEncoding]);
//    in_addr_t* x = &i;
//    
//    unsigned char *s = getdefaultgateway(x);
//    NSString *ip=[NSString stringWithFormat:@"%d.%d.%d.%d",s[0],s[1],s[2],s[3]];
//    free(s);
//    return ip;
//}


//本机ip
- (NSString *)getLocalIPAddressForCurrentWiFi
{
    NSString *address = nil;
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    return address;
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
        freeifaddrs(interfaces);
    }
    return nil;
}


//同样的方式也可以获取广播地址、子网掩码、端口等，组装成一个字典。
- (NSMutableDictionary *)getLocalInfoForCurrentWiFi {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        //*/
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    //----192.168.1.255 广播地址
                    NSString *broadcast = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_dstaddr)->sin_addr)];
                    if (broadcast) {
                        [dict setObject:broadcast forKey:@"broadcast"];
                    }
                    NSLog(@"broadcast address--%@",broadcast);
                    //--192.168.1.106 本机地址
                    NSString *localIp = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    if (localIp) {
                        [dict setObject:localIp forKey:@"localIp"];
                    }
                    NSLog(@"local device ip--%@",localIp);
                    //--255.255.255.0 子网掩码地址
                    NSString *netmask = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_netmask)->sin_addr)];
                    if (netmask) {
                        [dict setObject:netmask forKey:@"netmask"];
                    }
                    NSLog(@"netmask--%@",netmask);
                    //--en0 端口地址
                    NSString *interface = [NSString stringWithUTF8String:temp_addr->ifa_name];
                    if (interface) {
                        [dict setObject:interface forKey:@"interface"];
                    }
                    NSLog(@"interface--%@",interface);
                    return dict;
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return dict;
}

















#pragma mark delegate
- (void)simplePing:(SimplePing *)pinger didStartWithAddress:(NSData *)address{
//    {- (void)performSelector: withObject:afterDelay:}
    [self.pinger sendPingWithData:nil];
}

- (void)simplePing:(SimplePing *)pinger didFailToSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber error:(NSError *)error{
    NSLog(@"didFailToSendPacket");
    
    //记录次数，失败后重试5次
    
    [self.pinger stop];
}

- (void)simplePing:(SimplePing *)pinger didFailWithError:(NSError *)error{
    NSLog(@"didFailWithError");
    [self.pinger stop];
}

- (void)simplePing:(SimplePing *)pinger didReceivePingResponsePacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber{
    
}

- (void)simplePing:(SimplePing *)pinger didSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber{
    
}

- (void)simplePing:(SimplePing *)pinger didReceiveUnexpectedPacket:(NSData *)packet{
    
}

@end
