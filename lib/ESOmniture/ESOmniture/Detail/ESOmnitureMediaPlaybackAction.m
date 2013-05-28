#import "ESOmnitureMediaPlaybackAction.h"

#import "ESOmniture.h"

@interface ESOmnitureMediaPlaybackAction ()

@property ( nonatomic, assign ) ESOmnitureMediaActionType type;
@property ( nonatomic, assign ) NSTimeInterval offset;
@property ( nonatomic, strong ) NSString* reportType;

@end


@implementation ESOmnitureMediaPlaybackAction

@synthesize type = _type;
@synthesize offset = _offset;
@synthesize reportType = _report_type;


-(id)initWithType:( ESOmnitureMediaActionType )type_
           offset:( NSTimeInterval )offset_
       reportType:( NSString* )report_type_
{
   if ( !( self = [ super init ] ) )
      return nil;

   self.type = type_;
   self.offset = offset_;
   self.reportType = report_type_;

   return self;
}

+(id)trackActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ self alloc ] initWithType: ESOmnitureMediaActionTrack
                                 offset: offset_
                             reportType: ESOmnitureVideoReportOthers ];
}

+(id)openActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ self alloc ] initWithType: ESOmnitureMediaActionPlay
                                 offset: offset_
                             reportType: ESOmnitureVideoReportStart ];
}

+(id)playActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ self alloc ] initWithType: ESOmnitureMediaActionPlay
                                 offset: offset_
                             reportType: ESOmnitureVideoReportOthers ];
}

+(id)stopActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ self alloc ] initWithType: ESOmnitureMediaActionStop
                                 offset: offset_
                             reportType: ESOmnitureVideoReportOthers ];
}

-(NSString*)description
{
   //offset 1 second = 0 second in omniture format
   NSTimeInterval omniture_offset_ = self.offset >= 1.0 ? self.offset - 1.0 : self.offset;

   return [ NSString stringWithFormat: @"%c%d", self.type, (int)omniture_offset_ ];
}

@end
