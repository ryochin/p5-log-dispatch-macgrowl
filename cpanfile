requires 'Cocoa::Growl', '0.03';
requires 'Log::Dispatch';

recommends 'Growl::Tiny', 'v0.0.2';

on build => sub {
    requires 'Test::More', 0.88;
};
