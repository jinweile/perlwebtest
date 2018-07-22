package DbConfig;

use lib "$Bin/../lib/db";

# must set dsn user password to globle var
our $dsn = "DBI:mysql:database=openapi;host=192.168.0.141";
our $user = 'root';
our $password = '123456';