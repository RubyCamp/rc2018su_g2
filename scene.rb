class Scene
  @@current = nil
  @@scene_directors = {}

  @@players = {
    :player1 => nil,
    :player2 => nil
  }

  def self.add(director_name, director_obj)
    @@scene_directors[director_name.to_sym] = director_obj
  end

  def self.current=(director_name)
    @@current = director_name.to_sym
  end

  def self.update_player(key, value)
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