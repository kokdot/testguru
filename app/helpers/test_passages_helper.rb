module TestPassagesHelper
  def timer?
    @test_passage.test.timer > 0
  end

  def changed_timer
    @test_passage.test.timer - @test_passage.delta_time
  end
end
