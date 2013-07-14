//
//  OCTContent.m
//  OctoKit
//
//  Created by Aron Cedercrantz on 14-07-2013.
//  Copyright (c) 2013 GitHub. All rights reserved.
//

#import "OCTContent.h"
#import "OCTFileContent.h"
#import "OCTDirectoryContent.h"
#import "OCTSymlinkContent.h"
#import "OCTSubmoduleContent.h"

@interface OCTContent ()

// The type of content which the reciever represents.
@property (nonatomic, copy, readonly) NSString *type;

@end

@implementation OCTContent

#pragma mark Class Cluster

+ (NSDictionary *)contentClassesByType {
	return @{
		@"file": OCTFileContent.class,
		@"dir": OCTDirectoryContent.class,
		@"symlink": OCTSymlinkContent.class,
		@"submodule": OCTSubmoduleContent.class,
	};
}

#pragma mark MTLJSONSerializing

+ (Class)classForParsingJSONDictionary:(NSDictionary *)JSONDictionary {
	return self.contentClassesByType[JSONDictionary[@"type"]];
}

@end