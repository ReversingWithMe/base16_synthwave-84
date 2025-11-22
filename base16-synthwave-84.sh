#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Synthwave '84 style scheme (unofficial) inspired by Robb Owen's theme
export BASE16_THEME=synthwave-84

# --- Base16 colors mapped to Synthwave '84–style hexes ---

color00="24/21/3a" # Base 00 - Dark purple background
color01="f9/2a/ad" # Base 08 - Pink (red)
color02="72/f1/b8" # Base 0B - Neon mint (green)
color03="ff/e2/61" # Base 0A - Soft neon yellow
color04="36/f9/f6" # Base 0D - Aqua / teal (blue)
color05="ff/7e/db" # Base 0E - Magenta / pink
color06="78/dc/ff" # Base 0C - Cyan
color07="f5/f5/ff" # Base 05 - Light foreground
color08="5b/3c/99" # Base 03 - Muted purple (bright black)
color09="f9/7e/72" # Base 09 - Orange-pink
color10=$color02   # Base 0B - Bright green
color11=$color03   # Base 0A - Bright yellow
color12=$color04   # Base 0D - Bright blue
color13=$color05   # Base 0E - Bright magenta
color14=$color06   # Base 0C - Bright cyan
color15="ff/fc/fa" # Base 07 - Bright white

color16="f9/7e/72" # Base 09 (same as orange-pink accent)
color17="bb/89/77" # Base 0F - Brown-ish accent
color18="2a/21/39" # Base 01 - Slightly lighter bg
color19="33/2a/4d" # Base 02 - UI background
color20="c1/c3/e6" # Base 04 - Dim fg
color21="ff/ff/ff" # Base 06 - Very bright fg

color99="5B/3C/99" # Base 06 - Very bright fg
color98="6C/4D/B2" # Base 06 - Very bright fg
color97="7D/5E/CB" # Base 06 - Very bright fg
color96="8E/6F/E4" # Base 06 - Very bright fg


color_foreground="f5/f5/ff" # Base 05
color_background="24/21/3a" # Base 00

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' $@; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' $@; }
  put_template_custom() { printf '\033]%s%s\033\\' $@; }
fi

# 16 color space
put_template 0  $color00
put_template 1  $color01
put_template 2  $color02
put_template 3  $color03
put_template 4  $color04
put_template 5  $color05
put_template 6  $color06
put_template 7  $color07
put_template 8  $color08
put_template 9  $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21

# Comment specific helpers
put_template 99 $color99
put_template 98 $color98
put_template 97 $color97
put_template 96 $color96

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg f5f5ff # foreground
  put_template_custom Ph 24213a # background
  put_template_custom Pi f5f5ff # bold color
  put_template_custom Pj 332a4d # selection color
  put_template_custom Pk f5f5ff # selected text color
  put_template_custom Pl f5f5ff # cursor
  put_template_custom Pm 24213a # cursor text
else
  put_template_var 10 $color_foreground
  if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 $color_background
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 $color_background # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background

