//
//  LSTGestureEvents.h
//  LSTButton
//
//  Created by LoSenTrad on 2019/12/31.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LSTGestureEvents)


#pragma mark - ***** SEL事件绑定模式 *****

/** 添加tap手势 target:事件目标 action:事件 return:返回tap事件 */
- (UITapGestureRecognizer *)addTapGestureTarget:(id)target action:(SEL)action;

/**  添加Pan手势事件 target: 事件目标 action: 事件 return: 返回pan手势 */
- (UIPanGestureRecognizer *)addPanGestureTarget:(id)target action:(SEL)action;

/** 添加Pinch手势事件  target: 事件目标 action: 事件 return 返回Pinch手势 */
- (UIPinchGestureRecognizer *)addPinchGestureTarget:(id)target action:(SEL)action;

/** 添加LongPress手势事件 target: 事件目标 action: 事件 return: 返回LongPress手势 */
- (UILongPressGestureRecognizer *)addLongPressGestureTarget:(id)target action:(SEL)action;

/** 添加Swipe手势事件 target: 事件目标 action: 事件 return: 返回Swipe手势*/
- (UISwipeGestureRecognizer *)addSwipeGestureTarget:(id)target action:(SEL)action;

/** 添加Rotation手势事件 target: 事件目标 action: 事件 return: 返回Rotation手势*/
- (UIRotationGestureRecognizer *)addRotationGestureTarget:(id)target action:(SEL)action;

/** 添加ScreenEdgePan手势事件 target: 事件目标 action: 事件 return: 返回ScreenEdgePan手势 */
- (UIScreenEdgePanGestureRecognizer *)addScreenEdgePanGestureTarget:(id)target action:(SEL)action;



#pragma mark - ***** Block绑定模式 *****

/**  添加Tap手势block事件 event: block事件 return: 返回Tap手势 */
- (UITapGestureRecognizer *)addTapGestureEventHandle:(void (^)(id sender, UITapGestureRecognizer *gestureRecognizer))event;

/** 添加Pan手势block事件 event: block事件 return: 返回Pan手势  */
- (UIPanGestureRecognizer *)addPanGestureEventHandle:(void (^)(id sender, UIPanGestureRecognizer *gestureRecognizer))event;

/**添加Pinch手势block事件 event: block事件 return: 返回Pinch手势 */
- (UIPinchGestureRecognizer *)addPinchGestureEventHandle:(void (^)(id sender, UIPinchGestureRecognizer *gestureRecognizer))event;

/**  添加LongPress手势block事件 event: block事件  return: 返回LongPress手势 */
- (UILongPressGestureRecognizer *)addLongPressGestureEventHandle:(void (^)(id sender, UILongPressGestureRecognizer *gestureRecognizer))event;

/** 添加Swipe手势block事件 event: block事件 return: 返回Swipe手势*/
- (UISwipeGestureRecognizer *)addSwipeGestureEventHandle:(void (^)(id sender, UISwipeGestureRecognizer *gestureRecognizer))event;

/**添加Rotation手势block事件 event: block事件 return: 返回Rotation手势*/
- (UIRotationGestureRecognizer *)addRotationGestureEventHandle:(void (^)(id sender, UIRotationGestureRecognizer *gestureRecognizer))event;

/**添加ScreenEdgePan手势block事件 event: block事件 return: 返回ScreenEdgePan手势*/
- (UIScreenEdgePanGestureRecognizer *)addScreenEdgePanGestureEventHandle:(void (^)(id sender, UIScreenEdgePanGestureRecognizer *gestureRecognizer))event;




@end

NS_ASSUME_NONNULL_END
