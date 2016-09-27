module Letter
  def render(unsub)
    markdown = ""
    markdown << unsub.user.firstname + " " + unsub.user.lastname + "\n"
    markdown << unsub.user.address + "\n"
    markdown << unsub.user.zipcode + " " + unsub.user.city + "\n"
    markdown << "\n\n"
    markdown << unsub.service.company + "\n"
    markdown << unsub.service.name + "\n"
    markdown << unsub.service.street_address + "\n"
    markdown << unsub.service.zip_code + " " + unsub.service.city + "\n"
    markdown << "\n\n"
    markdown << "A " + unsub.user.city + ", le " + Date.today.strftime("%d-%m-%Y") + "\n"
    markdown << "\n\n"
    markdown << unsub.service.text_base["object"] + ""
  end
end
