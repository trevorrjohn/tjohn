require 'sinatra/base'

module Sinatra
  module Javascripts
    def js(scripts=[])
      @js ||= []
      @js << scripts
    end

    def javascripts
      js = []
      js << @js if @js

      js.flatten.uniq.map do |script|
        "<script src='#{ path_to script }'></script>"
      end.join
    end

    def path_to script
      case script.to_sym
      when :jquery then '//ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js'
      else "/assets/javascripts/" + script.to_s + '.js'
      end
    end
  end

  module StyleSheets
    def css(sheets=[])
      @css ||= ['application']
      @css << sheets
    end

    def stylesheets
        css = []
        css << @css if @css
        css.flatten.uniq.map do |stylesheet|
          "<link href='/assets/stylesheets/#{ stylesheet }.css' media='screen, projection' rel='stylesheet' />"
        end.join
    end
  end

  helpers Javascripts, StyleSheets
end
