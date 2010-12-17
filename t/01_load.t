#

use strict;
use warnings;
use Test::More tests => 1;

BEGIN {
    use_ok('Log::Dispatch::MacGrowl');
}

diag( "Testing Log::Dispatch::MacGrowl $Log::Dispatch::MacGrowl::VERSION" );

if( eval "use Cocoa::Growl; 1" ){
    diag( "we have Cocoa::Growl." );
}
else{
    diag( "we have Mac::Growl." );
}
