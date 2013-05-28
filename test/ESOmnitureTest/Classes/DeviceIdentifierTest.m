#import <ESOmniture/Detail/NSUserDefaults+DeviceId.h>

@interface DeviceIdentifierTest : GHTestCase

@end


@implementation DeviceIdentifierTest

-(void)testIdentifier
{
   NSString* device_identifier_ = [ [ NSUserDefaults standardUserDefaults ] deviceIdentifier ];

   GHAssertTrue( [ device_identifier_ length ] > 0
                , @"Check device identifer length"
                );

   NSString* device_identifier2_ = [ [ NSUserDefaults standardUserDefaults ] deviceIdentifier ];

   GHAssertTrue( [ device_identifier_ isEqualToString: device_identifier2_ ]
                , @"Check equal of device identifiers"
                );

   [ NSUserDefaults resetStandardUserDefaults ];

   NSString* device_identifier3_ = [ [ NSUserDefaults standardUserDefaults ] deviceIdentifier ];

   GHAssertTrue( [ device_identifier_ isEqualToString: device_identifier3_ ]
                , @"Check equal of device identifiers after reset"
                );
}

@end
