#Polemic

Polemic is a young comments system for Rails app. It:

- provides Comment model to developer

##Requirements and recommendations

Polemic requires Rails 3.x and [Devise](https://github.com/plataformatec/devise) for user identification (surely, messaging system is not possible without users). Now the gem is tested only with Ruby 1.8.7 and REE.

We recommend to use Polemic with [Faye](https://github.com/jcoglan/faye), because this combination it's really sexy.

Remember that unfortunately, Polemic reserve `Comment` for resource name.

##Installation

1. Run `rails g polemic:install`

##Todo

- Add RSpec tests

##Authors

- [Kir Shatrov](https://github.com/kirs/) (Evrone Company)

##Feel free for pull requests!