module ApplicationHelper

  def title
    base_title = "School Gradebook"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def display_achievements(achievements)
    result = ""
    achievements.each do |achievement|
      result << "<tr>"
      result << "<td>#{achievement.description}</td>"
      result << "<td>#{ achievement.point_value }</td>"
      result << "</tr>"
    end
    result.html_safe
  end

end
