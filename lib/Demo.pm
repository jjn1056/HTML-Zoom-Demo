package Demo;

use Catalyst;

__PACKAGE__->config(
  default_view => 'HTML',
  'View::HTML' => {
    class => 'Demo::Users',
    args => {
      template_path => __PACKAGE__->path_to('templates', 'demo.html'),
    },
  });

__PACKAGE__->setup;
