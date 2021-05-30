//
//  textTableViewCell.m
//  testTABAnimated
//
//  Created by PS on 2021/2/27.
//

#import "textTableViewCell.h"

@interface textTableViewCell ()

@property (nonatomic, strong)  UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;


@end

@implementation textTableViewCell

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _titleLabel;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:12];
    }
    return _contentLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        
        self.titleLabel.sd_layout.leftEqualToView(self.contentView).offset(15).topEqualToView(self.contentView).offset(15).rightEqualToView(self.contentView).offset(-15).autoHeightRatio(0);
        self.contentLabel.sd_layout.leftEqualToView(self.contentView).offset(15).topSpaceToView(self.titleLabel, 20).rightEqualToView(self.contentView).offset(-15).autoHeightRatio(0);
        
        
        [self setupAutoHeightWithBottomView:self.contentLabel bottomMargin:10];
        
    }
    return self;
}

- (void)setModel:(cellModel *)model{
    _model =  model;
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.shareDesc;
}
    

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
