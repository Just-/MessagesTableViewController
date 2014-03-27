//
//  JSMessageWithWidget.h
//  Pods
//
//  Created by Anton Gaenko on 17.03.14.
//
//

#import "JSMessage.h"
#import <UIKit/UIKit.h>
#import "JSMessageWidgetData.h"


@interface JSMessageWithWidget : JSMessage <JSMessageWidgetData>

@property (strong, nonatomic) NSURL* imageUrl;
@property (assign, nonatomic) WidgetType widgetType;
@property (strong, nonatomic) NSNumber* price;
@property (copy, nonatomic) OnAction actionBlock;

- (instancetype)initWithText:(NSString *)text
                      sender:(NSString *)sender
                        date:(NSDate *)date
                        type:(WidgetType)type
                       price:(NSNumber*)price
                    imageUrl:(NSURL*)imageUrl
                    onAction:(OnAction)actionBlock;

- (instancetype)initWithPhoto:(NSURL*)imageUrl
                       sender:(NSString *)sender
                         date:(NSDate *)date;

@end
