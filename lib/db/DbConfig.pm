package DbConfig;

use lib "$Bin/../lib/db";

# must set dsn user password to globle var
our $dsn = "DBI:mysql:database=openapi;host=localhost";
our $user = 'root';
our $password = '123456';