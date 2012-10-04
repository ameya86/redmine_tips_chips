class TipsChips < ActiveRecord::Base
  validates_presence_of :description

  # 文字列化した場合、説明を返す
  def to_s
    return self.description.to_s
  end
end
