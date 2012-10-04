class CreateTipsChips < ActiveRecord::Migration
  def change
    create_table :tips_chips do |t|
      t.text :description
      t.text :url
    end

    tips = YAML.load_file("#{Rails.root}/plugins/redmine_tips_chips/files/ja.yml")
p tips
    tips.each do |key, t|
      TipsChips.create(t)
    end
  end
end
