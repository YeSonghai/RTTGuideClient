// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class TSS_CityTraffic;
@class TSS_CityTraffic_Builder;
@class TSS_DrivingRoute;
@class TSS_DrivingRoute_Builder;
@class TSS_DrivingRoute_RoadAndPoint;
@class TSS_DrivingRoute_RoadAndPoint_Builder;
@class TSS_Line;
@class TSS_Line_Builder;
@class TSS_Point;
@class TSS_Point_Builder;
@class TSS_RoadTraffic;
@class TSS_RoadTraffic_Builder;
@class TSS_SegmentTraffic;
@class TSS_SegmentTraffic_Builder;

@interface TssRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface TSS_Point : PBGeneratedMessage {
@private
  BOOL hasLon_:1;
  BOOL hasLat_:1;
  Float64 lon;
  Float64 lat;
}
- (BOOL) hasLon;
- (BOOL) hasLat;
@property (readonly) Float64 lon;
@property (readonly) Float64 lat;

+ (TSS_Point*) defaultInstance;
- (TSS_Point*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (TSS_Point_Builder*) builder;
+ (TSS_Point_Builder*) builder;
+ (TSS_Point_Builder*) builderWithPrototype:(TSS_Point*) prototype;

+ (TSS_Point*) parseFromData:(NSData*) data;
+ (TSS_Point*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_Point*) parseFromInputStream:(NSInputStream*) input;
+ (TSS_Point*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_Point*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (TSS_Point*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface TSS_Point_Builder : PBGeneratedMessage_Builder {
@private
  TSS_Point* result;
}

- (TSS_Point*) defaultInstance;

- (TSS_Point_Builder*) clear;
- (TSS_Point_Builder*) clone;

- (TSS_Point*) build;
- (TSS_Point*) buildPartial;

- (TSS_Point_Builder*) mergeFrom:(TSS_Point*) other;
- (TSS_Point_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (TSS_Point_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasLon;
- (Float64) lon;
- (TSS_Point_Builder*) setLon:(Float64) value;
- (TSS_Point_Builder*) clearLon;

- (BOOL) hasLat;
- (Float64) lat;
- (TSS_Point_Builder*) setLat:(Float64) value;
- (TSS_Point_Builder*) clearLat;
@end

@interface TSS_Line : PBGeneratedMessage {
@private
  BOOL hasStart_:1;
  BOOL hasEnd_:1;
  TSS_Point* start;
  TSS_Point* end;
}
- (BOOL) hasStart;
- (BOOL) hasEnd;
@property (readonly, retain) TSS_Point* start;
@property (readonly, retain) TSS_Point* end;

+ (TSS_Line*) defaultInstance;
- (TSS_Line*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (TSS_Line_Builder*) builder;
+ (TSS_Line_Builder*) builder;
+ (TSS_Line_Builder*) builderWithPrototype:(TSS_Line*) prototype;

+ (TSS_Line*) parseFromData:(NSData*) data;
+ (TSS_Line*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_Line*) parseFromInputStream:(NSInputStream*) input;
+ (TSS_Line*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_Line*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (TSS_Line*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface TSS_Line_Builder : PBGeneratedMessage_Builder {
@private
  TSS_Line* result;
}

- (TSS_Line*) defaultInstance;

- (TSS_Line_Builder*) clear;
- (TSS_Line_Builder*) clone;

- (TSS_Line*) build;
- (TSS_Line*) buildPartial;

- (TSS_Line_Builder*) mergeFrom:(TSS_Line*) other;
- (TSS_Line_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (TSS_Line_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasStart;
- (TSS_Point*) start;
- (TSS_Line_Builder*) setStart:(TSS_Point*) value;
- (TSS_Line_Builder*) setStartBuilder:(TSS_Point_Builder*) builderForValue;
- (TSS_Line_Builder*) mergeStart:(TSS_Point*) value;
- (TSS_Line_Builder*) clearStart;

- (BOOL) hasEnd;
- (TSS_Point*) end;
- (TSS_Line_Builder*) setEnd:(TSS_Point*) value;
- (TSS_Line_Builder*) setEndBuilder:(TSS_Point_Builder*) builderForValue;
- (TSS_Line_Builder*) mergeEnd:(TSS_Point*) value;
- (TSS_Line_Builder*) clearEnd;
@end

@interface TSS_DrivingRoute : PBGeneratedMessage {
@private
  BOOL hasStart_:1;
  TSS_Point* start;
  NSMutableArray* mutableSegmentList;
}
- (BOOL) hasStart;
@property (readonly, retain) TSS_Point* start;
- (NSArray*) segmentList;
- (TSS_DrivingRoute_RoadAndPoint*) segmentAtIndex:(int32_t) index;

+ (TSS_DrivingRoute*) defaultInstance;
- (TSS_DrivingRoute*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (TSS_DrivingRoute_Builder*) builder;
+ (TSS_DrivingRoute_Builder*) builder;
+ (TSS_DrivingRoute_Builder*) builderWithPrototype:(TSS_DrivingRoute*) prototype;

+ (TSS_DrivingRoute*) parseFromData:(NSData*) data;
+ (TSS_DrivingRoute*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_DrivingRoute*) parseFromInputStream:(NSInputStream*) input;
+ (TSS_DrivingRoute*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_DrivingRoute*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (TSS_DrivingRoute*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface TSS_DrivingRoute_RoadAndPoint : PBGeneratedMessage {
@private
  BOOL hasRoad_:1;
  BOOL hasEnd_:1;
  NSString* road;
  TSS_Point* end;
}
- (BOOL) hasRoad;
- (BOOL) hasEnd;
@property (readonly, retain) NSString* road;
@property (readonly, retain) TSS_Point* end;

+ (TSS_DrivingRoute_RoadAndPoint*) defaultInstance;
- (TSS_DrivingRoute_RoadAndPoint*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (TSS_DrivingRoute_RoadAndPoint_Builder*) builder;
+ (TSS_DrivingRoute_RoadAndPoint_Builder*) builder;
+ (TSS_DrivingRoute_RoadAndPoint_Builder*) builderWithPrototype:(TSS_DrivingRoute_RoadAndPoint*) prototype;

+ (TSS_DrivingRoute_RoadAndPoint*) parseFromData:(NSData*) data;
+ (TSS_DrivingRoute_RoadAndPoint*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_DrivingRoute_RoadAndPoint*) parseFromInputStream:(NSInputStream*) input;
+ (TSS_DrivingRoute_RoadAndPoint*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_DrivingRoute_RoadAndPoint*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (TSS_DrivingRoute_RoadAndPoint*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface TSS_DrivingRoute_RoadAndPoint_Builder : PBGeneratedMessage_Builder {
@private
  TSS_DrivingRoute_RoadAndPoint* result;
}

- (TSS_DrivingRoute_RoadAndPoint*) defaultInstance;

- (TSS_DrivingRoute_RoadAndPoint_Builder*) clear;
- (TSS_DrivingRoute_RoadAndPoint_Builder*) clone;

- (TSS_DrivingRoute_RoadAndPoint*) build;
- (TSS_DrivingRoute_RoadAndPoint*) buildPartial;

- (TSS_DrivingRoute_RoadAndPoint_Builder*) mergeFrom:(TSS_DrivingRoute_RoadAndPoint*) other;
- (TSS_DrivingRoute_RoadAndPoint_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (TSS_DrivingRoute_RoadAndPoint_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasRoad;
- (NSString*) road;
- (TSS_DrivingRoute_RoadAndPoint_Builder*) setRoad:(NSString*) value;
- (TSS_DrivingRoute_RoadAndPoint_Builder*) clearRoad;

- (BOOL) hasEnd;
- (TSS_Point*) end;
- (TSS_DrivingRoute_RoadAndPoint_Builder*) setEnd:(TSS_Point*) value;
- (TSS_DrivingRoute_RoadAndPoint_Builder*) setEndBuilder:(TSS_Point_Builder*) builderForValue;
- (TSS_DrivingRoute_RoadAndPoint_Builder*) mergeEnd:(TSS_Point*) value;
- (TSS_DrivingRoute_RoadAndPoint_Builder*) clearEnd;
@end

@interface TSS_DrivingRoute_Builder : PBGeneratedMessage_Builder {
@private
  TSS_DrivingRoute* result;
}

- (TSS_DrivingRoute*) defaultInstance;

- (TSS_DrivingRoute_Builder*) clear;
- (TSS_DrivingRoute_Builder*) clone;

- (TSS_DrivingRoute*) build;
- (TSS_DrivingRoute*) buildPartial;

- (TSS_DrivingRoute_Builder*) mergeFrom:(TSS_DrivingRoute*) other;
- (TSS_DrivingRoute_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (TSS_DrivingRoute_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasStart;
- (TSS_Point*) start;
- (TSS_DrivingRoute_Builder*) setStart:(TSS_Point*) value;
- (TSS_DrivingRoute_Builder*) setStartBuilder:(TSS_Point_Builder*) builderForValue;
- (TSS_DrivingRoute_Builder*) mergeStart:(TSS_Point*) value;
- (TSS_DrivingRoute_Builder*) clearStart;

- (NSArray*) segmentList;
- (TSS_DrivingRoute_RoadAndPoint*) segmentAtIndex:(int32_t) index;
- (TSS_DrivingRoute_Builder*) replaceSegmentAtIndex:(int32_t) index with:(TSS_DrivingRoute_RoadAndPoint*) value;
- (TSS_DrivingRoute_Builder*) addSegment:(TSS_DrivingRoute_RoadAndPoint*) value;
- (TSS_DrivingRoute_Builder*) addAllSegment:(NSArray*) values;
- (TSS_DrivingRoute_Builder*) clearSegmentList;
@end

@interface TSS_SegmentTraffic : PBGeneratedMessage {
@private
  BOOL hasDirection_:1;
  BOOL hasSpeed_:1;
  BOOL hasDetails_:1;
  BOOL hasSegment_:1;
  BOOL hasLocation_:1;
  int32_t direction;
  int32_t speed;
  NSString* details;
  TSS_Line* segment;
  TSS_Point* location;
}
- (BOOL) hasSegment;
- (BOOL) hasLocation;
- (BOOL) hasDirection;
- (BOOL) hasSpeed;
- (BOOL) hasDetails;
@property (readonly, retain) TSS_Line* segment;
@property (readonly, retain) TSS_Point* location;
@property (readonly) int32_t direction;
@property (readonly) int32_t speed;
@property (readonly, retain) NSString* details;

+ (TSS_SegmentTraffic*) defaultInstance;
- (TSS_SegmentTraffic*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (TSS_SegmentTraffic_Builder*) builder;
+ (TSS_SegmentTraffic_Builder*) builder;
+ (TSS_SegmentTraffic_Builder*) builderWithPrototype:(TSS_SegmentTraffic*) prototype;

+ (TSS_SegmentTraffic*) parseFromData:(NSData*) data;
+ (TSS_SegmentTraffic*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_SegmentTraffic*) parseFromInputStream:(NSInputStream*) input;
+ (TSS_SegmentTraffic*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_SegmentTraffic*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (TSS_SegmentTraffic*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface TSS_SegmentTraffic_Builder : PBGeneratedMessage_Builder {
@private
  TSS_SegmentTraffic* result;
}

- (TSS_SegmentTraffic*) defaultInstance;

- (TSS_SegmentTraffic_Builder*) clear;
- (TSS_SegmentTraffic_Builder*) clone;

- (TSS_SegmentTraffic*) build;
- (TSS_SegmentTraffic*) buildPartial;

- (TSS_SegmentTraffic_Builder*) mergeFrom:(TSS_SegmentTraffic*) other;
- (TSS_SegmentTraffic_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (TSS_SegmentTraffic_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasSegment;
- (TSS_Line*) segment;
- (TSS_SegmentTraffic_Builder*) setSegment:(TSS_Line*) value;
- (TSS_SegmentTraffic_Builder*) setSegmentBuilder:(TSS_Line_Builder*) builderForValue;
- (TSS_SegmentTraffic_Builder*) mergeSegment:(TSS_Line*) value;
- (TSS_SegmentTraffic_Builder*) clearSegment;

- (BOOL) hasLocation;
- (TSS_Point*) location;
- (TSS_SegmentTraffic_Builder*) setLocation:(TSS_Point*) value;
- (TSS_SegmentTraffic_Builder*) setLocationBuilder:(TSS_Point_Builder*) builderForValue;
- (TSS_SegmentTraffic_Builder*) mergeLocation:(TSS_Point*) value;
- (TSS_SegmentTraffic_Builder*) clearLocation;

- (BOOL) hasDirection;
- (int32_t) direction;
- (TSS_SegmentTraffic_Builder*) setDirection:(int32_t) value;
- (TSS_SegmentTraffic_Builder*) clearDirection;

- (BOOL) hasSpeed;
- (int32_t) speed;
- (TSS_SegmentTraffic_Builder*) setSpeed:(int32_t) value;
- (TSS_SegmentTraffic_Builder*) clearSpeed;

- (BOOL) hasDetails;
- (NSString*) details;
- (TSS_SegmentTraffic_Builder*) setDetails:(NSString*) value;
- (TSS_SegmentTraffic_Builder*) clearDetails;
@end

@interface TSS_RoadTraffic : PBGeneratedMessage {
@private
  BOOL hasRoad_:1;
  BOOL hasDesc_:1;
  NSString* road;
  NSString* desc;
  NSMutableArray* mutableSegmenttrafficList;
}
- (BOOL) hasRoad;
- (BOOL) hasDesc;
@property (readonly, retain) NSString* road;
@property (readonly, retain) NSString* desc;
- (NSArray*) segmenttrafficList;
- (TSS_SegmentTraffic*) segmenttrafficAtIndex:(int32_t) index;

+ (TSS_RoadTraffic*) defaultInstance;
- (TSS_RoadTraffic*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (TSS_RoadTraffic_Builder*) builder;
+ (TSS_RoadTraffic_Builder*) builder;
+ (TSS_RoadTraffic_Builder*) builderWithPrototype:(TSS_RoadTraffic*) prototype;

+ (TSS_RoadTraffic*) parseFromData:(NSData*) data;
+ (TSS_RoadTraffic*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_RoadTraffic*) parseFromInputStream:(NSInputStream*) input;
+ (TSS_RoadTraffic*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_RoadTraffic*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (TSS_RoadTraffic*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface TSS_RoadTraffic_Builder : PBGeneratedMessage_Builder {
@private
  TSS_RoadTraffic* result;
}

- (TSS_RoadTraffic*) defaultInstance;

- (TSS_RoadTraffic_Builder*) clear;
- (TSS_RoadTraffic_Builder*) clone;

- (TSS_RoadTraffic*) build;
- (TSS_RoadTraffic*) buildPartial;

- (TSS_RoadTraffic_Builder*) mergeFrom:(TSS_RoadTraffic*) other;
- (TSS_RoadTraffic_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (TSS_RoadTraffic_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasRoad;
- (NSString*) road;
- (TSS_RoadTraffic_Builder*) setRoad:(NSString*) value;
- (TSS_RoadTraffic_Builder*) clearRoad;

- (BOOL) hasDesc;
- (NSString*) desc;
- (TSS_RoadTraffic_Builder*) setDesc:(NSString*) value;
- (TSS_RoadTraffic_Builder*) clearDesc;

- (NSArray*) segmenttrafficList;
- (TSS_SegmentTraffic*) segmenttrafficAtIndex:(int32_t) index;
- (TSS_RoadTraffic_Builder*) replaceSegmenttrafficAtIndex:(int32_t) index with:(TSS_SegmentTraffic*) value;
- (TSS_RoadTraffic_Builder*) addSegmenttraffic:(TSS_SegmentTraffic*) value;
- (TSS_RoadTraffic_Builder*) addAllSegmenttraffic:(NSArray*) values;
- (TSS_RoadTraffic_Builder*) clearSegmenttrafficList;
@end

@interface TSS_CityTraffic : PBGeneratedMessage {
@private
  BOOL hasRecorded_:1;
  BOOL hasCity_:1;
  int32_t recorded;
  NSString* city;
  NSMutableArray* mutableRoadtrafficList;
}
- (BOOL) hasCity;
- (BOOL) hasRecorded;
@property (readonly, retain) NSString* city;
@property (readonly) int32_t recorded;
- (NSArray*) roadtrafficList;
- (TSS_RoadTraffic*) roadtrafficAtIndex:(int32_t) index;

+ (TSS_CityTraffic*) defaultInstance;
- (TSS_CityTraffic*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (TSS_CityTraffic_Builder*) builder;
+ (TSS_CityTraffic_Builder*) builder;
+ (TSS_CityTraffic_Builder*) builderWithPrototype:(TSS_CityTraffic*) prototype;

+ (TSS_CityTraffic*) parseFromData:(NSData*) data;
+ (TSS_CityTraffic*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_CityTraffic*) parseFromInputStream:(NSInputStream*) input;
+ (TSS_CityTraffic*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TSS_CityTraffic*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (TSS_CityTraffic*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface TSS_CityTraffic_Builder : PBGeneratedMessage_Builder {
@private
  TSS_CityTraffic* result;
}

- (TSS_CityTraffic*) defaultInstance;

- (TSS_CityTraffic_Builder*) clear;
- (TSS_CityTraffic_Builder*) clone;

- (TSS_CityTraffic*) build;
- (TSS_CityTraffic*) buildPartial;

- (TSS_CityTraffic_Builder*) mergeFrom:(TSS_CityTraffic*) other;
- (TSS_CityTraffic_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (TSS_CityTraffic_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCity;
- (NSString*) city;
- (TSS_CityTraffic_Builder*) setCity:(NSString*) value;
- (TSS_CityTraffic_Builder*) clearCity;

- (BOOL) hasRecorded;
- (int32_t) recorded;
- (TSS_CityTraffic_Builder*) setRecorded:(int32_t) value;
- (TSS_CityTraffic_Builder*) clearRecorded;

- (NSArray*) roadtrafficList;
- (TSS_RoadTraffic*) roadtrafficAtIndex:(int32_t) index;
- (TSS_CityTraffic_Builder*) replaceRoadtrafficAtIndex:(int32_t) index with:(TSS_RoadTraffic*) value;
- (TSS_CityTraffic_Builder*) addRoadtraffic:(TSS_RoadTraffic*) value;
- (TSS_CityTraffic_Builder*) addAllRoadtraffic:(NSArray*) values;
- (TSS_CityTraffic_Builder*) clearRoadtrafficList;
@end

