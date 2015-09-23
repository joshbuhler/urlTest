//
//  InterfaceController.h
//  urlTest WatchKit Extension
//
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (nonatomic) IBOutlet WKInterfaceLabel *dataTime;
@property (nonatomic) IBOutlet WKInterfaceLabel *urlTime;

- (IBAction) onTestBtn:(id)sender;

@end
