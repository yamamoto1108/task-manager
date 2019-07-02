module ApplicationHelper
  def user_icon_large(user)
    if user.image.attached?
      image_tag user.image.variant(resize: "130x130^"), class: "rounded-circle"
    else
      image_tag "person.jpeg", class: "rounded-circle", size: "130x130"
    end
  end
  def user_icon_medium(user)
    if user.image.attached?
      image_tag user.image.variant(resize: "70x70^"), class: "rounded-circle"
    else
      image_tag "person.jpeg", class: "rounded-circle", size: "70x70"
    end
  end
  def user_icon_small(user)
    if user.image.attached?
      image_tag user.image.variant(resize: "40x40^"), class: "rounded-circle"
    else
      image_tag "person.jpeg", class: "rounded-circle", size: "40x40"
    end
  end

  def team_icon_large(team)
    if team.image.attached?
      image_tag team.image.variant(resize: "130x130^"), class: "rounded-circle"
    else
      image_tag "team.jpeg", class: "rounded-circle", size: "130x130"
    end
  end
  def team_icon_small(team)
    if team.image.attached?
      image_tag team.image.variant(resize: "40x40^"), class: "rounded-circle"
    else
      image_tag "team.jpeg", class: "rounded-circle", size: "40x40"
    end
  end
end
