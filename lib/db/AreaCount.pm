package AreaCount;

use DBI;
use Encode;

# find areacount list
sub findlist {
  my $dsn = "DBI:mysql:database=openapi;host=192.168.0.141";
  my $user = 'root';
  my $password = '123456';

  my ($dbh,$sth);
  $dbh = DBI->connect($dsn,$user,$password);#连接数据库
  $sth = $dbh->prepare("select * from area_count");#准备
  $sth->execute();#执行

  my @list = ();
  while(my $item = $sth->fetchrow_hashref()) {
    $item->{"area_name"} = decode_utf8($item->{"area_name"});
    push @list, $item;
  }

  $sth->finish;#结束句柄
  $dbh->disconnect;#断开

  foreach my $item (@list) {
    print $item->{"area_code"}."|"
    .$item->{"area_nums"}."|"
    .$item->{"area_name"}."\n";
  }

  @list;
}

1;