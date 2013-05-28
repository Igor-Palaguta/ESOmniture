#import "NSUserDefaults+DeviceId.h"

static NSString* ESDeviceIdentifier = @"ESOmniture.DeviceId";

@implementation NSUserDefaults (DeviceId)

-(NSString*)generateDeviceIdentifier
{
   CFUUIDRef uuid_ = CFUUIDCreate( 0 );
   NSString* identifier_ = (NSString *)CFBridgingRelease(CFUUIDCreateString( 0, uuid_ ));
   CFRelease( uuid_ );
   return identifier_;
}

-(NSString*)deviceIdentifier
{
   NSString* identifier_ = [ self stringForKey: ESDeviceIdentifier ];
   if ( !identifier_ )
   {
      identifier_ = [ self generateDeviceIdentifier ];
      [ self setObject: identifier_ forKey: ESDeviceIdentifier ];
      [ self synchronize ];
   }

   return identifier_;
}

@end
