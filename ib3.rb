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

  def blur!(blur_distance)
    ones = get_ones
    @image.each_with_index do |x, row_id|
      x.each_with_index do |y, col_id|
        ones.each do |ones_row_id, ones_col_id|
          man_distance = manhattan_distance(row_id, ones_row_id, col_id, ones_col_id)
          if man_distance <= blur_distance
            @image[row_id][col_id] = 1
          end
        end
      end
    end
  end

  def manhattan_distance(row1, row2, col1, col2)
    delta_row = (row1 - row2).abs
    delta_col = (col1 - col2).abs
    delta_row + delta_col
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

image.blur!(1)
puts
image.output_image