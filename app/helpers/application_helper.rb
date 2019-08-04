module ApplicationHelper
  def user_icon_large(user)
    if user.image.attached?
      image_tag user.image, class: "rounded-circle", style: "object-fit: cover;", size:"130x130"
    else
      image_tag "person.jpeg", class: "rounded-circle", size: "130x130"
    end
  end
  def user_icon_medium(user)
    if user.image.attached?
      image_tag user.image, class: "rounded-circle", style: "object-fit: cover;", size:"70x70"
    else
      image_tag "person.jpeg", class: "rounded-circle", size: "70x70"
    end
  end
  def user_icon_small(user)
    if user.image.attached?
      image_tag user.image, class: "rounded-circle", style: "object-fit: cover;", size:"35x35"
    else
      image_tag "person.jpeg", class: "rounded-circle", size: "35x35"
    end
  end

  def team_icon_large(team)
    if team.image.attached?
      image_tag team.image, class: "rounded-circle", style: "object-fit: cover;", size:"130x130"
    else
      image_tag "team.jpeg", class: "rounded-circle", size: "130x130"
    end
  end
  def team_icon_small(team)
    if team.image.attached?
      image_tag team.image, class: "rounded-circle", style: "object-fit: cover;", size:"40x40"
    else
      image_tag "team.jpeg", class: "rounded-circle", size: "40x40"
    end
  end
end
