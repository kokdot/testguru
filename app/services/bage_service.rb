class BageService
  def initialize(test_passage)
    @test_passage = test_passage 
    @user = @test_passage.user
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
    Test.categories(description).order(id: :asc).pluck(:id) == TestPassage.joins(:test).test_is_success.where(user_id: @user.id, tests: { category_id: category_id }).order(id: :asc).pluck(:test_id).uniq
  end
  #Выдать бейдж за прохождение всех тестов с определенным уровнем
  def level_award?(description)
    level = description.to_i
    Test.where(level: level).order(id: :asc).pluck(:id)  == TestPassage.joins(:test).test_is_success.where(user_id: @user.id, tests: { level: level }).order(id: :asc).pluck(:test_id).uniq
  end
end
