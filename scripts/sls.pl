#!/usr/bin/perl -w
#
#  Lists available screen sessions and offers reattachment by selection.
#

use strict;
no warnings qw(uninitialized);


my @sls = `screen -ls`;
my @session;

foreach(@sls) {
	(/ \t ([\w.-]*) /x) and push @session, $1;
}
if (scalar(@session) == 0) {
	print "No existing screen session to reattach to...\n";
	exit 0;
}

my $bar = "   --------------------------";
print "\n\tCURRENT SESSIONS\n$bar\n";

my $line = 0;
foreach(@session) {
        ++$line and printf("     $line) %18s\n", $_);
}
print "$bar\nReattach to session: ";
my $selected = <STDIN>;
defined $selected or printf "\n" and exit 0;
if ($selected =~ /^\d+/ && $selected > 0 &&
    ($selected-1) < $line) {
	my $s = $session[$selected-1];
        #print "selected screen: $s, line: $line\n";
        exec("screen -x $s");
}
exit 0;
