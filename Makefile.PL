use 5.006;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME          => 'Lingua::EN::FindNumber',
	VERSION_FROM  => 'lib/Lingua/EN/FindNumber.pm',
	ABSTRACT_FROM => 'lib/Lingua/EN/FindNumber.pm',
	AUTHOR        => 'Tony Bowden',
	PREREQ_PM     => { 'Lingua::EN::Words2Nums' => 0 },
);
