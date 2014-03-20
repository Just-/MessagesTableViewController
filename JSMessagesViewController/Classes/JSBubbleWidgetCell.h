//
//  JSBubbleWidgetCell.h
//  Pods
//
//  Created by Anton Gaenko on 17.03.14.
//
//

#import "JSBubbleMessageCell.h"
#import "JSMessageWidgetData.h"

@interface JSBubbleWidgetCell : JSBubbleMessageCell

@property (strong, nonatomic) id<JSMessageWidgetData, JSMessageData> widget;
@property (strong, nonatomic) UIImageView* image;
@property (strong, nonatomic) UILabel* nameField;

- (instancetype)initWithBubbleType:(JSBubbleMessageType)type
                             frame:(CGRect)frame
                   bubbleImageView:(UIImageView *)bubbleImageView
                            widget:(id<JSMessageWidgetData, JSMessageData>)widget
                   reuseIdentifier:(NSString *)reuseIdentifier;


@end
