class weather
  def stormy?
    Kernel.rand(1..7) > 3
  end
end
