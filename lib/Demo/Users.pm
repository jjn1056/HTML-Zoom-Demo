use strict;
use warnings;

package Demo::Users; 

use base 'Plack::Component';
use Plack::Util::Accessor qw( title users template_path );
use HTML::Zoom;
use HTML::Zoom::CodeStream;

sub call {
  my ($self, $env) = @_;
  my @users = @{$self->users};
  my $zoom = HTML::Zoom
    ->from_file($self->template_path)  ## Note, Zoom should allow read fro nonblocking IO
    ->replace_content(title => $self->title)
    ->select('ul')->repeat_content(sub {
      HTML::Zoom::CodeStream->new({
          code => sub {
            while( my $user = shift @users) {
              return sub { $_->replace_content(li => $user) };
            }
          return;
        }
      })
    }, {flush_before=>1});

  return [200, ['Content-Type' => 'text/html'], $zoom->to_fh];
}

1;
