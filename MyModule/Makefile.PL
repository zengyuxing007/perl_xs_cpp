use 5.016003;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my $CC = 'g++';

WriteMakefile(
    NAME              => 'MyModule',
    VERSION_FROM      => 'lib/MyModule.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/MyModule.pm', # retrieve abstract from module
       AUTHOR         => 'Yuxing Zeng <zeng.yuxing@local>') : ()),
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '-Wno-deprecated', # e.g., '-DHAVE_SOMETHING'
    'CC'                => $CC,
    'LD'                => '$(CC)',
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too

    'XSOPT'             => '-C++',
    'TYPEMAPS'          => ['perlobject.map' ],
);
