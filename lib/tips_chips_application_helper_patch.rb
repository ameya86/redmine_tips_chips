require_dependency 'application_helper'

module TipsChipsApplicationHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods) # obj.method

    base.class_eval do
      alias_method_chain :render_project_jump_box, :tips_chips
    end
  end

  module InstanceMethods # obj.method
    # 後ろにチップを付ける
    def render_project_jump_box_with_tips_chips
      return raw((render_project_jump_box_without_tips_chips || '') + render_tips_chips)
    end

    # ランダムなチップを描画する
    def render_tips_chips
      tip = random_tips_chips
      return '' if tip.blank?

      tip_str = (tip.url.blank?)? h(tip.to_s) : link_to(h(tip.to_s), tip.url)

      return raw "<div style='text-align: right;'><small>#{tip_str}</small></div>"
    end

    # ランダムなチップを取得する
    def random_tips_chips
      tip_count = TipsChips.count
      if tip_count > 0
        offset = rand(tip_count)
        return TipsChips.find(:first, :offset => offset) 
      else
        return nil
      end
    end
  end
end

ApplicationHelper.send(:include, TipsChipsApplicationHelperPatch)
