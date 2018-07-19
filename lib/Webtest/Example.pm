package Webtest::Example;
use Mojo::Base 'Mojolicious::Controller';
use DBI;
use Encode;

# This action will render a template
sub welcome {
  my $self = shift;

  #my $numbers = [1 .. 13];

  # Render template "example/welcome.html.ep" with message
  $self->render(
    msg => 'Welcome to the Mojolicious real-time web framework!'
    #numbers => $numbers
  );
}

sub index {
  my $self = shift;

  # my @numbers = [1 .. 13];

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

  foreach my $item (@list) {
    print $item->{"area_code"}."|".$item->{"area_nums"}."|".$item->{"area_name"}."\n";
  }

  $self->res->headers->header('Content-Type' => 'text/html;charset=utf-8');
  $self->render(
    # numbers => @numbers
    item => $list[0],
    list => [@list]
  );

  $sth->finish;#结束句柄
  $dbh->disconnect;#断开

  # 1/0;
}

1;
