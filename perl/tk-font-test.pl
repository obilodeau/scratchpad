# taken from: http://docstore.mik.ua/orelly/perl3/tk/ch03_01.htm
use Tk;
use Tk::BrowseEntry;

use strict;
use warnings;

my $mw = MainWindow->new(-title => 'Font Viewer');
my $f = $mw->Frame->pack(-side => 'top');

my $data = "String";

my @fonts = (
    "{bitstream charter} 36 bold",
    "{bitstream charter} 36",
    "fixed 36",
    "{courier 10 pitch} 36",
    "courier 36",
    "gothic 36",
    "terminal 36",
);

foreach my $font (@fonts) {
    $f->Button(-text => $font, -font => $font)->pack(-side => 'bottom');
}

MainLoop;
