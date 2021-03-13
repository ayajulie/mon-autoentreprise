CountrySelect::FORMATS[:with_full_country_name] = lambda do |country|
  [
    country.name,
    country.alpha2,
    {
      'value' => country.name,
    }
  ]
end

# pas utilisé / pas trouvé la manière de l'utiliser dans le simple_form. Le but est de remplacer les 2 lettres utilisés pour stocker dans la DB par le nom complet du pays
