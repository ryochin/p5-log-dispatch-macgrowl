# 

package Log::Dispatch::MacGrowl::Cocoa;

use strict;
use vars qw($VERSION);
use Cocoa::Growl ();

$VERSION = '0.01';

sub log_message {
    my $self = shift;
    my %p = @_;

    Cocoa::Growl::growl_notify(
	name => $self->_notification_name,
	icon => $self->{icon_file},
	sticky => $self->{sticky},
	priority => $self->{priority},
	title => $self->{title},
	description => $p{message},
    );
}

sub _set_global {
    my $self = shift;

    Cocoa::Growl::growl_register(
	app => $self->{app_name},
	notifications => [ $self->_notification_name ],
    );
}

1;

__END__

=encoding utf-8

=head1 NAME

Log::Dispatch::MacGrowl::Cocoa - Cocoa::Growl backend for L::D::MacGrowl

=head1 METHODS

=over 4

=item * log_message(%p)

log message.

=back

=head1 DEPENDENCY

Cocoa::Growl

=head1 AUTHOR

Ryo Okamoto E<lt>ryo@aquahill.netE<gt>

=head1 COPYRIGHT & LICENSE

Copyright (c) Ryo Okamoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut