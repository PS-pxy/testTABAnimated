//
//  cellModel.h
//  testTABAnimated
//
//  Created by PS on 2021/2/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cellModel : NSObject

@property (nonatomic, strong) NSString * fHDUrl;
@property (nonatomic, strong) NSString * hDUrl;
@property (nonatomic, strong) NSString * sDUrl;
@property (nonatomic, strong) NSString * authorId;
@property (nonatomic, strong) NSString * avatarUrl;
@property (nonatomic, strong) NSString * commentCount;
@property (nonatomic, strong) NSString * cover;
@property (nonatomic, strong) NSArray * coverArray;
@property (nonatomic, assign) BOOL isFollow;
@property (nonatomic, assign) BOOL isFullCover;
@property (nonatomic, assign) BOOL isLike;
@property (nonatomic, assign) BOOL isOriginal;
@property (nonatomic, assign) BOOL isTop;
@property (nonatomic, assign) BOOL isVip;
@property (nonatomic, assign) NSInteger likeCount;
@property (nonatomic, strong) NSString * newsId;
@property (nonatomic, strong) NSString * newsType;
@property (nonatomic, strong) NSString * publishDate;
@property (nonatomic, strong) NSString * shareCount;
@property (nonatomic, strong) NSString * shareCover;
@property (nonatomic, strong) NSString * shareDesc;
@property (nonatomic, strong) NSString * shareTitle;
@property (nonatomic, strong) NSString * shareUrl;
@property (nonatomic, strong) NSArray * systemLabel;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, strong) NSString * username;
@property (nonatomic, strong) NSArray * videoList;
@property (nonatomic, strong) NSString * visitCount;

@end

NS_ASSUME_NONNULL_END
