class Brave
    
    attr_reader :name, :offence, :defence
    attr_accessor :hp
    
    SPECIAL_ATTACK_CONSTANT = 1.5
    
    def initialize(**params)
        @name = params[:name]
        @hp = params[:hp]
        @offence = params[:offence]
        @defence = params[:defence]
    end
    
    def attack(monster)
        puts "#{@name}の攻撃"
        
        attack_num = rand(4)
        
        if attack_num == 0
            puts "必殺！！！！"
            puts "しんくう斬り"
            damage = calculate_special_attack - monster.defence
        else
            damage = @offence - monster.defence
        end
        
        monster.hp -= damage
        
        
        puts "#{monster.name}は#{damage}のダメージを受けた"
        puts "#{monster.name}の残りHPは#{monster.hp}だ"
        
    end
    
    def calculate_special_attack
        @offence * SPECIAL_ATTACK_CONSTANT
    end

end

class Monster
    attr_reader :name, :offence, :defence
    attr_accessor :hp
    
    def initialize(**params)
        @name = params[:name]
        @hp = params[:hp]
        @offence = params[:offence]
        @defence = params[:defence]
    end
end

brave = Brave.new(name:"テリー", hp:500, offence:150, defence:100)
monster = Monster.new(name: "スライム", hp:250, offence:200, defence:100)

brave.attack(monster)
