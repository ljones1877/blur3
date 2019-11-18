class Image 
  attr_accessor :image_data
    
  def initialize(image_data)
    @image_data = image_data
  end

  def get_ones
    ones = []
    @image_data.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def output_image
    @image_data.each do |arr|
      puts arr.join
    end
  end

  def blur
    get_ones.each do |row_index, column_index|
      if row_index != 0 
      @image_data[row_index-1][column_index] = 1
     end
      if row_index != @image_data.length - 1 
       @image_data[row_index+1][column_index] = 1
     end
      if column_index != 0 
       @image_data[row_index][column_index-1] = 1
     end
      if column_index != @image_data[row_index].length - 1
       @image_data[row_index][column_index+1] = 1
      end  
    end
  end

  def blur2(blur_distance)
    blur_distance.times do 
      blur 
    end
  end 
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 1]
]) 
image.blur2 (3)
image.output_image

