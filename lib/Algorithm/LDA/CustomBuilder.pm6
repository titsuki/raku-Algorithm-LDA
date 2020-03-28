use v6.c;
use LibraryMake;
use Distribution::Builder::MakeFromJSON;

unit class Algorithm::LDA::CustomBuilder:ver<0.0.9>:auth<cpan:TITSUKI> is Distribution::Builder::MakeFromJSON;

method build(IO() $work-dir = $*CWD) {
    my $workdir = ~$work-dir;
    my $srcdir = "$workdir/src";
    my %vars = get-vars($workdir);
    %vars<lda>.Str = $*VM.platform-library-name("lda".IO);
    mkdir "$workdir/resources" unless "$workdir/resources".IO.e;
    mkdir "$workdir/resources/libraries" unless "$workdir/resources/libraries".IO.e;
    process-makefile($srcdir, %vars);
    my $goback = $*CWD;
    chdir($srcdir);
    shell(%vars<MAKE>);
    chdir($goback);
}
