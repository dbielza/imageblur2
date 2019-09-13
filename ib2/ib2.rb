class Image
  attr_accessor :image

  def initialize (image)
    @image = image
  end

  def get_ones
    ones = []
    @image.each_with_index do |x, row_id|
      x.each_with_index do |y, col_id|
        if y == 1
          ones << [row_id, col_id]
        end
      end
    end
    ones = ones
  end

  def blur!
    ones = get_ones
    @image.each_with_index do |x, row_id|
      x.each_with_index do |y, col_id|
        ones.each do |ones_row_id, ones_col_id|

          if row_id == ones_row_id && col_id == ones_col_id
            @image[row_id -1][col_id] = 1 unless row_id == 0 
            @image[row_id +1][col_id] = 1 unless row_id >= 3 
            @image[row_id][col_id -1] = 1 unless col_id == 0 
            @image[row_id][col_id +1] = 1 unless col_id >= 3 
          end
        end
      end
    end
  end

  def output_image
    @image.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

image.blur!
puts
image.output_image