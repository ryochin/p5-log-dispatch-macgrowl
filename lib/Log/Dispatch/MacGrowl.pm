#
# $Id: Void.pm 9 2006-07-07 02:26:41Z ryo $
#

package Log::Dispatch::MacGrowl;

use strict;
use 5.006;
use vars qw($VERSION);
use Log::Dispatch::Output;
use base qw(Log::Dispatch::Output);
use File::Basename ();
use Mac::Growl;
use Params::Validate qw(validate SCALAR BOOLEAN);
Params::Validate::validation_options( allow_extra => 1 );

$VERSION = '0.01';

sub new {
    my $param = shift;
    my $class = ref $param || $param;

    my $self = bless {}, $class;

    $self->_basic_init(@_);
    $self->_init(@_);

    return $self;
}

sub _init {
    my $self = shift;

    my $check = {
	app_name => {
	    type => SCALAR,
	    default => __PACKAGE__,
	},
	title => {
	    type => SCALAR,
	    default => File::Basename::basename( $0 ),
	},
	priority => {
	    type => SCALAR,
	    default => 0,
	    regex => qr{^\-*[0-2]$}o,
	},
	sticky => {
	    type => BOOLEAN,
	    default => 1,
	},
	icon_file => {
	    type => SCALAR,
	    default => undef,
	},
    };

    my %p = Params::Validate::validate( @_, $check );

    $self->{app_name} = $p{app_name};
    $self->{title} = $p{title};
    $self->{priority} = $p{priority} || 0;
    $self->{sticky} = defined $p{sticky} && $p{sticky} ? 1 : 0;
    $self->{icon_file} = $p{icon_file};

    $self->_set_global;

    return $self;
}

sub log_message {
    my $self = shift;
    my %p = @_;

    Mac::Growl::PostNotification( $self->{app_name}, "New Message", $self->{title}, $p{message}, $self->{sticky}, $self->{priority}, $self->{icon_file}, );
}

sub _set_global {
    my $self = shift;

    my $global = [ "New Message" ];
    Mac::Growl::RegisterNotifications( $self->{app_name}, $global, $global );
}

1;

__END__

=head1 NAME

Log::Dispatch::MacGrowl - for notifying to Growl

=head1 SYNOPSIS

 use Log::Dispatch::MacGrowl;

 my $growl = Log::Dispatch::MacGrowl->new(
    name => 'growl',
    min_level => 'debug',

    app_name => 'Log::Dispatch',
    title => 'Hey!',
    priority => 0,
    sticky => 1,
    icon_file => '/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertCautionIcon.icns',
 );

 $growl->log( level => 'alert', message => "I'm searching the city for sci-fi wasabi\n" );

=head1 DESCRIPTION

blah

=head1 METHODS

=over 4

=item * new(%p)

This method takes a hash of parameters.  The following options are acceptable.

=over 8

=item * name ($)

The name of the object. Required.

=item * min_level ($)

The minimum logging level this object will accept. See the
Log::Dispatch documentation for more information. Required.

=item * max_level ($)

The maximum logging level this obejct will accept. See the
Log::Dispatch documentation for more information. This is not
required. By default the maximum is the highest possible level (which
means functionally that the object has no maximum).

=item * app_name ($)

The Application Name registered to Growl.
By default, the package name will be registered.

=item * priority ($)

The priority number (range from -2 for low to 2 for high) passed to Growl.
By default, 0 (normal) will be passed.

=item * sticky ($)

The Stickiness (boolean) passed to Growl.
By default, 1 (sticky) will be passed.

=item * icon_file ($)

The icon file (.icns) path shown on each notification window.
By default, nothing will be passed.

=back

=item * log_message( message => $ )

Sends a message to the appropriate output. Generally this shouldn't
be called directly but should be called through the C<log()> method
(in Log::Dispatch::Output).

=head1 DEPENDENCY

Log::Dispatch, Mac::Growl

=head1 AUTHOR

Ryo Okamoto <ryo at aquahill dot net>

