-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

return {
  -- Satırları taşıma kısayolları
  { "n", "<M-j>", ":m .+1<CR>==", { desc = "Satırı aşağı taşı" } },
  { "n", "<M-k>", ":m .-2<CR>==", { desc = "Satırı yukarı taşı" } },
  { "v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Seçimi aşağı taşı" } },
  { "v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Seçimi yukarı taşı" } },
  -- { "n", "<leader>yp", "yyp", { desc = "Satırı kopyalayıp altına yapıştır" } },
}
