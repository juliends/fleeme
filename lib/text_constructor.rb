module TextConstructor
  def render_letter(unsub)
    markdown = ""
    markdown << unsub.user.firstname + " " + unsub.user.lastname + "\n"
    markdown << unsub.user.address + "\n"
    markdown << unsub.user.zipcode + " " + unsub.user.city + "\n"
    markdown << "\n\n"
    markdown << unsub.service.company + "\n"
    markdown << unsub.service.name + "\n"
    markdown << unsub.service.street_address + "\n"
    markdown << "#{unsub.service.zip_code} " + unsub.service.city + "\n"
    markdown << "\n\n"
    markdown << "A " + unsub.user.city + ", le " + Date.today.strftime("%d-%m-%Y") + "\n"
    markdown << "\n\n"
    markdown << unsub.service.text_base["object"] + " " +unsub.details["sub_num"]
    markdown << "\n\n"
    markdown << unsub.service.text_base["hello_sentence"] + "\n"
    p unsub.details["reason"]
    case unsub.details["reason"]
    when "end_of_commitment"
      unsub.service.text_base["motivation"]["end_of_commitment"].each do |_key, value|
        markdown << value + "\n"
      end
      p "this is end_of_commitment"
    when "moving"
      unsub.service.text_base["motivation"]["moving"].each do |_key, value|
        markdown << value + "\n"
      end
      p "this is moving"
    when "theater_closing"
      unsub.service.text_base["motivation"]["theater_closing"].each do |_key, value|
        markdown << value + "\n"
      end
      p "theater_closing"
    when "price_changing"
      unsub.service.text_base["motivation"]["price_changing"].each do |_key, value|
        markdown << value + "\n"
      end
      p "this is price_changing"
    end
    p "this is the markdown:"
    p markdown
    markdown << unsub.service.text_base["client_deletion"] + "\n"
    markdown << unsub.service.text_base["politeness_sentence"] + "\n"

    markdown
  end
end
