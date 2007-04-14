#
# $Id: Void.pm 9 2006-07-07 02:26:41Z ryo $
#

use strict;
use warnings;
use Test::More;

eval "use Test::Pod::Coverage 1.06";
plan skip_all => "Test::Pod::Coverage 1.06 required for testing POD coverage"
	if $@;
all_pod_coverage_ok();

