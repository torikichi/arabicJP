module Common
  extend ActiveSupport::Concern

  def generate_query(controller_name)
  	first = "select w.*, count(e.word_id) as example, count(distinct a.appr_id) as lesson from words w left outer join "

  	if controller_name == "relation"
  	  first += "relations r on w.id=r.word_id left outer join "
  	end

  	second = "appearances a on w.id=a.word_id left outer join examples e on w.id=e.word_id "

  	first + second
  end

end