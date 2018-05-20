require 'erb'
require_relative 'view/plain'
require_relative 'view/html'

module Simpler
  class View

    VIEW_BASE_PATH = 'app/views'.freeze

    def initialize(env, type)
      @env = env
      @type = type
    end

    def render(binding)
      view_render.result(binding)
    end

    private

    def controller
      @env['simpler.controller']
    end

    def action
      @env['simpler.action']
    end

    def template
      @env['simpler.template']
    end

    def template_path
      path = template || [controller.name, action].join('/')
      view = "#{path}.html.erb"
      @env['simpler.view'] = view

      Simpler.root.join(VIEW_BASE_PATH, view)
    end

    def view_render
      case @type
      when 'plain' then PlainRender.new(template)
      else HtmlRender.new(template_path)
      end
    end

  end
end
