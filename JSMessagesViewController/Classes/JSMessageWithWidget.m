//
//  JSMessageWithWidget.m
//  Pods
//
//  Created by Anton Gaenko on 17.03.14.
//
//

#import "JSMessageWithWidget.h"

@implementation JSMessageWithWidget

- (instancetype)initWithText:(NSString *)text
                      sender:(NSString *)sender
                        date:(NSDate *)date
                        type:(WidgetType)type
                       price:(NSNumber*)price
                    imageUrl:(NSURL*)imageUrl
                    onAction:(OnAction)actionBlock
{
  self = [super initWithText:text sender:sender date:date];
  if (self) {
    self.widgetType = type;
    self.actionBlock = actionBlock;
    self.imageUrl = imageUrl;
    self.price = price;
  }
  return self;
}

- (instancetype)initWithPhoto:(NSURL*)imageUrl
                      sender:(NSString *)sender
                        date:(NSDate *)date
{
  return [self initWithText:@"" sender:sender date:date type:JustPhoto price:nil imageUrl:imageUrl onAction:nil];
}

-(NSString *)description {
  return [NSString stringWithFormat:@"{(%d) (%@) (%@) (%@)}", self.widgetType, self.text, self.price, self.imageUrl];
}



@end
