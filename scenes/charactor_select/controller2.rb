module CharactorSelect
    class Controller2 < Controller
        private
    
        def set_keybind
            self.up = K_I
            self.down = K_K
            self.left = K_J
            self.right = K_L
            self.click = K_U
        end
    end
end