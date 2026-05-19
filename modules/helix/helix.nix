{pkgs, ...}:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "my-foot-theme";
      editor = {
        line-number = "relative";
        mouse = true;
      };
    };
    themes = {
      my-foot-theme = {
        # ── Palette ──────────────────────────────────────────────
        "palette" = {
          bg        = "#202020";
          surface   = "#303030";
          selection = "#454545";
          fg        = "#FEFEFE";
          subtle    = "#CCCCCC";
          comment   = "#6F7B68";
          error     = "#C34143";
          string    = "#A2A970";
          operator  = "#DEBF7C";
          keyword   = "#E3D896";
          func      = "#AA9AAC";
          ident     = "#8B9698";
          special   = "#C1C88D";
          sel-fg    = "#BFBBBA";
        };

        # ── UI Chrome ─────────────────────────────────────────────
        "ui.background"              = { bg = "bg"; };
        "ui.statusline"              = { fg = "subtle"; bg = "surface"; };
        "ui.statusline.inactive"     = { fg = "comment"; bg = "surface"; };
        "ui.statusline.normal"       = { fg = "bg"; bg = "ident"; modifiers = ["bold"]; };
        "ui.statusline.insert"       = { fg = "bg"; bg = "string"; modifiers = ["bold"]; };
        "ui.statusline.select"       = { fg = "bg"; bg = "operator"; modifiers = ["bold"]; };
        "ui.popup"                   = { fg = "subtle"; bg = "surface"; };
        "ui.popup.info"              = { fg = "subtle"; bg = "surface"; };
        "ui.window"                  = { fg = "comment"; };
        "ui.help"                    = { fg = "subtle"; bg = "surface"; };
        "ui.menu"                    = { fg = "subtle"; bg = "surface"; };
        "ui.menu.selected"           = { fg = "sel-fg"; bg = "selection"; };
        "ui.menu.scroll"             = { fg = "comment"; bg = "surface"; };

        # ── Cursor & Selection ────────────────────────────────────
        "ui.cursor"                  = { fg = "bg"; bg = "fg"; };
        "ui.cursor.primary"          = { fg = "bg"; bg = "fg"; };
        "ui.cursor.match"            = { fg = "bg"; bg = "operator"; };
        "ui.selection"               = { bg = "selection"; };
        "ui.selection.primary"       = { bg = "selection"; };

        # ── Line Numbers & Gutter ─────────────────────────────────
        "ui.linenr"                  = { fg = "comment"; };
        "ui.linenr.selected"         = { fg = "subtle"; };
        "ui.cursorline.primary"      = { bg = "surface"; };
        "ui.gutter"                  = { bg = "bg"; };
        "ui.gutter.selected"         = { bg = "surface"; };

        # ── Text ──────────────────────────────────────────────────
        "ui.text"                    = { fg = "fg"; };
        "ui.text.focus"              = { fg = "fg"; modifiers = ["bold"]; };
        "ui.text.inactive"           = { fg = "comment"; };
        "ui.virtual.ruler"           = { bg = "surface"; };
        "ui.virtual.whitespace"      = { fg = "selection"; };
        "ui.virtual.indent-guide"    = { fg = "selection"; };
        "ui.virtual.inlay-hint"      = { fg = "comment"; };

        # ── Diagnostics ───────────────────────────────────────────
        "ui.highlight"               = { bg = "selection"; };
        "diagnostic.error"           = { underline = { color = "error"; style = "curl"; }; };
        "diagnostic.warning"         = { underline = { color = "operator"; style = "curl"; }; };
        "diagnostic.info"            = { underline = { color = "ident"; style = "curl"; }; };
        "diagnostic.hint"            = { underline = { color = "comment"; style = "curl"; }; };
        "error"                      = { fg = "error"; };
        "warning"                    = { fg = "operator"; };
        "info"                       = { fg = "ident"; };
        "hint"                       = { fg = "comment"; };

        # ── Syntax Highlighting ───────────────────────────────────
        "comment"                    = { fg = "comment"; modifiers = ["italic"]; };
        "comment.line"               = { fg = "comment"; modifiers = ["italic"]; };
        "comment.block"              = { fg = "comment"; modifiers = ["italic"]; };
        "comment.block.documentation"= { fg = "comment"; modifiers = ["italic"]; };

        "string"                     = { fg = "string"; };
        "string.regexp"              = { fg = "special"; };
        "string.special"             = { fg = "special"; };
        "string.special.path"        = { fg = "special"; };
        "string.special.url"         = { fg = "special"; modifiers = ["underlined"]; };

        "constant"                   = { fg = "special"; };
        "constant.numeric"           = { fg = "special"; };
        "constant.builtin"           = { fg = "special"; };
        "constant.character"         = { fg = "string"; };
        "constant.character.escape"  = { fg = "special"; };

        "keyword"                    = { fg = "keyword"; };
        "keyword.control"            = { fg = "keyword"; };
        "keyword.control.conditional"= { fg = "keyword"; };
        "keyword.control.repeat"     = { fg = "keyword"; };
        "keyword.control.return"     = { fg = "keyword"; };
        "keyword.control.import"     = { fg = "keyword"; };
        "keyword.operator"           = { fg = "operator"; };
        "keyword.directive"          = { fg = "special"; };
        "keyword.function"           = { fg = "keyword"; };
        "keyword.storage"            = { fg = "keyword"; };
        "keyword.storage.type"       = { fg = "keyword"; };
        "keyword.storage.modifier"   = { fg = "keyword"; };

        "operator"                   = { fg = "operator"; };
        "punctuation"                = { fg = "subtle"; };
        "punctuation.delimiter"      = { fg = "subtle"; };
        "punctuation.bracket"        = { fg = "subtle"; };

        "function"                   = { fg = "func"; };
        "function.builtin"           = { fg = "func"; };
        "function.method"            = { fg = "func"; };
        "function.macro"             = { fg = "special"; };
        "function.special"           = { fg = "special"; };

        "type"                       = { fg = "ident"; };
        "type.builtin"               = { fg = "ident"; };
        "type.enum"                  = { fg = "ident"; };
        "type.enum.variant"          = { fg = "special"; };

        "constructor"                = { fg = "func"; };
        "variable"                   = { fg = "fg"; };
        "variable.builtin"           = { fg = "special"; };
        "variable.parameter"         = { fg = "fg"; modifiers = ["italic"]; };
        "variable.other.member"      = { fg = "ident"; };

        "namespace"                  = { fg = "ident"; modifiers = ["italic"]; };
        "module"                     = { fg = "ident"; };
        "attribute"                  = { fg = "special"; };
        "label"                      = { fg = "keyword"; };
        "tag"                        = { fg = "keyword"; };
        "tag.attribute"              = { fg = "ident"; };

        # ── Diff / VCS ────────────────────────────────────────────
        "diff.plus"                  = { fg = "string"; };
        "diff.minus"                 = { fg = "error"; };
        "diff.delta"                 = { fg = "operator"; };
        "diff.delta.moved"           = { fg = "func"; };

        # ── Markup ────────────────────────────────────────────────
        "markup.heading"             = { fg = "keyword"; modifiers = ["bold"]; };
        "markup.bold"                = { modifiers = ["bold"]; };
        "markup.italic"              = { modifiers = ["italic"]; };
        "markup.strikethrough"       = { modifiers = ["crossed_out"]; };
        "markup.link.url"            = { fg = "special"; modifiers = ["underlined"]; };
        "markup.link.text"           = { fg = "func"; };
        "markup.raw"                 = { fg = "string"; };
        "markup.list"                = { fg = "operator"; };
      };
    };
  };
}
