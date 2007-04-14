#
# $Id: Void.pm 9 2006-07-07 02:26:41Z ryo $
#

use strict;
use warnings;
use Test::More tests => 6;

BEGIN {
  use_ok('Log::Dispatch');
  use_ok('Log::Dispatch::MacGrowl');
}

# 1
{
  my $dispatcher = Log::Dispatch::MacGrowl->new(
    name => 'growl',
    app_name => undef,
    min_level => 'debug',
    title => '* This is test.',
    priority => -1,
    icon_file => '/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertCautionIcon.icns',
    sticky => 0,
  );

  ok($dispatcher, 'new');

  eval {
    $dispatcher->log(
      level => 'debug',
      message  => "hi!",
    );
  };
  ok( ! $@, 'call 1');

  eval {
    $dispatcher->log(
      level => 'info',
      message  => "dinner",
    );
  };
  ok( ! $@, 'call 2');

  eval {
    $dispatcher->log(
      level    => 'emergency',
      message  => "dinner",
    );
  };
  ok( ! $@, 'call 3');
}
