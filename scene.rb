class Scene
    # 現在のscene
    @@current = nil
    # シーンのハッシュマップ
    @@scene_directors = {}
    #プレイヤー情報
    @@players = {
        :player1 => nil,
        :player2 => nil
    }

    # 新しくシーンを追加
    def self.add(director_name, director_obj)
        @@scene_directors[director_name] = director_obj
    end

    def self.current=(director_name)
        @@current = director_name.to_sym
    end

    def self.players=(key, value)
        @@players[key.to_sym] = value
    end

    def self.players(key)
        @@players[key.to_sym]
    end

    # 現在のシーンを実行
    def self.play
        @@scene_directors[@@current].play
    end
end