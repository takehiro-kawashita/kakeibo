class Book < ApplicationRecord
    #検証機能(バリデーション)を使って未入力項目がある場合、登録させない処理
    
    belongs_to :user
    
    validates :year, presence: true
    validates :month, presence: true
    validates :inout, presence: true
    validates :category, presence: true
    validates :amount, presence: true
    # validates :memo,presence: true
    
end
