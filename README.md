#LcCategoryProperty
---
handy add property in category use runtime
只需要调用一个方法，就可以在Category中使用Property

#Installation
Drag LcCategoryProperty folder to your project
安装方法：将LcCategoryProperty文件夹拖到你的工程中

#Usage

	@interface Model (Property)
	@property (nonatomic, strong)NSString *name;
	@property (nonatomic, strong)NSURL *URL;
	@property (nonatomic, strong)NSDate *date;
	
	@property (nonatomic, assign)CGPoint point;
	@property (nonatomic, assign)CGRect myRect;
	
	@property (nonatomic, assign)float f;
	@property (nonatomic, assign)int a;
	
	@end
	
	@implementation Model (Property)
	
	+ (void)load
	{
	    [self addObjectProperty:@"URL"];
	    [self addObjectProperty:@"date"];
	    [self addObjectProperty:@"name" associationPolicy:OBJC_ASSOCIATION_COPY_NONATOMIC];
	    [self addBasicProperty:@"point" encodingType:@encode(CGPoint)];
	    [self addBasicProperty:@"myRect" encodingType:@encode(CGRect)];
	    [self addBasicProperty:@"f" encodingType:@encode(float)];
	    [self addBasicProperty:@"a" encodingType:@encode(int)];
	}
	
	@end

