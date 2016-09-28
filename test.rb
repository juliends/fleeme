def ugc(array)
  hash = {}
  array.each do |q|
    case q['field']['id']
    when "25425783"
       hash[:sub_num] = q['text']
    when "25425854"
      hash[:reason] = ugc_motivation(q['choice']['label'])
    when "25431222"
      hash[:reason] = ugc_motivation(q['choice']['label'])
    end
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
  return hash[string]
end

ar = [{"type"=>"text", "text"=>"Julien", "field"=>{"id"=>"25108292", "type"=>"short_text"}},
 {"type"=>"text", "text"=>"Paris", "field"=>{"id"=>"25424218", "type"=>"short_text"}},
 {"type"=>"email", "email"=>"julien.da.silva@hotmail.com", "field"=>{"id"=>"25423473", "type"=>"email"}},
 {"type"=>"text", "text"=>"123", "field"=>{"id"=>"25425783", "type"=>"short_text"}},
 {"type"=>"text", "text"=>"Da Silva", "field"=>{"id"=>"25108413", "type"=>"short_text"}},
 {"type"=>"text", "text"=>"13 rue Paul Bert", "field"=>{"id"=>"25423131", "type"=>"short_text"}},
 {"type"=>"text", "text"=>"75011", "field"=>{"id"=>"25424220", "type"=>"short_text"}},
 {"type"=>"choice", "choice"=>{"label"=>"Plus d'un an"}, "field"=>{"id"=>"25425854", "type"=>"multiple_choice"}}]

ar2 = [{"type"=>"text", "text"=>"456", "field"=>{"id"=>"25425783", "type"=>"short_text"}},
  {"type"=>"text", "text"=>"13 villa gaudelet", "field"=>{"id"=>"25424220", "type"=>"short_text"}},
  {"type"=>"text", "text"=>"75011", "field"=>{"id"=>"29092897", "type"=>"short_text"}},
  {"type"=>"text", "text"=>"Paris", "field"=>{"id"=>"25424218", "type"=>"short_text"}},
  {"type"=>"choice", "choice"=>{"label"=>"Moins d'un an"}, "field"=>{"id"=>"25425854", "type"=>"multiple_choice"}},
  {"type"=>"choice", "choice"=>{"label"=>"Le cinéma près de chez moi n'est plus affilié ou a fermé"}, "field"=>{"id"=>"25431222", "type"=>"multiple_choice"}}]


p ugc(ar)
p ugc(ar2)
