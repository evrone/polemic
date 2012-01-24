module Polemic
  module ViewMethods
    def polemic_for(*options)
      commentable_object = options[0]
      raise "You should pass object, for which you want to show comments." unless commentable_object
      @_renderer ||= Polemic::StandardRenderer.new(self)
      @_renderer.render_comments(commentable_object, options[1] || {})
    end
  end
end