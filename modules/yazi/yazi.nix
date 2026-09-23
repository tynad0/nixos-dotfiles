{ ... }:

let
  # Палитра (из foot / waybar / rofi)
  bg      = "#202020";
  surface = "#303030";
  sel     = "#454545";
  fg      = "#FEFEFE";
  text    = "#CCCCCC";
  accent  = "#9b8d7f";  # taupe
  comment = "#6F7B68";
  red     = "#C34143";
  green   = "#A2A970";
  yellow  = "#DEBF7C";
  purple  = "#C39AE8";
  cyan    = "#5FC8C8";
in
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    shellWrapperName = "y";   # команда y: после выхода остаёшься в той папке, где был

    # ───── Настройки ─────
    settings = {
      mgr = {
        ratio = [ 1 3 4 ];        # родитель / текущая / превью
        sort_by = "natural";      # file2 перед file10
        sort_dir_first = true;    # папки сверху
        linemode = "size";        # размер файлов справа
        show_hidden = false;      # переключается клавишей .
        scrolloff = 5;
      };

      opener = {
        edit = [
          { run = "hx %s"; desc = "Helix"; block = true; for = "unix"; }
        ];
        open = [
          { run = "xdg-open %s1"; desc = "Open"; orphan = true; for = "linux"; }
        ];
      };

      # Код и конфиги открывать в Helix в этом же терминале
      open.prepend_rules = [
        { mime = "text/*"; use = [ "edit" "open" ]; }
        { mime = "application/{json,toml,yaml,x-yaml,xml,x-shellscript,javascript}"; use = [ "edit" "open" ]; }
        { mime = "inode/empty"; use = "edit"; }
      ];
    };

    # ───── Клавиши ─────
    keymap.mgr.prepend_keymap = [
      { on = [ "g" "." ]; run = "cd ~/dotfiles"; desc = "Dotfiles"; }
      { on = [ "g" "o" ]; run = ''cd "~/Obsidian Vault"''; desc = "Obsidian Vault"; }
    ];

    # ───── Тема ─────
    theme = {
      mgr = {
        cwd = { fg = accent; bold = true; };

        find_keyword  = { fg = yellow; bold = true; underline = true; };
        find_position = { fg = purple; bold = true; };

        marker_copied   = { fg = green;  bg = green; };
        marker_cut      = { fg = red;    bg = red; };
        marker_marked   = { fg = cyan;   bg = cyan; };
        marker_selected = { fg = yellow; bg = yellow; };

        count_copied   = { fg = bg; bg = green; };
        count_cut      = { fg = fg; bg = red; };
        count_selected = { fg = bg; bg = yellow; };

        border_symbol = "│";
        border_style  = { fg = sel; };
      };

      tabs = {
        active   = { fg = bg; bg = accent; bold = true; };
        inactive = { fg = accent; bg = surface; };
      };

      mode = {
        normal_main = { fg = bg; bg = accent; bold = true; };
        normal_alt  = { fg = accent; bg = surface; };
        select_main = { fg = bg; bg = yellow; bold = true; };
        select_alt  = { fg = yellow; bg = surface; };
        unset_main  = { fg = fg; bg = red; bold = true; };
        unset_alt   = { fg = red; bg = surface; };
      };

      # Выделенный файл: как активный воркспейс в waybar
      indicator = {
        parent  = { fg = text; bg = surface; };
        current = { fg = bg; bg = accent; bold = true; };
        preview = { underline = true; };
      };

      status = {
        perm_sep   = { fg = sel; };
        perm_type  = { fg = green; };
        perm_read  = { fg = yellow; };
        perm_write = { fg = red; };
        perm_exec  = { fg = cyan; };

        progress_label  = { fg = fg; bold = true; };
        progress_normal = { fg = accent; bg = surface; };
        progress_error  = { fg = yellow; bg = red; };
      };

      which = {
        mask            = { bg = bg; };
        border          = { fg = accent; };
        cand            = { fg = cyan; };
        rest            = { fg = comment; };
        desc            = { fg = purple; };
        separator_style = { fg = sel; };
      };

      confirm = {
        border  = { fg = accent; };
        title   = { fg = accent; };
        btn_yes = { reversed = true; };
      };

      spot = {
        border   = { fg = accent; };
        title    = { fg = accent; };
        tbl_col  = { fg = accent; };
        tbl_cell = { fg = yellow; reversed = true; };
      };

      notify = {
        title_info  = { fg = green; };
        title_warn  = { fg = yellow; };
        title_error = { fg = red; };
      };

      pick  = { border = { fg = accent; }; active = { fg = purple; bold = true; }; };
      input = { border = { fg = accent; }; selected = { reversed = true; }; };
      cmp   = { border = { fg = accent; }; active = { bg = sel; }; };
      tasks = { border = { fg = accent; }; hovered = { fg = purple; bold = true; }; };
      help  = {
        border  = { fg = accent; };
        chord   = { fg = cyan; };
        hovered = { bg = sel; bold = true; };
      };

      # Цвета файлов по типу
      filetype.rules = [
        { mime = "image/*"; fg = yellow; }
        { mime = "{audio,video}/*"; fg = purple; }
        { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}"; fg = red; }
        { mime = "application/{pdf,doc,rtf}"; fg = cyan; }
        { mime = "vfs/{absent,stale}"; fg = comment; }
        { url = "*"; is = "orphan"; bg = red; }
        { url = "*"; is = "exec"; fg = green; }
        { url = "*"; is = "dummy"; bg = red; }
        { url = "*/"; is = "dummy"; bg = red; }
        { url = "*/"; fg = accent; bold = true; }  # папки
        { url = "*"; fg = text; }                  # остальные файлы
      ];
    };
  };
}
