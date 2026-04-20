{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  plugins = {
    luasnip.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        completion.menu.border = "rounded";
        keymap = {
          preset = "enter";
          "<Tab>" = [
            (
              # lua
              mkRaw ''
                function(cmp)
                  local ok, copilot = pcall(require, "copilot.suggestion")
                  if ok and copilot.is_visible() then
                    copilot.accept_line()
                    return true
                  elseif cmp.snippet_active() then
                    return cmp.select_and_accept()
                  else
                    return cmp.accept()
                  end
                end
              ''
            )
          ];
        };
      };
    };
  };
}
