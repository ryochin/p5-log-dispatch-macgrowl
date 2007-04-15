use 5.005;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Log::Dispatch::MacGrowl',
    VERSION_FROM      => 'lib/Log/Dispatch/MacGrowl.pm', # finds $VERSION
    PREREQ_PM         => {
	Log::Dispatch => 0.01,
	Mac::Growl => 0.01,
    }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Log/Dispatch/MacGrowl.pm', # retrieve abstract from module
       AUTHOR         => 'Ryo Okamoto <ryo at aquahill dot net>') : ()),
);
