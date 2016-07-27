module BoardsHelper
  def color(space)
    if space == []
      "empty"
    else
      space.color.to_s
    end
  end
end
