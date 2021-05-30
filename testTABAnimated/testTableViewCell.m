//
//  testTableViewCell.m
//  testTABAnimated
//
//  Created by PS on 2021/2/26.
//

#import "testTableViewCell.h"
#import "testTableViewCell.h"


@interface testTableViewCell ()

//@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;
//@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//@property (weak, nonatomic) IBOutlet UILabel *zuozhe;
//@property (weak, nonatomic) IBOutlet UILabel *newsConten;

@property (nonatomic, strong) UIImageView *newsImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *zuozhe;
@property (nonatomic, strong) UILabel *newsConten;


@end
@implementation testTableViewCell

- (UIImageView *)newsImageView{
    if (!_newsImageView) {
        _newsImageView = [[UIImageView alloc] init];
        _newsImageView.contentMode = UIViewContentModeScaleAspectFill;
        _newsImageView.backgroundColor = [UIColor greenColor];
        _newsImageView.layer.masksToBounds = YES;
        
    }
    return _newsImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:10];
    }
    return _titleLabel;
}

- (UILabel *)zuozhe{
    if (!_zuozhe) {
        _zuozhe = [[UILabel alloc] init];
        _zuozhe.font = [UIFont systemFontOfSize:10];
        _zuozhe.textColor = [UIColor grayColor];
    }
    return _zuozhe;
}
- (UILabel *)newsConten{
    if (!_newsConten) {
        _newsConten = [[UILabel alloc] init];
        _newsConten.font = [UIFont systemFontOfSize:8];
//        _newsConten.numberOfLines = 0;
    }
    return _newsConten;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
//        self.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.newsImageView];
        [self.contentView addSubview:self.newsConten];
        [self.contentView addSubview:self.zuozhe];
        
        self.newsImageView.sd_layout.leftEqualToView(self.contentView).offset(15).topEqualToView(self.contentView).offset(15).widthIs(100).autoHeightRatio(2);
        
        self.titleLabel.sd_layout.leftSpaceToView(self.newsImageView, 10).topEqualToView(self.newsImageView).rightEqualToView(self.contentView).autoHeightRatio(0);
        
        self.newsConten.sd_layout.leftSpaceToView(self.newsImageView, 10).topSpaceToView(self.titleLabel, 10).rightEqualToView(self.contentView).offset(-15).autoHeightRatio(0);
        
        self.zuozhe.sd_layout.leftSpaceToView(self.newsImageView, 10).bottomEqualToView(self.newsImageView).rightEqualToView(self.contentView).autoHeightRatio(0);
        
        
        [self setupAutoHeightWithBottomView:self.zuozhe bottomMargin:15];
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(cellModel *)model{
    _model =  model;
    
    [self.newsImageView sd_setImageWithURL:[NSURL URLWithString:model.shareCover]];
    
    self.titleLabel.text = model.title;
    self.newsConten.text = model.shareDesc;
    self.zuozhe.text = [NSString stringWithFormat:@"作者：%@",model.username];
    
    
}
@end
