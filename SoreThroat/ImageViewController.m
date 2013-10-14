//
//  ImageViewController.m
//  SoreThroat
//
//  Created by Mark on 9/5/13.
//  Copyright (c) 2013 Mark Hambly. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation ImageViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]){
		
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	UIImage *image = [UIImage imageNamed:@"tables.png"];
	self.imageView = [[UIImageView alloc] initWithImage:image];
	self.imageView.frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
	
	[self.scrollView addSubview:self.imageView];
	
	self.scrollView.contentSize = self.imageView.image.size;
	self.scrollView.frame = self.view.frame;
	
	self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
																attribute:NSLayoutAttributeCenterX
																relatedBy:NSLayoutRelationEqual
																   toItem:self.scrollView
																attribute:NSLayoutAttributeCenterX
															   multiplier:1.0f
																 constant:0.0f]];
	[self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
																attribute:NSLayoutAttributeCenterY
																relatedBy:NSLayoutRelationEqual
																   toItem:self.scrollView
																attribute:NSLayoutAttributeCenterY
															   multiplier:1.0f
																 constant:0.0f]];
	

	
	CGRect scrollViewFrame = self.scrollView.frame;
	CGFloat scaleWidth = scrollViewFrame.size.width / self.scrollView.contentSize.width;
	CGFloat scaleHeight = scrollViewFrame.size.height / self.scrollView.contentSize.height;
	CGFloat minScale = MIN(scaleWidth, scaleHeight);
	self.scrollView.minimumZoomScale = minScale;
	
	self.scrollView.maximumZoomScale = 1.0f;
	self.scrollView.zoomScale = minScale;
	
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	
	
	self.scrollView.contentSize = self.imageView.image.size;
	
	CGRect scrollViewFrame = self.scrollView.frame;
	CGFloat scaleWidth = scrollViewFrame.size.width / self.scrollView.contentSize.width;
	CGFloat scaleHeight = scrollViewFrame.size.height / self.scrollView.contentSize.height;
	CGFloat minScale = MIN(scaleWidth, scaleHeight);
	self.scrollView.minimumZoomScale = minScale;
	
	self.scrollView.maximumZoomScale = 1.5f;
	
	[UIView animateWithDuration:0.2f animations:^{
		self.scrollView.zoomScale = minScale;
	}];
	
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return self.imageView;
}

@end
