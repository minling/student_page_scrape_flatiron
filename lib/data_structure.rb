class Student
  @@students_hash = {}

  attr_accessor(:name, :tagline, :excerpt, :picture, :profile_link)
  
  def initialize(name,tagline,excerpt,picture,profile_link)
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


class StudentProfile
  @@profile_hash = {}

  attr_accessor(:name, :biography, :education, :work, :github)
  
  def initialize(name, biography, education, work, github)
    @name = name
    @biography = biography
    @education = education
    @work = work
    @github = github
    @@profile_hash[@name] = self
  end

  def StudentProfile.profile_hash
    @@profile_hash
  end

end
