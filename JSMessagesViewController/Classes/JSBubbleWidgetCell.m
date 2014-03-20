//
//  JSBubbleWidgetCell.m
//  Pods
//
//  Created by Anton Gaenko on 17.03.14.
//
//

#import "JSBubbleWidgetCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation JSBubbleWidgetCell

- (instancetype)initWithBubbleType:(JSBubbleMessageType)type
                             frame:(CGRect)frame
                   bubbleImageView:(UIImageView *)bubbleImageView
                            widget:(id<JSMessageWidgetData, JSMessageData>)widget
                   reuseIdentifier:(NSString *)reuseIdentifier {
  self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
  if (self) {
    self.frame = frame;
    [self configureWithType:type
            bubbleImageView:bubbleImageView
                    message:widget
          displaysTimestamp:NO
                     avatar:NO];
  }
  return self;
}

- (void)configureWithType:(JSBubbleMessageType)type
          bubbleImageView:(UIImageView *)bubbleImageView
                  message:(id<JSMessageData, JSMessageWidgetData>)widget
        displaysTimestamp:(BOOL)displaysTimestamp
                   avatar:(BOOL)hasAvatar
{
  self.widget = widget;
  
  self.nameField = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 20)];
  self.nameField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  self.nameField.backgroundColor = [UIColor clearColor];
  self.nameField.textAlignment = NSTextAlignmentCenter;
  self.nameField.textColor = [UIColor whiteColor];
  self.nameField.font = [UIFont systemFontOfSize:15.5f];
  
  // height of cell - height of label - height of action button
  CGRect imageFrame = CGRectMake(0, CGRectGetMaxY(self.nameField.frame) + 5, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.nameField.frame) - 30 - 5);
  self.image = [[UIImageView alloc] initWithFrame:imageFrame];
  self.image.clipsToBounds = YES;
  self.image.autoresizingMask = UIViewAutoresizingNone;
  self.image.contentMode = UIViewContentModeScaleAspectFit;
  
  UIButton* actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
  actionButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
  [actionButton setTitle:@"Отложить" forState:UIControlStateNormal];
  [actionButton setTitleColor:[UIColor colorWithRed:181.0 / 255.0 green:117.0 / 255.0 blue:48.0 / 255.0 alpha:1.0] forState:UIControlStateNormal];
  actionButton.frame = CGRectMake(0, CGRectGetMaxY(self.image.frame), CGRectGetWidth(self.frame), 30);
  [actionButton addTarget:self action:@selector(onAction:) forControlEvents:UIControlEventTouchUpInside];
  
  if ([widget type] != JustPhoto) [self.contentView addSubview:self.nameField];
  [self.contentView addSubview:self.image];
  if ([widget type] != JustPhoto) [self.contentView addSubview:actionButton];
}

-(void)onAction:(id)sender {
  if ([self.widget actionBlock]) [self.widget actionBlock]([self.widget type]);
}


+ (CGFloat)neededHeightForBubbleMessageCellWithMessage:(id<JSMessageData, JSMessageWidgetData>)message
                                        displaysAvatar:(BOOL)displaysAvatar
                                     displaysTimestamp:(BOOL)displaysTimestamp
{
  return 280;
}


@end
