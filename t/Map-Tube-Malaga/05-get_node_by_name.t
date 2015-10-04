# Pragmas.
use strict;
use warnings;

# Modules.
use Map::Tube::Malaga;
use Test::More tests => 3;
use Test::NoWarnings;

# Test.
my $map = Map::Tube::Malaga->new;
my $ret = $map->get_node_by_name('foo');
is($ret, undef, 'Get node for bad node name.');

# Test.
my @ret = sort map { $_->id } $map->get_node_by_name('El Perchel');
is_deeply(
	\@ret,
	[
		'L1-01',
		'L2-01',
	],
	"Get all nodes for 'El Perchel'.",
);
