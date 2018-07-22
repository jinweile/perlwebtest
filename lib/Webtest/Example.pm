package Webtest::Example;
use Mojo::Base 'Mojolicious::Controller';

use FindBin qw($Bin);
use lib "$Bin/../lib/db";
use AreaCount;

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

  my @list = AreaCount->findlist();

  # $self->res->headers->header('Content-Type' => 'text/html;charset=utf-8');
  $self->render(
    item => $list[0],
    list => [@list]
  );


  # 1/0;
}

1;
