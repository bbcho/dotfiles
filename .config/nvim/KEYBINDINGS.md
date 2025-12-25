# Neovim Keybindings Reference

> LazyVim + Data Science Configuration
> Leader key: `<Space>`

---

## Table of Contents

- [General](#general)
- [File & Buffer Navigation](#file--buffer-navigation)
- [Window Management](#window-management)
- [Search & Find](#search--find)
- [LSP (Language Server)](#lsp-language-server)
- [Git](#git)
- [AI Assistance](#ai-assistance)
- [Jupyter/Molten (Notebooks)](#jupytermolten-notebooks)
- [Cell Navigation (Python/R)](#cell-navigation-pythonr)
- [Quarto](#quarto)
- [Debugging (DAP)](#debugging-dap)
- [Code](#code)
- [Snippets](#snippets)
- [UI Toggles](#ui-toggles)
- [Terminal](#terminal)
- [Essential Vim Motions](#essential-vim-motions)
- [Kitty Terminal](#kitty-terminal)
- [uv (Python Package Manager)](#uv-python-package-manager)

---

## General

| Key | Mode | Description |
|-----|------|-------------|
| `<Space>` | n | Leader key |
| `<C-s>` | n, i, v | Save file |
| `<C-q>` | n | Quit |
| `u` | n | Undo |
| `<C-r>` | n | Redo |
| `.` | n | Repeat last command |
| `<Esc>` | i | Exit insert mode |
| `jk` or `jj` | i | Exit insert mode (if configured) |
| `<leader>l` | n | Lazy plugin manager |
| `<leader>L` | n | LazyVim changelog |

---

## File & Buffer Navigation

### Files

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ff` | n | Find files |
| `<leader>fr` | n | Recent files |
| `<leader>fn` | n | New file |
| `<leader>fe` | n | File explorer (netrw) |
| `<leader>e` | n | Explorer (NeoTree) |
| `<leader>E` | n | Explorer (cwd) |

### Buffers

| Key | Mode | Description |
|-----|------|-------------|
| `<S-h>` | n | Previous buffer |
| `<S-l>` | n | Next buffer |
| `<leader>bb` | n | Switch buffer |
| `<leader>bd` | n | Delete buffer |
| `<leader>bD` | n | Delete buffer (force) |
| `<leader>bo` | n | Delete other buffers |
| `<leader>bp` | n | Toggle pin buffer |
| `[b` | n | Previous buffer |
| `]b` | n | Next buffer |

---

## Window Management

### Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `<C-h>` | n | Go to left window |
| `<C-j>` | n | Go to lower window |
| `<C-k>` | n | Go to upper window |
| `<C-l>` | n | Go to right window |

### Splits

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>-` | n | Split below |
| `<leader>\|` | n | Split right |
| `<leader>wd` | n | Delete window |
| `<leader>wm` | n | Maximize window |

### Resize

| Key | Mode | Description |
|-----|------|-------------|
| `<C-Up>` | n | Increase height |
| `<C-Down>` | n | Decrease height |
| `<C-Left>` | n | Decrease width |
| `<C-Right>` | n | Increase width |

---

## Search & Find

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>/` | n | Grep (search in files) |
| `<leader>sg` | n | Grep |
| `<leader>sw` | n | Search word under cursor |
| `<leader>sG` | n | Grep (cwd) |
| `<leader>ss` | n | Search symbols |
| `<leader>sS` | n | Search symbols (workspace) |
| `<leader>sr` | n | Replace in files |
| `<leader>sb` | n | Buffer search |
| `<leader>sc` | n | Command history |
| `<leader>sC` | n | Commands |
| `<leader>sh` | n | Help pages |
| `<leader>sk` | n | Keymaps |
| `<leader>sm` | n | Marks |
| `<leader>sR` | n | Resume last search |
| `n` | n | Next search result |
| `N` | n | Previous search result |
| `*` | n | Search word under cursor (forward) |
| `#` | n | Search word under cursor (backward) |

---

## LSP (Language Server)

### Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gr` | n | Go to references |
| `gI` | n | Go to implementation |
| `gy` | n | Go to type definition |
| `K` | n | Hover documentation |
| `gK` | n | Signature help |
| `<C-k>` | i | Signature help (insert mode) |

### Actions

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ca` | n, v | Code action |
| `<leader>cA` | n | Source action |
| `<leader>cr` | n | Rename symbol |
| `<leader>cf` | n | Format document |
| `<leader>cF` | n | Format range |
| `<leader>cl` | n | LSP info |
| `<leader>cR` | n | Restart LSP |
| `<leader>cv` | n | Select Python venv |
| `<leader>cV` | n | Select cached venv |

### Diagnostics

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>cd` | n | Line diagnostics |
| `]d` | n | Next diagnostic |
| `[d` | n | Previous diagnostic |
| `]e` | n | Next error |
| `[e` | n | Previous error |
| `]w` | n | Next warning |
| `[w` | n | Previous warning |
| `<leader>xx` | n | Trouble diagnostics |
| `<leader>xX` | n | Trouble buffer diagnostics |
| `<leader>xL` | n | Trouble location list |
| `<leader>xQ` | n | Trouble quickfix |

---

## Git

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gg` | n | Lazygit |
| `<leader>gG` | n | Lazygit (cwd) |
| `<leader>gb` | n | Git blame line |
| `<leader>gB` | n | Git browse |
| `<leader>gf` | n | Git file history |
| `<leader>gl` | n | Git log |
| `<leader>gL` | n | Git log (cwd) |
| `<leader>gs` | n | Git status |
| `<leader>gc` | n | Git commits |
| `<leader>gd` | n | Git diff |

### Hunks (gitsigns)

| Key | Mode | Description |
|-----|------|-------------|
| `]h` | n | Next hunk |
| `[h` | n | Previous hunk |
| `<leader>ghs` | n | Stage hunk |
| `<leader>ghr` | n | Reset hunk |
| `<leader>ghS` | n | Stage buffer |
| `<leader>ghR` | n | Reset buffer |
| `<leader>ghp` | n | Preview hunk |
| `<leader>ghb` | n | Blame line |
| `<leader>ghd` | n | Diff this |

---

## AI Assistance

### Claude Code CLI

**Neovim Integration:**

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>cc` | n | Claude Code toggle |
| `<leader>cs` | v | Send selection to Claude |
| `<leader>co` | n | Claude Code open |
| `<leader>cx` | n | Claude Code close |

**Inside Claude Code CLI:**

| Key | Description |
|-----|-------------|
| `Shift+Tab` | Toggle plan mode |
| `Escape` | Cancel current input / interrupt |
| `Ctrl+C` | Interrupt Claude's response |
| `Up/Down` | Navigate input history |
| `Tab` | Accept autocomplete suggestion |
| `Ctrl+L` | Clear screen |
| `/` | Show all available commands |
| `/help` | Show available commands |
| `/clear` | Clear conversation history |
| `/compact` | Compact conversation (reduce tokens) |
| `/config` | Open configuration |
| `/cost` | Show token usage and cost |
| `/doctor` | Check Claude Code health |
| `/export` | Export conversation to markdown |
| `/init` | Initialize project with CLAUDE.md |
| `/memory` | Edit memory files |
| `/model` | Switch model |
| `/review` | Request code review |
| `/terminal-setup` | Setup terminal integration |

### Avante (Claude Chat)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>aa` | n, v | Ask Claude (with context) |
| `<leader>ae` | v | Edit selection with Claude |
| `<leader>ar` | n | Refresh response |
| `<leader>at` | n | Toggle Avante sidebar |
| `<leader>af` | n | Focus Avante sidebar |

### Copilot (Inline Completions)

| Key | Mode | Description |
|-----|------|-------------|
| `<Tab>` | i | Accept suggestion |
| `<C-Right>` | i | Accept word |
| `<C-End>` | i | Accept line |
| `<M-]>` | i | Next suggestion |
| `<M-[>` | i | Previous suggestion |
| `<C-]>` | i | Dismiss suggestion |

---

## Jupyter/Molten (Notebooks)

### Kernel Management

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>mi` | n | Initialize kernel |
| `<leader>mx` | n | Interrupt kernel |
| `<leader>mR` | n | Restart kernel |

### Code Evaluation

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>me` | n | Evaluate operator (+ motion) |
| `<leader>ml` | n | Evaluate line |
| `<leader>mv` | v | Evaluate selection |
| `<leader>mr` | n | Re-evaluate cell |
| `<leader>md` | n | Delete cell output |

### Output Management

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>mo` | n | Show output |
| `<leader>mh` | n | Hide output |
| `<leader>mO` | n | Enter output window |
| `<leader>mb` | n | Open in browser (Plotly, etc.) |

### Navigation & Save/Load

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>mn` | n | Next cell (Molten) |
| `<leader>mp` | n | Previous cell (Molten) |
| `<leader>ms` | n | Save outputs |
| `<leader>mL` | n | Load outputs |

---

## Cell Navigation (Python/R)

> These work in `.py` and `.R` files with `# %%` cell markers

| Key | Mode | Description |
|-----|------|-------------|
| `]c` | n | Next cell |
| `[c` | n | Previous cell |
| `<C-CR>` | n | Run cell |
| `<S-CR>` | n | Run cell and move to next |
| `<leader>mc` | n | Run current cell |
| `<leader>cb` | n | Insert cell below |
| `<leader>ca` | n | Insert cell above |

### Text Objects

| Key | Mode | Description |
|-----|------|-------------|
| `ic` | o, v | Inner cell (select cell content) |
| `ac` | o, v | Around cell (select cell content) |

---

## Quarto

### Code Execution

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>qc` | n | Run cell |
| `<leader>qa` | n | Run all above |
| `<leader>qA` | n | Run all cells |
| `<leader>ql` | n | Run line |
| `<leader>qv` | v | Run selection |

### Preview & Tools

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>qp` | n | Quarto preview |
| `<leader>qP` | n | Close preview |
| `<leader>qo` | n | Activate Otter (LSP for chunks) |

---

## Debugging (DAP)

### Breakpoints

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>db` | n | Toggle breakpoint |
| `<leader>dB` | n | Conditional breakpoint |
| `<leader>dl` | n | Log point |

### Execution

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>dc` | n | Continue / Start |
| `<leader>dC` | n | Run to cursor |
| `<leader>dn` | n | Step over (next) |
| `<leader>di` | n | Step into |
| `<leader>do` | n | Step out |

### Session

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>dr` | n | Restart |
| `<leader>dq` | n | Terminate |
| `<leader>dd` | n | Disconnect |

### UI & REPL

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>du` | n | Toggle DAP UI |
| `<leader>de` | n, v | Evaluate expression |
| `<leader>dw` | n | Hover widgets |
| `<leader>dR` | n | Toggle REPL |

### Python-specific

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>dpm` | n | Debug test method |
| `<leader>dpc` | n | Debug test class |
| `<leader>dps` | v | Debug selection |

---

## Code

### Comments

| Key | Mode | Description |
|-----|------|-------------|
| `gc` | n, v | Toggle comment (+ motion) |
| `gcc` | n | Toggle line comment |
| `gco` | n | Add comment below |
| `gcO` | n | Add comment above |

### Folding

| Key | Mode | Description |
|-----|------|-------------|
| `za` | n | Toggle fold |
| `zc` | n | Close fold |
| `zo` | n | Open fold |
| `zM` | n | Close all folds |
| `zR` | n | Open all folds |

### Surround

| Key | Mode | Description |
|-----|------|-------------|
| `ys{motion}{char}` | n | Add surround |
| `ds{char}` | n | Delete surround |
| `cs{old}{new}` | n | Change surround |
| `S{char}` | v | Surround selection |

### Completion (Insert Mode)

| Key | Mode | Description |
|-----|------|-------------|
| `<C-Space>` | i | Trigger completion |
| `<C-n>` | i | Next item |
| `<C-p>` | i | Previous item |
| `<CR>` | i | Confirm selection |
| `<C-e>` | i | Abort completion |
| `<Tab>` | i | Next item / expand snippet |
| `<S-Tab>` | i | Previous item |

---

## Snippets

> Type prefix and trigger completion with `<Tab>` or `<C-Space>`

### Quarto Documents

| Prefix | Description |
|--------|-------------|
| `qreveal` | Revealjs presentation template |
| `qhtml` | HTML document template |
| `qpdf` | PDF document template |
| `qpptx` | PowerPoint template |
| `start` | Full Quarto template (all formats) |
| `qpython` | Python code chunk |
| `qr` | R code chunk |
| `qchunk` | Generic code chunk |
| `qopts` | Common chunk options |
| `qnote` | Callout note |
| `qwarn` | Callout warning |
| `qcols` | Two-column layout |
| `qtabs` | Tabset panel |

### Quarto Cross-References

| Prefix | Description |
|--------|-------------|
| `figref` | Reference a figure (@fig-) |
| `tblref` | Reference a table (@tbl-) |
| `eqref` | Reference an equation (@eq-) |
| `secref` | Reference a section (@sec-) |
| `fig` | Figure with caption and label |
| `fig2` | Two figures side by side |
| `fig3` | Three figures in layout |
| `pyfig` | Python figure chunk |
| `pyfig2` | Python two figures chunk |
| `eq` | Equation with label |
| `eqalign` | Aligned equations |

### Quarto Revealjs

| Prefix | Description |
|--------|-------------|
| `pause` | Reveal.js pause (. . .) |
| `frag` | Fragment (appear on click) |
| `inc` | Incremental list |
| `notes` | Speaker notes |
| `bgimg` | Slide background image |
| `bgcol` | Slide background color |
| `anim` | Auto-animate slide |
| `absolute` | Absolute positioning |

### Quarto Utilities

| Prefix | Description |
|--------|-------------|
| `div` | Generic div block |
| `lay` | Layout block |
| `aside` | Aside block |
| `alert` | Alert/highlighted text |
| `iframe` | Iframe embed with caption |
| `bib` | Bibliography YAML |

### Python Data Science

| Prefix | Description |
|--------|-------------|
| `pycell` | Jupyter cell marker (# %%) |
| `pycellt` | Cell marker with title |
| `pyimport` | Common data science imports |
| `pyimportfull` | Full imports with settings |
| `pyml` | Scikit-learn imports |
| `pyread` | Read CSV file |
| `pyinfo` | DataFrame info summary |
| `pypandas` | Create DataFrame |
| `pyplot` | Matplotlib plot template |
| `pysns` | Seaborn plot template |
| `pysubplots` | Multiple subplots |
| `pyfunc` | Function with docstring |
| `pyclass` | Class with init |
| `pytry` | Try-except block |
| `pymain` | Main block |
| `pylistcomp` | List comprehension |
| `pydictcomp` | Dictionary comprehension |
| `pywith` | Context manager |
| `pygroupby` | Pandas groupby |
| `pypivot` | Pandas pivot table |

### Python ggplotly

| Prefix | Description |
|--------|-------------|
| `ggimport` | Import ggplotly |
| `ggscatter` | Scatter plot |
| `ggline` | Line plot |
| `ggbar` | Bar chart |
| `gghist` | Histogram |
| `ggbox` | Boxplot |
| `ggfacet` | Faceted plot |
| `ggsmooth` | Scatter with smoothing |
| `ggheatmap` | Heatmap |
| `ggcandle` | Candlestick chart |
| `ggsave` | Save plot |

### R / Tidyverse

| Prefix | Description |
|--------|-------------|
| `rcell` | Jupyter cell marker |
| `rcellt` | Cell marker with title |
| `rtidy` | Tidyverse imports |
| `rsetup` | Full R setup |
| `rread` | Read CSV with glimpse |
| `rreadxl` | Read Excel file |
| `rpipe` | Pipe chain template |
| `rggplot` | ggplot2 base template |
| `rggscatter` | Scatter with regression |
| `rggfacet` | Faceted ggplot |
| `rggsave` | Save ggplot |
| `rsummarize` | Group by and summarize |
| `rcount` | Count values |
| `rfunc` | Function with roxygen |
| `rif` | If-else statement |
| `rcase` | case_when statement |
| `rmutcase` | Mutate with case_when |
| `rjoin` | Left join |
| `rpivotlong` | Pivot longer |
| `rpivotwide` | Pivot wider |
| `rfor` | For loop |
| `rmap` | purrr map function |
| `rglimpse` | Quick data overview |

---

## UI Toggles

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>uf` | n | Toggle format on save |
| `<leader>us` | n | Toggle spelling |
| `<leader>uw` | n | Toggle word wrap |
| `<leader>ul` | n | Toggle line numbers |
| `<leader>uL` | n | Toggle relative numbers |
| `<leader>ud` | n | Toggle diagnostics |
| `<leader>uc` | n | Toggle conceal |
| `<leader>uC` | n | Toggle colorscheme |
| `<leader>uh` | n | Toggle inlay hints |
| `<leader>uT` | n | Toggle treesitter highlight |
| `<leader>ub` | n | Toggle background |
| `<leader>ui` | n | Inspect position |

---

## Terminal

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ft` | n | Terminal (root) |
| `<leader>fT` | n | Terminal (cwd) |
| `<C-/>` | n | Toggle terminal |
| `<C-_>` | n | Toggle terminal (alt) |
| `<Esc><Esc>` | t | Exit terminal mode |
| `<C-h>` | t | Go to left window |
| `<C-j>` | t | Go to lower window |
| `<C-k>` | t | Go to upper window |
| `<C-l>` | t | Go to right window |

---

## Essential Vim Motions

### Movement

| Key | Description |
|-----|-------------|
| `h/j/k/l` | Left/Down/Up/Right |
| `w/W` | Next word/WORD |
| `b/B` | Previous word/WORD |
| `e/E` | End of word/WORD |
| `0` | Start of line |
| `^` | First non-blank |
| `$` | End of line |
| `gg` | First line |
| `G` | Last line |
| `{/}` | Previous/Next paragraph |
| `%` | Matching bracket |
| `f{char}` | Find char forward |
| `F{char}` | Find char backward |
| `t{char}` | Till char forward |
| `T{char}` | Till char backward |
| `;/,` | Repeat f/F/t/T forward/backward |
| `<C-d>` | Half page down |
| `<C-u>` | Half page up |
| `<C-f>` | Page down |
| `<C-b>` | Page up |
| `zz` | Center cursor |
| `zt` | Cursor to top |
| `zb` | Cursor to bottom |

### Editing

| Key | Description |
|-----|-------------|
| `i/a` | Insert before/after cursor |
| `I/A` | Insert at start/end of line |
| `o/O` | New line below/above |
| `x` | Delete character |
| `dd` | Delete line |
| `D` | Delete to end of line |
| `cc` | Change line |
| `C` | Change to end of line |
| `yy` | Yank (copy) line |
| `Y` | Yank to end of line |
| `p/P` | Paste after/before |
| `r{char}` | Replace character |
| `~` | Toggle case |
| `>>` | Indent line |
| `<<` | Outdent line |
| `J` | Join lines |

### Text Objects

| Key | Description |
|-----|-------------|
| `iw/aw` | Inner/around word |
| `is/as` | Inner/around sentence |
| `ip/ap` | Inner/around paragraph |
| `i"/a"` | Inner/around quotes |
| `i'/a'` | Inner/around single quotes |
| `i)/a)` | Inner/around parentheses |
| `i]/a]` | Inner/around brackets |
| `i}/a}` | Inner/around braces |
| `it/at` | Inner/around tags |
| `if/af` | Inner/around function |
| `ic/ac` | Inner/around cell (Python/R) |

### Operators

| Key | Description |
|-----|-------------|
| `d{motion}` | Delete |
| `c{motion}` | Change |
| `y{motion}` | Yank |
| `>/{motion}` | Indent |
| `<{motion}` | Outdent |
| `={motion}` | Auto-indent |
| `gq{motion}` | Format text |
| `gu{motion}` | Lowercase |
| `gU{motion}` | Uppercase |

---

## Kitty Terminal

> Cross-platform terminal emulator (Linux, macOS, Windows)
> Modifier key: `Ctrl+Shift` (default)

### Window Management

| Key | Description |
|-----|-------------|
| `Ctrl+Shift+Enter` | New window (split) |
| `Ctrl+Shift+N` | New OS window |
| `Ctrl+Shift+W` | Close window |
| `Ctrl+Shift+]` | Next window |
| `Ctrl+Shift+[` | Previous window |
| `Ctrl+Shift+F` | Move window forward |
| `Ctrl+Shift+B` | Move window backward |
| `Ctrl+Shift+R` | Resize window mode |
| `Ctrl+Shift+L` | Next layout |

### Tabs

| Key | Description |
|-----|-------------|
| `Ctrl+Shift+T` | New tab |
| `Ctrl+Shift+Q` | Close tab |
| `Ctrl+Shift+Right` | Next tab |
| `Ctrl+Shift+Left` | Previous tab |
| `Ctrl+Shift+.` | Move tab forward |
| `Ctrl+Shift+,` | Move tab backward |
| `Ctrl+Shift+Alt+T` | Set tab title |
| `Ctrl+Tab` | Next tab (alternative) |
| `Ctrl+Shift+Tab` | Previous tab (alternative) |

### Scrolling

| Key | Description |
|-----|-------------|
| `Ctrl+Shift+Up` | Scroll line up |
| `Ctrl+Shift+Down` | Scroll line down |
| `Ctrl+Shift+Page_Up` | Scroll page up |
| `Ctrl+Shift+Page_Down` | Scroll page down |
| `Ctrl+Shift+Home` | Scroll to top |
| `Ctrl+Shift+End` | Scroll to bottom |
| `Ctrl+Shift+H` | Browse scrollback in pager |
| `Ctrl+Shift+G` | Browse last command output |

### Copy/Paste & Selection

| Key | Description |
|-----|-------------|
| `Ctrl+Shift+C` | Copy to clipboard |
| `Ctrl+Shift+V` | Paste from clipboard |
| `Ctrl+Shift+S` | Paste from selection |
| `Shift+Insert` | Paste from selection |
| `Ctrl+Shift+O` | Pass selection to program |

### Font Size

| Key | Description |
|-----|-------------|
| `Ctrl+Shift+Equal` | Increase font size |
| `Ctrl+Shift+Minus` | Decrease font size |
| `Ctrl+Shift+Backspace` | Reset font size |

### Other

| Key | Description |
|-----|-------------|
| `Ctrl+Shift+F5` | Reload kitty.conf |
| `Ctrl+Shift+F6` | Debug kitty.conf |
| `Ctrl+Shift+Escape` | Open kitty shell |
| `Ctrl+Shift+U` | Unicode input |
| `Ctrl+Shift+F2` | Edit kitty.conf |
| `Ctrl+Shift+E` | Open URL hints |
| `Ctrl+Shift+P>F` | Select file hints |
| `Ctrl+Shift+P>H` | Select hash hints |
| `Ctrl+Shift+P>L` | Select line hints |
| `Ctrl+Shift+P>W` | Select word hints |
| `F11` | Toggle fullscreen |
| `Ctrl+Shift+F11` | Toggle maximized |

### Markers & Hints

| Key | Description |
|-----|-------------|
| `Ctrl+Shift+P>N` | Insert line numbers |
| `Ctrl+Shift+K` | Clear terminal |
| `Ctrl+Shift+Delete` | Reset terminal |

---

## uv (Python Package Manager)

> Fast Python package installer written in Rust (replacement for pip, virtualenv, pip-tools)

### Project Setup

| Command | Description |
|---------|-------------|
| `uv init myproject` | Create new project with pyproject.toml |
| `uv venv` | Create .venv in current directory |
| `uv venv --python 3.12` | Create venv with specific Python version |

### Package Management

| Command | Description |
|---------|-------------|
| `uv pip install pandas` | Install a package |
| `uv pip install -r requirements.txt` | Install from requirements |
| `uv pip install -e .` | Install current project (editable) |
| `uv pip uninstall pandas` | Remove a package |
| `uv pip list` | List installed packages |
| `uv pip freeze > requirements.txt` | Export requirements |

### Running Commands

| Command | Description |
|---------|-------------|
| `uv run python script.py` | Run with project's venv |
| `uv run pytest` | Run pytest with venv |
| `uv run jupyter lab` | Run Jupyter with venv |

### For Neovim/Molten Integration

```bash
# Install Jupyter kernel support
uv pip install ipykernel

# Register kernel for Molten (use project name)
uv run python -m ipykernel install --user --name myproject

# Install debugpy for DAP
uv pip install debugpy
```

### Sync & Lock

| Command | Description |
|---------|-------------|
| `uv lock` | Generate/update uv.lock from pyproject.toml |
| `uv sync` | Install dependencies from uv.lock |
| `uv sync --dev` | Include dev dependencies |

### Tool Management

| Command | Description |
|---------|-------------|
| `uv tool install ruff` | Install CLI tool globally |
| `uv tool run black .` | Run tool without installing |
| `uvx ruff check .` | Shorthand for `uv tool run` |

### Useful Flags

| Flag | Description |
|------|-------------|
| `--no-cache` | Skip cache |
| `--upgrade` | Upgrade packages |
| `--python 3.12` | Use specific Python |
| `-p 3.11` | Shorthand for --python |

---

## Quick Reference Card

```
╔═══════════════════════════════════════════════════════════════╗
║                    MOST USED KEYBINDINGS                      ║
╠═══════════════════════════════════════════════════════════════╣
║  FILES        <leader>ff find  <leader>fr recent  <leader>e   ║
║  SEARCH       <leader>/ grep   <leader>sg search  n/N next    ║
║  LSP          gd define  gr refs  K hover  <leader>ca action  ║
║  GIT          <leader>gg lazygit  ]h/[h hunks  <leader>ghs    ║
║  AI           <leader>aa ask  <leader>ae edit  <leader>cc cli ║
║  NOTEBOOK     <leader>mi init  <C-CR> run  ]c/[c navigate     ║
║  DEBUG        <leader>db break  <leader>dc start  <leader>dn  ║
║  WINDOWS      <C-hjkl> navigate  <leader>- split  <leader>|   ║
╚═══════════════════════════════════════════════════════════════╝
```

---

*Generated for LazyVim + Data Science configuration*
*Last updated: December 2025*
