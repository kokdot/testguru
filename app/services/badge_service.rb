class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage 
  end

  def call
    BagesRules.all.each do |bages_rule|
      description = Condition.find(bages_rule.condition_id).description
      control = send("#{bages_rule.rule}_award?", description)
      if control
        bage_assign_to_user(bages_rule) 
      end
    end
  end

  private

  def bage_assign_to_user(bages_rule)
    BagesUser.create(test_passage_id: @test_passage, bages_rule_id: bages_rule)
  end

  
  #Выдать бейдж за прохождение определенного теста с первой попытки
  def first_attempt_some_award?(description)
    test_id = test_passage.test_id
    Test.find(test_id).title == description && TestPassage.test_attempt(test_id).count == 1
    
  end
  #Выдать бейдж за прохождение всех тестов с определенной категорией
  def category_award?(description)
    TestPassage.categories_user(description) & Test.categories(description) == Test.categories(description)
  end
  #Выдать бейдж за прохождение всех тестов с определенным уровнем
  def level_award?(description)
    level = description.to_i
    TestPassage.levels_user(level) & Test.levels(level) == Test.levels(level)
  end

end

