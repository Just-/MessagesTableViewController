//
//  JSMessageWidgetData.h
//  Pods
//
//  Created by Anton Gaenko on 17.03.14.
//
//

#import <Foundation/Foundation.h>


enum WidgetType {
  JustPhoto = 1,
  SimpleReservation = 2
} typedef WidgetType;

typedef void (^OnAction)(WidgetType type);

@protocol JSMessageWidgetData <NSObject>

@required

-(NSNumber*)price;
-(NSURL*) imageUrl;
-(WidgetType) widgetType;
-(OnAction) actionBlock;

@end
