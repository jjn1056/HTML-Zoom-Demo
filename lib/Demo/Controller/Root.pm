package Demo::Controller::Root;

use base 'Catalyst::Controller';

sub users :Local {
  my ($self, $c) = @_;
  $c->view->title("My Title");
  $c->view->users([qw/John Joe Mary/]);
  $c->res->from_psgi_response(
    $c->view->to_app->(
      $c->req->env));
}

__PACKAGE__->config(namespace => '');
