module ApplicationHelper

  def formatize text
    return "" if text.nil?
    
    text = text.gsub(/<image (\S+)>/) {
      begin
        image = Image.find("#{$1}")
        image_tag image.image.url(:thumb)
      rescue
        "<strong>Image with id #{$1} not found.</strong>"
      end      
    }

    text.html_safe
  end

end
