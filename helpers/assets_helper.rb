module Assets
  def js(scripts=[])
    @js ||= []
    if scripts.include? "jquery"
      @js << "//ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"
      scripts.delete "jquery"
    end

    scripts.each { |script| @js << "/assets/javascripts/" + script }
  end

  def javascripts
    js = []
    js << @js if @js

    js.flatten.uniq.map do |script|
      "<script src='#{ script }'></script>"
    end.join
  end
end
