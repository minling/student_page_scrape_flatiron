class Student
  @@students_hash = {}

  attr_accessor(:name, :excerpt, :tagline, :picture, :profile_link)
  
  def initialize(name,tagline,excerpt,*picture)
    @name = name
    @tagline = tagline
    @excerpt = excerpt
    @picture = picture
    @profile_link = profile_link
    @@students_hash[@name] = self
  end

  def Student.students_hash
    @@students_hash
  end
end