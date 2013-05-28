#import "NSString+OmnitureEscape.h"

@implementation NSString (OmnitureEscape)

-(NSString*)stringByAddingOmnitureEscapes
{
   NSString* unsafe_ = @" <>#%'\";?:&=+$,{}|\\^~[]`!()";
   NSString* result_ = (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault
                                                                          , (__bridge CFStringRef)self
                                                                          , NULL
                                                                          , (__bridge CFStringRef)unsafe_
                                                                          , kCFStringEncodingUTF8 ));

   return result_;
}

@end
