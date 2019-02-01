# Polemic

[![Build Status](https://secure.travis-ci.org/evrone/polemic.png)](http://travis-ci.org/evrone/polemic)

Polemic is comments engine for Rails app. It:

- provides has_polemic method to any model
- use User model as commentator
- provides `polemic_for @your_object` helper to display the object comments in views.

<a href="https://evrone.com/?utm_source=github.com">
  <img src="https://evrone.com/logo/evrone-sponsored-logo.png"
       alt="Sponsored by Evrone" width="231">
</a>

## Getting Started
### Prerequisites

Polemic requires Rails 3.x and [Devise](https://github.com/plataformatec/devise) for user identification (surely, 
comments are not possible without users). This version of the gem is tested only with MRI 1.8.7, MRI 1.9.3, and REE.

Remember that unfortunately, Polemic reserves `Comment` for resource name.

### Installation

1. Run `rails g polemic:install` and `rake db:migrate`
2. Add `has_polemic` to your model, for example Post
3. Add `<%= polemic_for @your_object %>` to the `show` template, 
for example: `<%= polemic_for @post %>` to `app/views/posts/show.html.erb` for Post resource.

### Usage

If CanCan is enabled in your project, you will have to add some abilities for creating Comments, for example:
```ruby
can [:create, :read], Comment
```
If you have no CanCan, Polemic will not use `authorize_resource` in CommentsController.
You can use hint from [Devise Wiki](https://github.com/plataformatec/devise/wiki/How-To:-Create-Haml-and-Slim-Views) 
to directly convert Polemic ERB views to HAML.

Polemic supports theming and usage of custom views. Firstly, you should copy default views with generator: `rails generate polemic:views`

Then, you will have polemic views in `app/views/polemic/default`. Rename `default` directory to according model or controller name, for example `posts`. Don't forget to replace paths in `_comments.html.erb` view: `polemic/default/` => `polemic/posts/`

Also, you should specify the theme as param for `polemic_for` helper in the commentable object views:

`polemic_for(@post, :theme => "posts")`

## Contributing

Please read [Code of Conduct](CODE-OF-CONDUCT.md) and [Contributing Guidelines](CONTRIBUTING.md) for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, 
see the [tags on this repository](https://github.com/evrone/polemic/tags). 

## Authors

* [Kir Shatrov](https://github.com/kirs/)

See also the list of [contributors](https://github.com/evrone/polemic/contributors) who participated in this project.

## License

This project is licensed under the [MIT License](LICENSE).
