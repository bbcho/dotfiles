-- Cell navigation and text objects for # %% style notebooks
-- Place in ~/.config/nvim/lua/notebook-cells.lua
--
-- Uses MoltenEvaluateRange which is a vim function exposed by molten-nvim
-- See: https://github.com/benlubas/molten-nvim (Vim Functions section)

local M = {}

-- Pattern for cell markers (VS Code style)
M.cell_pattern = "^# %%%%"

-- Get the line numbers of the current cell boundaries
function M.get_cell_bounds()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")

  -- Find start of cell (search backwards for # %%)
  local start_line = current_line
  while start_line > 1 do
    local line_content = vim.fn.getline(start_line)
    if line_content:match(M.cell_pattern) then
      start_line = start_line + 1 -- Start after the marker
      break
    end
    start_line = start_line - 1
  end
  if start_line == 0 then start_line = 1 end

  -- Find end of cell (search forwards for next # %%)
  local end_line = current_line
  while end_line < total_lines do
    end_line = end_line + 1
    local line_content = vim.fn.getline(end_line)
    if line_content:match(M.cell_pattern) then
      end_line = end_line - 1 -- End before the marker
      break
    end
  end

  -- Trim empty lines at start and end
  while start_line <= end_line and vim.fn.getline(start_line):match("^%s*$") do
    start_line = start_line + 1
  end
  while end_line >= start_line and vim.fn.getline(end_line):match("^%s*$") do
    end_line = end_line - 1
  end

  if start_line > end_line then
    return nil, nil
  end

  return start_line, end_line
end

-- Evaluate a range using Molten's vim function
-- MoltenEvaluateRange(start_line, end_line, [start_col, end_col])
function M.evaluate_range(start_line, end_line)
  -- Call the vim function directly
  vim.fn.MoltenEvaluateRange(start_line, end_line)
end

-- Run current cell
function M.run_cell()
  local start_line, end_line = M.get_cell_bounds()
  if start_line and end_line then
    M.evaluate_range(start_line, end_line)
  else
    print("No cell found")
  end
end

-- Navigate to next cell
function M.goto_next_cell()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")

  for i = current_line + 1, total_lines do
    if vim.fn.getline(i):match(M.cell_pattern) then
      vim.api.nvim_win_set_cursor(0, { i + 1, 0 })
      vim.cmd("normal! zz")
      return
    end
  end
  print("No next cell found")
end

-- Navigate to previous cell
function M.goto_prev_cell()
  local current_line = vim.fn.line(".")

  -- First, find the start of current cell
  local cell_start = current_line
  while cell_start > 1 and not vim.fn.getline(cell_start):match(M.cell_pattern) do
    cell_start = cell_start - 1
  end

  -- Now search before that for the previous cell
  for i = cell_start - 1, 1, -1 do
    if vim.fn.getline(i):match(M.cell_pattern) then
      vim.api.nvim_win_set_cursor(0, { i + 1, 0 })
      vim.cmd("normal! zz")
      return
    end
  end
  -- If no previous marker, go to line 1
  vim.api.nvim_win_set_cursor(0, { 1, 0 })
end

-- Select the current cell (visual mode)
function M.select_cell()
  local start_line, end_line = M.get_cell_bounds()
  if start_line and end_line then
    vim.cmd("normal! " .. start_line .. "GV" .. end_line .. "G")
  end
end

-- Run cell and move to next
function M.run_cell_and_next()
  local start_line, end_line = M.get_cell_bounds()
  if start_line and end_line then
    M.evaluate_range(start_line, end_line)
    M.goto_next_cell()
  end
end

-- Insert a new cell below
function M.insert_cell_below()
  local _, end_line = M.get_cell_bounds()
  if end_line then
    vim.api.nvim_buf_set_lines(0, end_line, end_line, false, { "", "# %%", "" })
    vim.api.nvim_win_set_cursor(0, { end_line + 3, 0 })
  else
    vim.api.nvim_buf_set_lines(0, -1, -1, false, { "", "# %%", "" })
    vim.api.nvim_win_set_cursor(0, { vim.fn.line("$"), 0 })
  end
  vim.cmd("startinsert")
end

-- Insert a new cell above
function M.insert_cell_above()
  local current_line = vim.fn.line(".")

  -- Find the cell marker above current line
  local marker_line = current_line
  while marker_line > 1 and not vim.fn.getline(marker_line):match(M.cell_pattern) do
    marker_line = marker_line - 1
  end

  if marker_line <= 1 then
    -- Insert at the very beginning
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { "# %%", "", "" })
    vim.api.nvim_win_set_cursor(0, { 2, 0 })
  else
    vim.api.nvim_buf_set_lines(0, marker_line - 1, marker_line - 1, false, { "# %%", "", "" })
    vim.api.nvim_win_set_cursor(0, { marker_line + 1, 0 })
  end
  vim.cmd("startinsert")
end

-- Setup keymaps for Python buffers
function M.setup_keymaps()
  local map = vim.keymap.set
  local opts = { buffer = true, silent = true }

  -- Cell navigation
  map("n", "]c", M.goto_next_cell, vim.tbl_extend("force", opts, { desc = "Next cell" }))
  map("n", "[c", M.goto_prev_cell, vim.tbl_extend("force", opts, { desc = "Previous cell" }))

  -- Cell text object (inner cell)
  map({ "o", "x" }, "ic", M.select_cell, vim.tbl_extend("force", opts, { desc = "Inner cell" }))
  map({ "o", "x" }, "ac", M.select_cell, vim.tbl_extend("force", opts, { desc = "Around cell" }))

  -- Run cell using MoltenEvaluateRange
  map("n", "<C-CR>", M.run_cell, vim.tbl_extend("force", opts, { desc = "Run cell" }))
  map("n", "<S-CR>", M.run_cell_and_next, vim.tbl_extend("force", opts, { desc = "Run cell & next" }))

  -- Also map <leader>mc for consistency
  map("n", "<leader>mc", M.run_cell, vim.tbl_extend("force", opts, { desc = "Run current cell" }))

  -- Insert cells
  map("n", "<leader>cb", M.insert_cell_below, vim.tbl_extend("force", opts, { desc = "Insert cell below" }))
  map("n", "<leader>ca", M.insert_cell_above, vim.tbl_extend("force", opts, { desc = "Insert cell above" }))
end

return M
