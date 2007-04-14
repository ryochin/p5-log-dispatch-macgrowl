#
# $Id: Void.pm 9 2006-07-07 02:26:41Z ryo $
#

use strict;
use warnings;
use Test::More tests => 1;

BEGIN {
  use_ok('Log::Dispatch::MacGrowl');
}

diag( "Testing Log::Dispatch::MacGrowl $Log::Dispatch::MacGrowl::VERSION" );

