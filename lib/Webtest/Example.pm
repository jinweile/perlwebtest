package Webtest::Example;
use Mojo::Base 'Mojolicious::Controller';
use DBI;

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
  my $ary = $sth->fetchrow_hashref();

  $self->render(
    # numbers => @numbers
    ary => $ary
  );

  $sth->finish;#结束句柄
  $dbh->disconnect;#断开
}

1;
