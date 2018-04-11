//
//  AccountCell.m
//  LittleToast
//
//  Created by Mr_kit on 2018/4/10.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import "AccountCell.h"

@interface AccountCell ()

@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *creatTimeLabel;
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation AccountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.typeLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.creatTimeLabel];
    [self addSubview:self.bottomLineView];
}


- (void)layoutSubviews {
    CGSize typeSize = [self.typeLabel.text sizeWithFont:FONT_NORMAL maxSize:MAX_SIZE];
    CGSize creatSize = [self.creatTimeLabel.text sizeWithFont:FONT_NORMAL maxSize:MAX_SIZE];
    
    self.typeLabel.frame = CGRectMake(paddingLeft, (self.height - typeSize.height - creatSize.height - 5) * 0.5, typeSize.width, typeSize.height);
    
    CGSize priceSize = [self.priceLabel.text sizeWithFont:FONT_NORMAL maxSize:MAX_SIZE];
    self.priceLabel.frame = CGRectMake(self.width - paddingLeft - priceSize.width, (self.height - priceSize.height) * 0.5, priceSize.width, priceSize.height);
    
    
    self.creatTimeLabel.frame = CGRectMake(paddingLeft, self.typeLabel.bottom + 5, creatSize.width, creatSize.height);
    
    self.bottomLineView.frame = CGRectMake(0, self.height - 1, self.width, 1);
    
}


#pragma mark - lazyLoad
- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [UILabel new];
        _typeLabel.font = FONT_NORMAL;
        _typeLabel.textColor = COLOR_TEXT;
        _typeLabel.text = @"支出类别";
    }
    return _typeLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = FONT_NORMAL;
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.text = @"￥520.00";
    }
    return _priceLabel;
}

- (UILabel *)creatTimeLabel {
    if (!_creatTimeLabel) {
        _creatTimeLabel = [UILabel new];
        _creatTimeLabel.font = FONT_NORMAL;
        _creatTimeLabel.textColor = COLOR_TEXT;
        _creatTimeLabel.text = @"05-20 05:20";
    }
    return _creatTimeLabel;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [UIView new];
        _bottomLineView.backgroundColor = COLOR_SEPOARTE;
    }
    return _bottomLineView;
}

@end
