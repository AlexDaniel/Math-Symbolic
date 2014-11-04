#!/usr/bin/env perl6

use v6;

# simple command-line interface for testing
# may eventually flesh out into a useful console script in bin/
# a few other front ends eventually could be cool
    # REPL
    # GUI analyzer/solver/teacher
    # a daemon for long-running searches of complex problem spaces
        # persistence
        # pause/resume
        # throttle
        # concurrency
        # clusterable
    # each of these applications is also a good source of feature ideas for the module itself

use lib $?FILE.IO.parent.child('lib');

use Math::Symbolic;

sub MAIN ($expr, $var?, *%vals) {
    my $obj = Math::Symbolic.new($expr);
    #say ~$obj;
    #$obj.dump_tree;

    $obj.isolate($var) if defined $var;
    #$obj.dump_tree;

    $obj.evaluate(|%vals) if %vals;
    #$obj.dump_tree;

    say ~$obj;
}


