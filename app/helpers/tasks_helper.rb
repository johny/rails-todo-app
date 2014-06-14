module TasksHelper

  def completion_flash_notice

    words = ['Chwała', 'Zwycięstwo', 'Jest moc', 'Mistrzostwo', 'Triumf', 'Sukces', 'Co za wyczyn', 'Victoria', 'Wiktoria', 'Veni, vidi, vici' 'Tryumf', 'WoW!!!1! ']

    words2 = ["ukończone", "wykonane", "zrobione", "zakończone", "załatwione", "skończone"]

    return "#{words.sample}! Zadanie #{words2.sample}!"


  end

end
