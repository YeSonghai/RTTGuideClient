// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Tss.pb.h"

@implementation TssRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [TssRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = registry;
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface TSSPoint ()
@property Float64 lon;
@property Float64 lat;
@end

@implementation TSSPoint

- (BOOL) hasLon {
  return !!hasLon_;
}
- (void) setHasLon:(BOOL) value {
  hasLon_ = !!value;
}
@synthesize lon;
- (BOOL) hasLat {
  return !!hasLat_;
}
- (void) setHasLat:(BOOL) value {
  hasLat_ = !!value;
}
@synthesize lat;
- (id) init {
  if ((self = [super init])) {
    self.lon = 0;
    self.lat = 0;
  }
  return self;
}
static TSSPoint* defaultTSSPointInstance = nil;
+ (void) initialize {
  if (self == [TSSPoint class]) {
    defaultTSSPointInstance = [[TSSPoint alloc] init];
  }
}
+ (TSSPoint*) defaultInstance {
  return defaultTSSPointInstance;
}
- (TSSPoint*) defaultInstance {
  return defaultTSSPointInstance;
}
- (BOOL) isInitialized {
  if (!self.hasLon) {
    return NO;
  }
  if (!self.hasLat) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasLon) {
    [output writeDouble:1 value:self.lon];
  }
  if (self.hasLat) {
    [output writeDouble:2 value:self.lat];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasLon) {
    size += computeDoubleSize(1, self.lon);
  }
  if (self.hasLat) {
    size += computeDoubleSize(2, self.lat);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TSSPoint*) parseFromData:(NSData*) data {
  return (TSSPoint*)[[[TSSPoint builder] mergeFromData:data] build];
}
+ (TSSPoint*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSPoint*)[[[TSSPoint builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TSSPoint*) parseFromInputStream:(NSInputStream*) input {
  return (TSSPoint*)[[[TSSPoint builder] mergeFromInputStream:input] build];
}
+ (TSSPoint*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSPoint*)[[[TSSPoint builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TSSPoint*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TSSPoint*)[[[TSSPoint builder] mergeFromCodedInputStream:input] build];
}
+ (TSSPoint*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSPoint*)[[[TSSPoint builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TSSPoint_Builder*) builder {
  return [[TSSPoint_Builder alloc] init];
}
+ (TSSPoint_Builder*) builderWithPrototype:(TSSPoint*) prototype {
  return [[TSSPoint builder] mergeFrom:prototype];
}
- (TSSPoint_Builder*) builder {
  return [TSSPoint builder];
}
@end

@interface TSSPoint_Builder()
@property (nonatomic, strong) TSSPoint* result; //YSH CODE
@end

@implementation TSSPoint_Builder
@synthesize result;
- (id) init {
  if ((self = [super init])) {
    self.result = [[TSSPoint alloc] init];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (TSSPoint_Builder*) clear {
  self.result = [[TSSPoint alloc] init];
  return self;
}
- (TSSPoint_Builder*) clone {
  return [TSSPoint builderWithPrototype:result];
}
- (TSSPoint*) defaultInstance {
  return [TSSPoint defaultInstance];
}
- (TSSPoint*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (TSSPoint*) buildPartial {
  TSSPoint* returnMe = result;
  self.result = nil;
  return returnMe;
}
- (TSSPoint_Builder*) mergeFrom:(TSSPoint*) other {
  if (other == [TSSPoint defaultInstance]) {
    return self;
  }
  if (other.hasLon) {
    [self setLon:other.lon];
  }
  if (other.hasLat) {
    [self setLat:other.lat];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TSSPoint_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TSSPoint_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 9: {
        [self setLon:[input readDouble]];
        break;
      }
      case 17: {
        [self setLat:[input readDouble]];
        break;
      }
    }
  }
}
- (BOOL) hasLon {
  return result.hasLon;
}
- (Float64) lon {
  return result.lon;
}
- (TSSPoint_Builder*) setLon:(Float64) value {
  result.hasLon = YES;
  result.lon = value;
  return self;
}
- (TSSPoint_Builder*) clearLon {
  result.hasLon = NO;
  result.lon = 0;
  return self;
}
- (BOOL) hasLat {
  return result.hasLat;
}
- (Float64) lat {
  return result.lat;
}
- (TSSPoint_Builder*) setLat:(Float64) value {
  result.hasLat = YES;
  result.lat = value;
  return self;
}
- (TSSPoint_Builder*) clearLat {
  result.hasLat = NO;
  result.lat = 0;
  return self;
}
@end

@interface TSSDrivingRoute ()
@property  TSSPoint* start;
@property  NSMutableArray* mutableSegmentList;
@end

@implementation TSSDrivingRoute

- (BOOL) hasStart {
  return !!hasStart_;
}
- (void) setHasStart:(BOOL) value {
  hasStart_ = !!value;
}
@synthesize start;
@synthesize mutableSegmentList;
- (id) init {
  if ((self = [super init])) {
    self.start = [TSSPoint defaultInstance];
  }
  return self;
}
static TSSDrivingRoute* defaultTSSDrivingRouteInstance = nil;
+ (void) initialize {
  if (self == [TSSDrivingRoute class]) {
    defaultTSSDrivingRouteInstance = [[TSSDrivingRoute alloc] init];
  }
}
+ (TSSDrivingRoute*) defaultInstance {
  return defaultTSSDrivingRouteInstance;
}
- (TSSDrivingRoute*) defaultInstance {
  return defaultTSSDrivingRouteInstance;
}
- (NSArray*) segmentList {
  return mutableSegmentList;
}
- (TSSDrivingRoute_Segment*) segmentAtIndex:(int32_t) index {
  id value = [mutableSegmentList objectAtIndex:index];
  return value;
}
- (BOOL) isInitialized {
  if (self.hasStart) {
    if (!self.start.isInitialized) {
      return NO;
    }
  }
  for (TSSDrivingRoute_Segment* element in self.segmentList) {
    if (!element.isInitialized) {
      return NO;
    }
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasStart) {
    [output writeMessage:1 value:self.start];
  }
  for (TSSDrivingRoute_Segment* element in self.segmentList) {
    [output writeMessage:2 value:element];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasStart) {
    size += computeMessageSize(1, self.start);
  }
  for (TSSDrivingRoute_Segment* element in self.segmentList) {
    size += computeMessageSize(2, element);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TSSDrivingRoute*) parseFromData:(NSData*) data {
  return (TSSDrivingRoute*)[[[TSSDrivingRoute builder] mergeFromData:data] build];
}
+ (TSSDrivingRoute*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSDrivingRoute*)[[[TSSDrivingRoute builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TSSDrivingRoute*) parseFromInputStream:(NSInputStream*) input {
  return (TSSDrivingRoute*)[[[TSSDrivingRoute builder] mergeFromInputStream:input] build];
}
+ (TSSDrivingRoute*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSDrivingRoute*)[[[TSSDrivingRoute builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TSSDrivingRoute*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TSSDrivingRoute*)[[[TSSDrivingRoute builder] mergeFromCodedInputStream:input] build];
}
+ (TSSDrivingRoute*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSDrivingRoute*)[[[TSSDrivingRoute builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TSSDrivingRoute_Builder*) builder {
  return [[TSSDrivingRoute_Builder alloc] init];
}
+ (TSSDrivingRoute_Builder*) builderWithPrototype:(TSSDrivingRoute*) prototype {
  return [[TSSDrivingRoute builder] mergeFrom:prototype];
}
- (TSSDrivingRoute_Builder*) builder {
  return [TSSDrivingRoute builder];
}
@end

@interface TSSDrivingRoute_Segment ()
@property  NSString* road;
@property  NSMutableArray* mutablePointList;
@end

@implementation TSSDrivingRoute_Segment

- (BOOL) hasRoad {
  return !!hasRoad_;
}
- (void) setHasRoad:(BOOL) value {
  hasRoad_ = !!value;
}
@synthesize road;
@synthesize mutablePointList;
- (id) init {
  if ((self = [super init])) {
    self.road = @"";
  }
  return self;
}
static TSSDrivingRoute_Segment* defaultTSSDrivingRoute_SegmentInstance = nil;
+ (void) initialize {
  if (self == [TSSDrivingRoute_Segment class]) {
    defaultTSSDrivingRoute_SegmentInstance = [[TSSDrivingRoute_Segment alloc] init];
  }
}
+ (TSSDrivingRoute_Segment*) defaultInstance {
  return defaultTSSDrivingRoute_SegmentInstance;
}
- (TSSDrivingRoute_Segment*) defaultInstance {
  return defaultTSSDrivingRoute_SegmentInstance;
}
- (NSArray*) pointList {
  return mutablePointList;
}
- (TSSPoint*) pointAtIndex:(int32_t) index {
  id value = [mutablePointList objectAtIndex:index];
  return value;
}
- (BOOL) isInitialized {
  if (!self.hasRoad) {
    return NO;
  }
  for (TSSPoint* element in self.pointList) {
    if (!element.isInitialized) {
      return NO;
    }
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasRoad) {
    [output writeString:1 value:self.road];
  }
  for (TSSPoint* element in self.pointList) {
    [output writeMessage:2 value:element];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasRoad) {
    size += computeStringSize(1, self.road);
  }
  for (TSSPoint* element in self.pointList) {
    size += computeMessageSize(2, element);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TSSDrivingRoute_Segment*) parseFromData:(NSData*) data {
  return (TSSDrivingRoute_Segment*)[[[TSSDrivingRoute_Segment builder] mergeFromData:data] build];
}
+ (TSSDrivingRoute_Segment*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSDrivingRoute_Segment*)[[[TSSDrivingRoute_Segment builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TSSDrivingRoute_Segment*) parseFromInputStream:(NSInputStream*) input {
  return (TSSDrivingRoute_Segment*)[[[TSSDrivingRoute_Segment builder] mergeFromInputStream:input] build];
}
+ (TSSDrivingRoute_Segment*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSDrivingRoute_Segment*)[[[TSSDrivingRoute_Segment builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TSSDrivingRoute_Segment*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TSSDrivingRoute_Segment*)[[[TSSDrivingRoute_Segment builder] mergeFromCodedInputStream:input] build];
}
+ (TSSDrivingRoute_Segment*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSDrivingRoute_Segment*)[[[TSSDrivingRoute_Segment builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TSSDrivingRoute_Segment_Builder*) builder {
  return [[TSSDrivingRoute_Segment_Builder alloc] init];
}
+ (TSSDrivingRoute_Segment_Builder*) builderWithPrototype:(TSSDrivingRoute_Segment*) prototype {
  return [[TSSDrivingRoute_Segment builder] mergeFrom:prototype];
}
- (TSSDrivingRoute_Segment_Builder*) builder {
  return [TSSDrivingRoute_Segment builder];
}
@end

@interface TSSDrivingRoute_Segment_Builder()
@property  (nonatomic, strong) TSSDrivingRoute_Segment* result; //YSH CODE
@end

@implementation TSSDrivingRoute_Segment_Builder
@synthesize result;
- (id) init {
  if ((self = [super init])) {
    self.result = [[TSSDrivingRoute_Segment alloc] init];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (TSSDrivingRoute_Segment_Builder*) clear {
  self.result = [[TSSDrivingRoute_Segment alloc] init];
  return self;
}
- (TSSDrivingRoute_Segment_Builder*) clone {
  return [TSSDrivingRoute_Segment builderWithPrototype:result];
}
- (TSSDrivingRoute_Segment*) defaultInstance {
  return [TSSDrivingRoute_Segment defaultInstance];
}
- (TSSDrivingRoute_Segment*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (TSSDrivingRoute_Segment*) buildPartial {
  TSSDrivingRoute_Segment* returnMe = result;
  self.result = nil;
  return returnMe;
}
- (TSSDrivingRoute_Segment_Builder*) mergeFrom:(TSSDrivingRoute_Segment*) other {
  if (other == [TSSDrivingRoute_Segment defaultInstance]) {
    return self;
  }
  if (other.hasRoad) {
    [self setRoad:other.road];
  }
  if (other.mutablePointList.count > 0) {
    if (result.mutablePointList == nil) {
      result.mutablePointList = [NSMutableArray array];
    }
    [result.mutablePointList addObjectsFromArray:other.mutablePointList];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TSSDrivingRoute_Segment_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TSSDrivingRoute_Segment_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        [self setRoad:[input readString]];
        break;
      }
      case 18: {
        TSSPoint_Builder* subBuilder = [TSSPoint builder];
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self addPoint:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (BOOL) hasRoad {
  return result.hasRoad;
}
- (NSString*) road {
  return result.road;
}
- (TSSDrivingRoute_Segment_Builder*) setRoad:(NSString*) value {
  result.hasRoad = YES;
  result.road = value;
  return self;
}
- (TSSDrivingRoute_Segment_Builder*) clearRoad {
  result.hasRoad = NO;
  result.road = @"";
  return self;
}
- (NSArray*) pointList {
  if (result.mutablePointList == nil) { return [NSArray array]; }
  return result.mutablePointList;
}
- (TSSPoint*) pointAtIndex:(int32_t) index {
  return [result pointAtIndex:index];
}
- (TSSDrivingRoute_Segment_Builder*) replacePointAtIndex:(int32_t) index with:(TSSPoint*) value {
  [result.mutablePointList replaceObjectAtIndex:index withObject:value];
  return self;
}
- (TSSDrivingRoute_Segment_Builder*) addAllPoint:(NSArray*) values {
  if (result.mutablePointList == nil) {
    result.mutablePointList = [NSMutableArray array];
  }
  [result.mutablePointList addObjectsFromArray:values];
  return self;
}
- (TSSDrivingRoute_Segment_Builder*) clearPointList {
  result.mutablePointList = nil;
  return self;
}
- (TSSDrivingRoute_Segment_Builder*) addPoint:(TSSPoint*) value {
  if (result.mutablePointList == nil) {
    result.mutablePointList = [NSMutableArray array];
  }
  [result.mutablePointList addObject:value];
  return self;
}
@end

@interface TSSDrivingRoute_Builder()
@property  (nonatomic, strong)  TSSDrivingRoute* result; //YSH CODE
@end

@implementation TSSDrivingRoute_Builder
@synthesize result;
- (id) init {
  if ((self = [super init])) {
    self.result = [[TSSDrivingRoute alloc] init];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (TSSDrivingRoute_Builder*) clear {
  self.result = [[TSSDrivingRoute alloc] init];
  return self;
}
- (TSSDrivingRoute_Builder*) clone {
  return [TSSDrivingRoute builderWithPrototype:result];
}
- (TSSDrivingRoute*) defaultInstance {
  return [TSSDrivingRoute defaultInstance];
}
- (TSSDrivingRoute*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (TSSDrivingRoute*) buildPartial {
  TSSDrivingRoute* returnMe = result;
  self.result = nil;
  return returnMe;
}
- (TSSDrivingRoute_Builder*) mergeFrom:(TSSDrivingRoute*) other {
  if (other == [TSSDrivingRoute defaultInstance]) {
    return self;
  }
  if (other.hasStart) {
    [self mergeStart:other.start];
  }
  if (other.mutableSegmentList.count > 0) {
    if (result.mutableSegmentList == nil) {
      result.mutableSegmentList = [NSMutableArray array];
    }
    [result.mutableSegmentList addObjectsFromArray:other.mutableSegmentList];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TSSDrivingRoute_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TSSDrivingRoute_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        TSSPoint_Builder* subBuilder = [TSSPoint builder];
        if (self.hasStart) {
          [subBuilder mergeFrom:self.start];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setStart:[subBuilder buildPartial]];
        break;
      }
      case 18: {
        TSSDrivingRoute_Segment_Builder* subBuilder = [TSSDrivingRoute_Segment builder];
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self addSegment:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (BOOL) hasStart {
  return result.hasStart;
}
- (TSSPoint*) start {
  return result.start;
}
- (TSSDrivingRoute_Builder*) setStart:(TSSPoint*) value {
  result.hasStart = YES;
  result.start = value;
  return self;
}
- (TSSDrivingRoute_Builder*) setStartBuilder:(TSSPoint_Builder*) builderForValue {
  return [self setStart:[builderForValue build]];
}
- (TSSDrivingRoute_Builder*) mergeStart:(TSSPoint*) value {
  if (result.hasStart &&
      result.start != [TSSPoint defaultInstance]) {
    result.start =
      [[[TSSPoint builderWithPrototype:result.start] mergeFrom:value] buildPartial];
  } else {
    result.start = value;
  }
  result.hasStart = YES;
  return self;
}
- (TSSDrivingRoute_Builder*) clearStart {
  result.hasStart = NO;
  result.start = [TSSPoint defaultInstance];
  return self;
}
- (NSArray*) segmentList {
  if (result.mutableSegmentList == nil) { return [NSArray array]; }
  return result.mutableSegmentList;
}
- (TSSDrivingRoute_Segment*) segmentAtIndex:(int32_t) index {
  return [result segmentAtIndex:index];
}
- (TSSDrivingRoute_Builder*) replaceSegmentAtIndex:(int32_t) index with:(TSSDrivingRoute_Segment*) value {
  [result.mutableSegmentList replaceObjectAtIndex:index withObject:value];
  return self;
}
- (TSSDrivingRoute_Builder*) addAllSegment:(NSArray*) values {
  if (result.mutableSegmentList == nil) {
    result.mutableSegmentList = [NSMutableArray array];
  }
  [result.mutableSegmentList addObjectsFromArray:values];
  return self;
}
- (TSSDrivingRoute_Builder*) clearSegmentList {
  result.mutableSegmentList = nil;
  return self;
}
- (TSSDrivingRoute_Builder*) addSegment:(TSSDrivingRoute_Segment*) value {
  if (result.mutableSegmentList == nil) {
    result.mutableSegmentList = [NSMutableArray array];
  }
  [result.mutableSegmentList addObject:value];
  return self;
}
@end

@interface TSSTaffic ()
@property  TSSPoint* location;
@property int32_t speed;
@property int32_t dir;
@property  NSString* desc;
@end

@implementation TSSTaffic

- (BOOL) hasLocation {
  return !!hasLocation_;
}
- (void) setHasLocation:(BOOL) value {
  hasLocation_ = !!value;
}
@synthesize location;
- (BOOL) hasSpeed {
  return !!hasSpeed_;
}
- (void) setHasSpeed:(BOOL) value {
  hasSpeed_ = !!value;
}
@synthesize speed;
- (BOOL) hasDir {
  return !!hasDir_;
}
- (void) setHasDir:(BOOL) value {
  hasDir_ = !!value;
}
@synthesize dir;
- (BOOL) hasDesc {
  return !!hasDesc_;
}
- (void) setHasDesc:(BOOL) value {
  hasDesc_ = !!value;
}
@synthesize desc;
- (id) init {
  if ((self = [super init])) {
    self.location = [TSSPoint defaultInstance];
    self.speed = 0;
    self.dir = 0;
    self.desc = @"";
  }
  return self;
}
static TSSTaffic* defaultTSSTafficInstance = nil;
+ (void) initialize {
  if (self == [TSSTaffic class]) {
    defaultTSSTafficInstance = [[TSSTaffic alloc] init];
  }
}
+ (TSSTaffic*) defaultInstance {
  return defaultTSSTafficInstance;
}
- (TSSTaffic*) defaultInstance {
  return defaultTSSTafficInstance;
}
- (BOOL) isInitialized {
  if (!self.hasLocation) {
    return NO;
  }
  if (!self.hasSpeed) {
    return NO;
  }
  if (!self.hasDir) {
    return NO;
  }
  if (!self.hasDesc) {
    return NO;
  }
  if (!self.location.isInitialized) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasLocation) {
    [output writeMessage:1 value:self.location];
  }
  if (self.hasSpeed) {
    [output writeInt32:2 value:self.speed];
  }
  if (self.hasDir) {
    [output writeInt32:3 value:self.dir];
  }
  if (self.hasDesc) {
    [output writeString:4 value:self.desc];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasLocation) {
    size += computeMessageSize(1, self.location);
  }
  if (self.hasSpeed) {
    size += computeInt32Size(2, self.speed);
  }
  if (self.hasDir) {
    size += computeInt32Size(3, self.dir);
  }
  if (self.hasDesc) {
    size += computeStringSize(4, self.desc);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TSSTaffic*) parseFromData:(NSData*) data {
  return (TSSTaffic*)[[[TSSTaffic builder] mergeFromData:data] build];
}
+ (TSSTaffic*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSTaffic*)[[[TSSTaffic builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TSSTaffic*) parseFromInputStream:(NSInputStream*) input {
  return (TSSTaffic*)[[[TSSTaffic builder] mergeFromInputStream:input] build];
}
+ (TSSTaffic*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSTaffic*)[[[TSSTaffic builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TSSTaffic*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TSSTaffic*)[[[TSSTaffic builder] mergeFromCodedInputStream:input] build];
}
+ (TSSTaffic*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TSSTaffic*)[[[TSSTaffic builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TSSTaffic_Builder*) builder {
  return [[TSSTaffic_Builder alloc] init];
}
+ (TSSTaffic_Builder*) builderWithPrototype:(TSSTaffic*) prototype {
  return [[TSSTaffic builder] mergeFrom:prototype];
}
- (TSSTaffic_Builder*) builder {
  return [TSSTaffic builder];
}
@end

@interface TSSTaffic_Builder()
@property (nonatomic, strong)  TSSTaffic* result; //YSH CODE
@end

@implementation TSSTaffic_Builder
@synthesize result;
- (id) init {
  if ((self = [super init])) {
    self.result = [[TSSTaffic alloc] init];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (TSSTaffic_Builder*) clear {
  self.result = [[TSSTaffic alloc] init];
  return self;
}
- (TSSTaffic_Builder*) clone {
  return [TSSTaffic builderWithPrototype:result];
}
- (TSSTaffic*) defaultInstance {
  return [TSSTaffic defaultInstance];
}
- (TSSTaffic*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (TSSTaffic*) buildPartial {
  TSSTaffic* returnMe = result;
  self.result = nil;
  return returnMe;
}
- (TSSTaffic_Builder*) mergeFrom:(TSSTaffic*) other {
  if (other == [TSSTaffic defaultInstance]) {
    return self;
  }
  if (other.hasLocation) {
    [self mergeLocation:other.location];
  }
  if (other.hasSpeed) {
    [self setSpeed:other.speed];
  }
  if (other.hasDir) {
    [self setDir:other.dir];
  }
  if (other.hasDesc) {
    [self setDesc:other.desc];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TSSTaffic_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TSSTaffic_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        TSSPoint_Builder* subBuilder = [TSSPoint builder];
        if (self.hasLocation) {
          [subBuilder mergeFrom:self.location];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setLocation:[subBuilder buildPartial]];
        break;
      }
      case 16: {
        [self setSpeed:[input readInt32]];
        break;
      }
      case 24: {
        [self setDir:[input readInt32]];
        break;
      }
      case 34: {
        [self setDesc:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasLocation {
  return result.hasLocation;
}
- (TSSPoint*) location {
  return result.location;
}
- (TSSTaffic_Builder*) setLocation:(TSSPoint*) value {
  result.hasLocation = YES;
  result.location = value;
  return self;
}
- (TSSTaffic_Builder*) setLocationBuilder:(TSSPoint_Builder*) builderForValue {
  return [self setLocation:[builderForValue build]];
}
- (TSSTaffic_Builder*) mergeLocation:(TSSPoint*) value {
  if (result.hasLocation &&
      result.location != [TSSPoint defaultInstance]) {
    result.location =
      [[[TSSPoint builderWithPrototype:result.location] mergeFrom:value] buildPartial];
  } else {
    result.location = value;
  }
  result.hasLocation = YES;
  return self;
}
- (TSSTaffic_Builder*) clearLocation {
  result.hasLocation = NO;
  result.location = [TSSPoint defaultInstance];
  return self;
}
- (BOOL) hasSpeed {
  return result.hasSpeed;
}
- (int32_t) speed {
  return result.speed;
}
- (TSSTaffic_Builder*) setSpeed:(int32_t) value {
  result.hasSpeed = YES;
  result.speed = value;
  return self;
}
- (TSSTaffic_Builder*) clearSpeed {
  result.hasSpeed = NO;
  result.speed = 0;
  return self;
}
- (BOOL) hasDir {
  return result.hasDir;
}
- (int32_t) dir {
  return result.dir;
}
- (TSSTaffic_Builder*) setDir:(int32_t) value {
  result.hasDir = YES;
  result.dir = value;
  return self;
}
- (TSSTaffic_Builder*) clearDir {
  result.hasDir = NO;
  result.dir = 0;
  return self;
}
- (BOOL) hasDesc {
  return result.hasDesc;
}
- (NSString*) desc {
  return result.desc;
}
- (TSSTaffic_Builder*) setDesc:(NSString*) value {
  result.hasDesc = YES;
  result.desc = value;
  return self;
}
- (TSSTaffic_Builder*) clearDesc {
  result.hasDesc = NO;
  result.desc = @"";
  return self;
}
@end

