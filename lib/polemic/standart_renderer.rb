# encoding: utf-8
require 'action_controller'
require 'action_controller/railtie'
require 'action_view/railtie'

module Polemic
  class StandardRenderer
    include ::ActionView::Context
    # include ActionView::Helpers::UrlHelper
    # include ActionView::Helpers::TagHelper unless self.included_modules.include?(ActionView::Helpers::TagHelper)

    def initialize(template)
      @template = template
    end
    
    # TODO implement logging
    # see https://github.com/amatsuda/kaminari/blob/master/lib/kaminari/helpers/paginator.rb#L76
    def render_comments(commentable, options = {})
      theme = options.delete(:theme) || "default"
      @template.render(:partial => "polemic/#{theme}/comments", :locals => { :comments => commentable.comments.includes(:user), :commentable => commentable })
    end
  end
end