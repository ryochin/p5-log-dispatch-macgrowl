# NAME

Log::Dispatch::MacGrowl - Log messages via Growl

# SYNOPSIS

    use Log::Dispatch::MacGrowl;

    my $growl = Log::Dispatch::MacGrowl->new(
       name => 'growl',
       min_level => 'debug',
       app_name => 'MyApp',
       title => 'essential info !',
       priority => 0,
       sticky => 1,
       icon_file => '/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertCautionIcon.icns',
    );

    $growl->log( level => 'alert', message => "Hello, Again." );

# DESCRIPTION

This module allows you to pass messages to Growl using Mac::Growl.

# METHODS

- new(%p)

    This method takes a hash of parameters.  The following options are acceptable.

- name ($)

    The name of the object. Required.

- min\_level ($)

    The minimum logging level this object will accept. See the
    Log::Dispatch documentation for more information. Required.

- max\_level ($)

    The maximum logging level this object will accept. See the
    Log::Dispatch documentation for more information. This is not
    required. By default the maximum is the highest possible level (which
    means functionally that the object has no maximum).

- app\_name ($)

    The application name registered to Growl. By default,
    the package name (= Log::Dispatch::MacGrowl) will be registered.

- title ($)

    The title shown on the notification window.
    By default, the script name will be displayed.

- priority ($)

    The priority number (range from -2 for low to 2 for high) passed to Growl.
    By default, 0 (normal) will be passed.

- sticky ($)

    The stickiness (boolean value) passed to Growl.
    By default, 1 (sticky) will be passed.

- icon\_file ($)

    The icon file (.icns) path shown on each notification window.
    By default, nothing will be passed.

- log\_message( message => $ )

    Sends a message to the appropriate output. Generally this shouldn't
    be called directly but should be called through the `log()` method
    (in Log::Dispatch::Output).

# SEE ALSO

Log::Dispatch::DesktopNotification

# DEPENDENCY

Log::Dispatch, ( Cocoa::Growl | Growl::Tiny | Mac::Growl )

# REPOSITORY

https://github.com/ryochin/p5-log-dispatch-macgrowl

# AUTHOR

Ryo Okamoto <ryo@aquahill.net>

# COPYRIGHT & LICENSE

Copyright (c) Ryo Okamoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
