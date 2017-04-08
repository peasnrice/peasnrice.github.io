require 'RMagick'
include Magick

# specify image widths you want
# thumbnail_widths will generate square images for thumbnails
# image_widths will create resized images with maintainted aspect ratios
thumbnail_widths = [200]
image_widths = [640,1024,2048]

# create directory to store resized images
Dir.mkdir '_resized_images/' unless File.exists?('_resized_images')

# store file name sin array
image_filenames = Dir.entries(".").select{ |x| x[/.(jpe?g|png)/] }

# iterate over file names converting to resolutions specified in array up top
image_filenames.each { |image| image 
    img = ImageList.new(image)
    image_widths.each { |x| 
        new_file_name = image.dup
        new_file_name = new_file_name.sub! ".jpg", "-" + x.to_s + ".jpg"
        new_file_name.gsub!(/\s/,'-')
        img.resize_to_fit(x).write("_resized_images/" + new_file_name) { 
            self.compression = JPEGCompression; 
            self.quality = 85; 
            self.sampling_factor = "4x2"; 
            self.interlace = JPEGInterlace;
        }
    }
    thumbnail_widths.each { |y| 
        new_file_name = image.dup
        new_file_name = new_file_name.sub! '.jpg', "-" + y.to_s + "x" + y.to_s + ".jpg" 
        new_file_name.gsub!(/\s/,'-')
        img.resize_to_fill(y).write("_resized_images/" + new_file_name) { 
            self.compression = JPEGCompression; 
            self.quality = 85; 
            self.sampling_factor = "4x2"; 
            self.interlace = JPEGInterlace; 
        }
    }
    # clone originals for people that just want to watch the world burn
    new_file_name = image.dup
    new_file_name = new_file_name.sub! '.jpg', "-original.jpg" 
    new_file_name.gsub!(/\s/,'-')
    img.clone.write("_resized_images/" + new_file_name)
}

# next upload to S3 automagically
exit