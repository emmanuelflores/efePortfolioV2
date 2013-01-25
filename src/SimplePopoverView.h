#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum {
    SimplePopoverViewDirectionAny,
    SimplePopoverViewDirectionLeft,
    SimplePopoverViewDirectionRight,
    SimplePopoverViewDirectionUp,
    SimplePopoverViewDirectionDown,
    SimplePopoverViewDirectionNone
} SimplePopoverViewDirection;

#define SimplePopoverViewDirectionIsHorizontal(direction) (direction==SimplePopoverViewDirectionLeft||direction==SimplePopoverViewDirectionRight)
#define SimplePopoverViewDirectionIsVertical(direction) (direction==SimplePopoverViewDirectionUp||direction==SimplePopoverViewDirectionDown)

@protocol SimplePopoverViewDelegate;

@interface SimplePopoverView : UIView

@property(assign,nonatomic) SimplePopoverViewDirection direction;
@property(assign,nonatomic) CGPoint origin;
@property(strong,nonatomic) UIView* anchor;

@property(nonatomic,readonly) UIView* contentView;
@property(assign,nonatomic) CGSize contentSize;
@property(assign,nonatomic) UIEdgeInsets contentInset;

@property(assign,nonatomic) UIEdgeInsets popoverPadding;
@property(strong,nonatomic) UIColor* popoverColor;

@property(nonatomic,readonly) UIViewController* parentViewController;
@property(weak,nonatomic) id<SimplePopoverViewDelegate> delegate;

-(id)initWithOrigin:(CGPoint)origin withParentViewController:(UIViewController*)parentViewController;
-(id)initFromView:(UIView*)anchor withParentViewController:(UIViewController*)parentViewController;

-(void)showPopover;
-(void)showPopoverAnimated:(BOOL)animated completion:(void(^)(void))completion;
-(void)dismissPopover;
-(void)dismissPopoverAnimated:(BOOL)animated completion:(void(^)(void))completion;

@end

@protocol SimplePopoverViewDelegate<NSObject>
@optional
-(BOOL)popoverShouldDismissPopover:(SimplePopoverView*)popoverView;
-(void)popoverDidDismissPopover:(SimplePopoverView*)popoverView;
-(void)popoverDidShowPopover:(SimplePopoverView*)popoverView;

@end