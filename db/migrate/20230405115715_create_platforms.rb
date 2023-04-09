class CreatePlatforms < ActiveRecord::Migration[6.1]
  def change
    create_table :platforms do |t|
      t.string :name

      t.timestamps
    end
    
    Platform.create(name: "PC")
    Platform.create(name: "PS5")
    Platform.create(name: "PS4")
    Platform.create(name: "Switch")
    Platform.create(name: "VR")
    Platform.create(name: "Xbox")
    Platform.create(name: "iOS & Android.")
    Platform.create(name: "アーケード")
    Platform.create(name: "その他")
  end
end
