use NetAddr::IP;
#require "IP.pm";

my @a = (
	 [ 'localhost', '127.0.0.1' ],
	 [ 0x01010101, '1.1.1.1' ],
	 [ 1, '0.0.0.1' ],
	 [ 'default', '0.0.0.0' ],
	);

my @m = (
	 [ 0, '0.0.0.0' ],
	 [ 1, '128.0.0.0' ],
	 [ 2, '192.0.0.0' ],
	 [ 4, '240.0.0.0' ],
	 [ 8, '255.0.0.0' ],
	 [ 16, '255.255.0.0' ],
	 [ 17, '255.255.128.0' ],
	 [ 24, '255.255.255.0' ],
	 [ 'default', '0.0.0.0' ],
	 [ 32, '255.255.255.255' ],
	 [ 0xffffff00, '255.255.255.0' ],
	 [ '255.255.128.0', '255.255.128.0' ],
	 [ 0b11111111111111110000000000000000, '255.255.0.0' ],
	 );

$| = 1;

print '1..', (2 * scalar @a * scalar @m), "\n";

my $count = 1;

for my $a (@a) {
    for my $m (@m) {
	my $ip = new NetAddr::IP $a->[0], $m->[0];
	if ($ip->addr eq $a->[1]) {
	    print "ok ", $count++, "\n";
	}
	else {
	    print "not ok ", $count++, "\n";
	}

	if ($ip->mask eq $m->[1]) {
	    print "ok ", $count++, "\n";
	}
	else {
	    print "not ok ", $count++, "\n";
	}

#	print "mask=", $ip->mask, "\n";

    }
}


