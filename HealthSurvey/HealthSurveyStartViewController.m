/*
 File:       PutController.m
 
 Contains:   Manages the Put tab.
 
 Written by: DTS
 
 Copyright:  Copyright (c) 2009-2012 Apple Inc. All Rights Reserved.
 
 Disclaimer: IMPORTANT: This Apple software is supplied to you by Apple Inc.
 ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or
 redistribution of this Apple software constitutes acceptance of
 these terms.  If you do not agree with these terms, please do
 not use, install, modify or redistribute this Apple software.
 
 In consideration of your agreement to abide by the following
 terms, and subject to these terms, Apple grants you a personal,
 non-exclusive license, under Apple's copyrights in this
 original Apple software (the "Apple Software"), to use,
 reproduce, modify and redistribute the Apple Software, with or
 without modifications, in source and/or binary forms; provided
 that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the
 following text and disclaimers in all such redistributions of
 the Apple Software. Neither the name, trademarks, service marks
 or logos of Apple Inc. may be used to endorse or promote
 products derived from the Apple Software without specific prior
 written permission from Apple.  Except as expressly stated in
 this notice, no other rights or licenses, express or implied,
 are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or
 by other works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.
 APPLE MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
 WITHOUT LIMITATION THE IMPLIED WARRANTIES OF NON-INFRINGEMENT,
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, REGARDING
 THE APPLE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN
 COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT,
 INCIDENTAL OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) ARISING IN ANY WAY
 OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION
 OF THE APPLE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY
 OF CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR
 OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE POSSIBILITY OF
 SUCH DAMAGE.
 
 */

#import "HealthSurveyStartViewController.h"
#import "NetworkManager.h"
#include <CFNetwork/CFNetwork.h>

@interface HealthSurveyStartViewController () <UITextFieldDelegate, NSStreamDelegate>

// Properties that don't need to be seen by the outside world.

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *uploadButton;


- (IBAction)uploadAction:(id)sender;

@end

@implementation HealthSurveyStartViewController

#pragma mark * Status management

// These methods are used by the core transfer code to update the UI.


- (void)sendDidStopWithStatus:(NSString *)statusString
{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"uploadButton", nil) message:NSLocalizedString(@"Uploadsucceeded", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}




#pragma -mark startSend filePath
- (void)startSend:(NSString *)filePath withDBAccount:(DBAccount *) account
{
    
    
    if (account) {
        DBFilesystem *filesystem = [[DBFilesystem alloc] initWithAccount:account];
        [DBFilesystem setSharedFilesystem:filesystem];
    }
    
    //    NSLog(@"fiel path is:%@",filePath);
    NSString* fileName = [filePath substringFromIndex: [filePath length] - 18];
    DBPath *newPath = [[DBPath root] childPath:fileName];
    //    NSLog(@"db path is:%@",newPath);
    DBFile *file;
    if (![[DBFilesystem sharedFilesystem]fileInfoForPath:newPath error:nil].path){
        file = [[DBFilesystem sharedFilesystem] createFile:newPath error:nil];
    } else {
        [[DBFilesystem sharedFilesystem] deletePath:newPath error:nil];
        file = [[DBFilesystem sharedFilesystem] createFile:newPath error:nil];
    }
    //    NSLog(@"dbfiel is:%@",file);
    
    [file writeContentsOfFile:filePath shouldSteal:NO error: nil];
    
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"uploadButton", nil) message:NSLocalizedString(@"Uploadsucceeded", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    
}



//- (void)stopSendWithStatus:(NSString *)statusString
//{
//    if (self.networkStream != nil) {
//        [self.networkStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
//        self.networkStream.delegate = nil;
//        [self.networkStream close];
//        self.networkStream = nil;
//    }
//    if (self.fileStream != nil) {
//        [self.fileStream close];
//        self.fileStream = nil;
//    }
//    [self sendDidStopWithStatus:statusString];
//}

#pragma mark * Actions



#pragma mark * View controller boilerplate

- (void)viewDidLoad
{
    [super viewDidLoad];

   }



- (void)viewDidUnload
{
       [super viewDidUnload];
}


- (IBAction)uploadAction:(id)sender {
    assert( [sender isKindOfClass:[UIView class]] );
    
    if ( YES ) {
        NSString *  filePath;
        
        // User the tag on the UIButton to determine which image to send.
        
        filePath = [[NetworkManager sharedInstance] resultsFilePath];
        assert(filePath != nil);
        if (!self.manager.linkedAccount.isLinked){
            [[DBAccountManager sharedManager] linkFromController:self];
        }
        DBAccount* account = [self.manager.linkedAccounts objectAtIndex:0];
        //    NSLog(@"the accout is: %@",[self.manager.linkedAccounts objectAtIndex:0]);
        if (account){
            [self startSend:filePath withDBAccount:account];
        }
    }
}

- (DBAccountManager *)manager {
	return [DBAccountManager sharedManager];
}


- (void)alertWithTitle:(NSString *)title  msg:(NSString *)msg
{
    if (title && msg)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        alert = nil;
    }
    
}



@end
