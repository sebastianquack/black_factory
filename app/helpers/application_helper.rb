module ApplicationHelper

  def formatize text
    return "" if text.nil?
    
    text = text.gsub(/<image (\S+)>/) {
      begin
        image = Image.find("#{$1}")
        link_to image.image.url(:large), :title => (image.description if image.description)  do 
	        	image_tag image.image.url(:thumb), :class => "image-modal", :title => (image.description if image.description) 
		    end
      rescue
        "<strong>Image with id #{$1} not found.</strong>"
      end      
    }

    text.html_safe
  end

end
