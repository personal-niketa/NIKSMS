module AdmissionsHelper

  def select_country_for_student
    [['INDIA', 'india'], ['USA', 'usa' ], ['UK', 'uk']]   
  end

  def country_label(country)
    case country
    when "INDIA"
      "DESI student"
    when "USA"
      "US student"
    else
      "UK student"
    end
  end

end
