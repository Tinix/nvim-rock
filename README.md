# Neovim Rock

## Neovim Configuration

This is a custom configuration project for the Neovim text editor.
Neovim is an advanced and extensible version of Vim, offering improvements in performance, extensibility, and user experience.

The project’s structure is well organized, with configuration files and plugins separated into logical directories. The configuration covers aspects such as:

- General Neovim options
- Custom keyboard shortcuts
- Autocommands (automatic events)
- Plugin configuration

---

## 🚀 Installation

To install and configure this Neovim project, follow these steps:

1. **Make sure you have Neovim installed** on your system.
   You can install it by following the instructions for your operating system on the [official Neovim page](https://neovim.io/).

2. **Clone this repository** into your Neovim configuration directory:

   ```bash
   git clone https://github.com/Tinix/nvim-rock.git ~/.config/nvim
   ```

3. **Install the external tools**:
   - [fd](https://github.com/sharkdp/fd): the binary can be `fdfind` (Debian/Ubuntu) or `fd`. Without it, Telescope uses its default finder.
   - `make` and a C compiler, to build telescope-fzf-native.
   - Node.js 20 or newer, for Copilot.

4. **Set `OPENAI_API_KEY`** (for example in `~/.zshrc`), used by Avante and ChatGPT.nvim.

5. **Sign in to Copilot** by running `:Copilot auth` inside Neovim.

# Neovim Keymaps Configuration

## 🎯 General Configuration

### Leader Keys
- **Leader**: `Space`
- **Local Leader**: `Space`

### Files and Windows
| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl+s` | Save | Save current file |
| `Space+q` | Quit | Close Neovim |
| `Space+Q` | Force quit | Close all without saving |

### Window Navigation
| Key | Action |
|-----|--------|
| `Ctrl+h` | Move to left window |
| `Ctrl+j` | Move to lower window |
| `Ctrl+k` | Move to upper window |
| `Ctrl+l` | Move to right window |

### Window Resizing
| Key | Action |
|-----|--------|
| `Ctrl+↑` | Increase height |
| `Ctrl+↓` | Decrease height |
| `Ctrl+←` | Decrease width |
| `Ctrl+→` | Increase width |

### Buffer Navigation
| Key | Action |
|-----|--------|
| `Shift+l` | Next buffer |
| `Shift+h` | Previous buffer |

## 📝 Moving Lines and Text

### Option 1: Shift+Alt (QWERTY)
| Key | Mode | Action |
|-----|------|--------|
| `Shift+Alt+j` | Normal/Visual | Move line/selection down |
| `Shift+Alt+k` | Normal/Visual | Move line/selection up |

### Option 2: Ctrl+Shift (Most Reliable)
| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+Shift+j` | Normal/Visual | Move line/selection down |
| `Ctrl+Shift+k` | Normal/Visual | Move line/selection up |

### Option 3: Dvorak Layout
| Key | Mode | Action |
|-----|------|--------|
| `Shift+Alt+t` | Normal/Visual | Move line/selection down |
| `Shift+Alt+n` | Normal/Visual | Move line/selection up |

## 🔄 Editing and Selection

### Indentation
| Key | Mode | Action |
|-----|------|--------|
| `<` | Visual | Indent left |
| `>` | Visual | Indent right |

### Special Paste
| Key | Mode | Action |
|-----|------|--------|
| `p` | Visual | Paste without yanking selection |

## 🌳 File Explorer (NvimTree)
| Key | Action |
|-----|--------|
| `Ctrl+e` | Toggle file explorer |

## 🎹 Dvorak Layout - Movement

### Basic Navigation
| Dvorak Key | Equivalent | Action |
|------------|------------|--------|
| `h` | `h` | Left |
| `t` | `j` | Down |
| `n` | `k` | Up |
| `s` | `l` | Right |

## 🤖 Artificial Intelligence

### Copilot (inline completion)
Disabled for Markdown, YAML, git commit and help files.

| Key | Mode | Action |
|-----|------|--------|
| `Tab` | Insert | Accept suggestion, or insert a tab if there is none |
| `Alt+A` | Insert | Accept whole suggestion |
| `Alt+a` | Insert | Accept one line |
| `Alt+n` / `Alt+p` | Insert | Next / previous suggestion |
| `Alt+e` | Insert | Dismiss suggestion |
| `Space+ct` | Normal | Toggle Copilot |

### Avante
| Key | Action |
|-----|--------|
| `Space+aa` | Avante Ask |
| `Space+ae` | Avante Edit (Visual) |
| `Space+ar` | Avante Refresh |
| `Space+at` | Avante Toggle |

### ChatGPT
| Key | Mode | Action |
|-----|------|--------|
| `Space+cc` | Normal | Open ChatGPT |
| `Space+ce` | Visual | Edit with instruction |
| `Space+cg` | Visual | Grammar correction |
| `Space+ct` | Visual | Translate |
| `Space+ck` | Visual | Extract keywords |
| `Space+cd` | Visual | Generate docstring |
| `Space+ca` | Visual | Add tests |
| `Space+co` | Visual | Optimize code |
| `Space+cs` | Visual | Summarize |
| `Space+cf` | Visual | Fix bugs |
| `Space+cx` | Visual | Explain code |
| `Space+cr` | Visual | Roxygen edit |
| `Space+cl` | Visual | Code readability analysis |

## 💡 Tips

- **Recommended**: Use `Ctrl+Shift+j/k` to move lines (works in all terminals)
- **For Dvorak**: Use `Shift+Alt+t/n` which corresponds to vertical movement keys
- **Visual Mode**: Select text with `Shift+v` before using movement commands
- **Persistence**: Indentation keeps selection active to repeat the action

## 🚀 Quick Usage Guide

1. **Select lines**: `Shift+v` (visual line mode)
2. **Move down**: `Ctrl+Shift+j`
3. **Move up**: `Ctrl+Shift+k`
4. **Indent**: `>` or `<` (maintains selection)
