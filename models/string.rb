class String

  def sanitize()
    return self.gsub(/[A-Za-z]+/,&:capitalize).gsub(/\sOf\s/,&:downcase)
  end

end
