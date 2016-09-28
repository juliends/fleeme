module Answer

  def parse_ugc(array)
    hash = {}
    array.each do |q|
      # refaire ces conditions... ça ne fonctionne pas correctement.
      if q['field']['id'] == "25425783"
        hash[:sub_num] = q['text']
      elsif q['field']['id'] == "25431222"
        hash[:reason] = ugc_motivation(q['choice']['label'])
      elsif q['field']['id'] == "25425854"
        hash[:reason] = ugc_motivation(q['choice']['label']) if hash[:reason].nil?
      end
      p q if q['type'] == 'choice'
    end
    return hash
  end

  def ugc_motivation(string)
    hash = {
      "Plus d'un an" => "end_of_commitment",
      "Moins de 14 jours" => "before_commitment",
      "Je ne sais pas" => "ignore",
      "J'ai déménagé dans une zone ou UGC n'est pas présent" => "moving",
      "Le cinéma près de chez moi n'est plus affilié ou a fermé" => "theater_closing",
      "Mon état de santé ne me permet plus d'aller au cinéma" => "health",
      "UGC a modifié ses tarifs" => "price_changing"
    }
    p "helloooooooooooooooooooooooo" if hash.include?(string)
    p string
    p hash[string]
    return hash[string]
  end
end
