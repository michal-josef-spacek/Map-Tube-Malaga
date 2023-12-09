use strict;
use warnings;

use English;
use Map::Tube::Malaga;
use Test::More tests => 4;
use Test::NoWarnings;

# Test.
my $map = Map::Tube::Malaga->new;
eval {
	$map->get_node_by_name;
};
like($EVAL_ERROR, qr{^Map::Tube::get_node_by_name\(\): ERROR: Missing Station Name. \(status: 100\)},
	'Get node for undefined node name.');

# Test.
eval {
	$map->get_node_by_name('foo');
};
like($EVAL_ERROR, qr{^Map::Tube::get_node_by_name\(\): ERROR: Invalid Station Name \[foo\]. \(status: 101\)},
	'Get node for bad node name.');

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
