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
    
    # def render_crumbs(crumbs, options = {})
    #   options[:format] = :html if options[:format] == nil
    #   return '' if options[:skip_if_blank] && crumbs.count < 1
    #   if options[:separator] == nil
    #     options[:separator] = " &raquo; " if options[:format] == :html 
    #     options[:separator] = "crumb" if options[:format] == :xml 
    #   end
    #   options[:links] = true if options[:links] == nil
    #   options[:first_class] ||= ''
    #   options[:last_class] ||= ''
    # 
    #   case options[:format]
    #   when :html
    #     crumb_string = crumbs.collect do |crumb|
    #       crumb_to_html(crumb, options[:links], options[:first_class], options[:last_class], (crumb == crumbs.first), (crumb == crumbs.last))
    #     end * options[:separator]
    #     crumb_string
    #   when :html_list
    #     # In html_list format there are no separator, but may be
    #     options[:separator] = "" if options[:separator] == nil
    #     # Lets set default values for special options of html_list format
    #     options[:active_li_class] = "" if options[:active_li_class] == nil
    #     options[:li_class] = "" if options[:li_class] == nil
    #     options[:ul_class] = "" if options[:ul_class] == nil
    #     options[:ul_id] = "" if options[:ul_id] == nil
    #     crumb_string = crumbs.collect do |crumb|
    #       crumb_to_html_list(crumb, options[:links], options[:li_class], options[:active_li_class], options[:first_class], options[:last_class], (crumb == crumbs.first), (crumb == crumbs.last))
    #     end * options[:separator]
    #     crumb_string = "<ul class=\"#{options[:ul_class]}\" id=\"#{options[:ul_id]}\">" + crumb_string + "</ul>"
    #     crumb_string
    #   when :xml
    #     crumbs.collect do |crumb|
    #       crumb_to_xml(crumb, options[:links], options[:separator], (crumb == crumbs.first), (crumb == crumbs.last))
    #     end * ''
    #   else
    #     raise ArgumentError, "Unknown breadcrumb output format"
    #   end
    # end
  end
end