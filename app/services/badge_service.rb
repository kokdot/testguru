class BadgeService
  def initialize(test_passage, user)
    @test_passage = test_passage 
    @user = user
  end

  def call
    Bage.all.each do |bage|
      return if bage.bage_of_user?(@user)
      bage.bages_rules.each do |bages_rule|
        @user.bages << bage if send("#{bages_rule.rule}_award?", bages_rule.description)
      end
    end
  end

  private
  
  #Выдать бейдж за прохождение определенного теста с первой попытки
  def first_attempt_some_award?(description)
    test_passage.test.title == description && TestPassage.test_attempt(test_id, @user) == 1
  end
  #Выдать бейдж за прохождение всех тестов с определенной категорией
  def category_award?(description)
    category_ids = Test.categories(description).plack(:id)
    TestPassage.categories_user(description, @user) & category_ids == category_ids
  end
  #Выдать бейдж за прохождение всех тестов с определенным уровнем
  def level_award?(description)
    level = description.to_i
    test_ids = Test.levels(level)
    TestPassage.levels_user(level, @user) & test_ids == test_ids
  end

end

