module Title
    class Director
        BACKGROUND = Image.new(800, 600, C_GREEN)

        def play
            Window.draw(0, 0, BACKGROUND)

            Scene.current = :charactor_select if Input.key_push?(K_SPACE)
        end
    end
end