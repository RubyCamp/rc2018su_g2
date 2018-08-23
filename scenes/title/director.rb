module Title
  class Director
    def play
      if Input.key_push?(K_SPACE) then
        Scene.current = :charactor_select #charactor_selectへ
      end
    end
  end
end
