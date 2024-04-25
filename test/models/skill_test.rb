require "test_helper"

class SkillTest < ActiveSupport::TestCase
  def setup
    @skill = Skill.new(name: "Example Skill", description: "example description")
  end

  test "should be valid" do
    assert @skill.valid?
  end

  test "name should be present" do
    @skill.name = "   "
    assert_not @skill.valid?
  end

  test "description should be present" do
    @skill.description = "   "
    assert_not @skill.valid?
  end

  test "name should not be too long" do
    @skill.name = "z" * 51
    assert_not @skill.valid?
  end

  test "description should not be too long" do
    @skill.description = "z" * 244
    assert_not @skill.valid?
  end
end
