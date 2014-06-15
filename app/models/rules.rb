class Rules

  def self.base_xp_per_level
    750
  end

  def self.base_xp_modifier_per_level level
    return 0.03 + level * 0.001
  end

  def self.base_xp_bonus_for_task_completion
    100
  end

  def self.base_xp_bonus_for_task_creation
    10
  end

  def self.xp_for_level level

    xp = level * base_xp_per_level
    xp += (level-1) * self.base_xp_modifier_per_level(level) * xp

    return xp.to_i

  end

end