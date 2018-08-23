module CharactorSelect
    class Controller
        attr_accessor :up, :down, :left, :right, :click
        def initialize
            @cursor_speed = 5
            set_keybind
        end

        def x
            result = 0
            result += @cursor_speed if Input.key_down?(right)
            result -= @cursor_speed if Input.key_down?(left)
            result
        end

        def y
            result = 0
            result += @cursor_speed if Input.key_down?(down)
            result -= @cursor_speed if Input.key_down?(up)
            result
        end

        def push_select_key?
            Input.key_push?(click) 
        end

        private

        def set_keybind
            self.up = K_W
            self.down = K_S
            self.left = K_A
            self.right = K_D
            self.click = K_Q
        end
    end
end