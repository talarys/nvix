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
                  local ok,_ = pcall(require, "copilot")
                    if ok then
                      vim.g.copilot_no_tab_map = true
                      vim.g.copilot_assume_mapped = true
                      vim.g.copilot_tab_fallback = ""

                      local suggestion = require("copilot.suggestion")
                      if suggestion.is_visible() then
                        suggestion.accept()
                      else
                        if cmp.snippet_active() then
                        return cmp.select_and_accept()
                        else
                        return cmp.accept()
                        end
                      end
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
