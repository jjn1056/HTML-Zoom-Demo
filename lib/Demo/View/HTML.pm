package Demo::View::HTML;

use base 'Catalyst::Model::Factory::PerRequest';
use Demo;

__PACKAGE__->config(
  class => 'Demo::Users',
  args => {
    template_path => Demo->path_to('templates', 'demo.html')});
