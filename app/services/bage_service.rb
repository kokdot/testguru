class BageService
  def initialize(test_passage, user)
    @test_passage = test_passage 
    @user = user
  end

  def call
    Bage.all.each do |bage|
      bage.bages_rules.each do |bages_rule|
        @user.bages << bage if send("#{bages_rule.rule}_award?", bages_rule.description)
      end
    end
  end

  private
  
  #Выдать бейдж за прохождение определенного теста с первой попытки
  def first_attempt_some_award?(description)
    @test_passage.test.title == description && TestPassage.test_attempt(@test_passage.test_id, @user) == 1
  end
  #Выдать бейдж за прохождение всех тестов с определенной категорией
  def category_award?(description)
    category_id = Category.find_by(title: description )
    Test.categories_ids(description) == TestPassage.categories_user(category_id, @user)
  end
  #Выдать бейдж за прохождение всех тестов с определенным уровнем
  def level_award?(description)
    level = description.to_i
    Test.levels(level) == TestPassage.levels_user(level, @user)
  end
end
