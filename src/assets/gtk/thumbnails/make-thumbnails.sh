#! /usr/bin/env bash

for theme in '' '-Purple' '-Pink' '-Red' '-Orange' '-Yellow' '-Green' '-Blue' '-Grey'; do
  for type in '' '-Nord' '-Dracula'; do
    case "$theme" in
      '')
        theme_color_dark='#009688'
        theme_color_light='#4db6ac'
        ;;
      -Purple)
        theme_color_dark='#AB47BC'
        theme_color_light='#BA68C8'
        ;;
      -Pink)
        theme_color_dark='#EC407A'
        theme_color_light='#F06292'
        ;;
      -Red)
        theme_color_dark='#E53935'
        theme_color_light='#F44336'
        ;;
      -Orange)
        theme_color_dark='#F57C00'
        theme_color_light='#FB8C00'
        ;;
      -Yellow)
        theme_color_dark='#FBC02D'
        theme_color_light='#FFD600'
        ;;
      -Green)
        theme_color_dark='#4CAF50'
        theme_color_light='#66BB6A'
        ;;
      -Blue)
        theme_color_dark='#3c84f7'
        theme_color_light='#5b9bf8'
        ;;
      -Grey)
        theme_color_dark='#464646'
        theme_color_light='#DDDDDD'
        ;;
    esac

    if [[ "$type" == '-Nord' ]]; then
      background_light='#f0f1f4'
      background_dark='#242932'

      case "$theme" in
        '')
          theme_color_dark='#63a6a5'
          theme_color_light='#83b9b8'
          ;;
        -Purple)
          theme_color_dark='#b57daa'
          theme_color_light='#c89dbf'
          ;;
        -Pink)
          theme_color_dark='#cd7092'
          theme_color_light='#dc98b1'
          ;;
        -Red)
          theme_color_dark='#c35b65'
          theme_color_light='#d4878f'
          ;;
        -Orange)
          theme_color_dark='#d0846c'
          theme_color_light='#dca493'
          ;;
        -Yellow)
          theme_color_dark='#e4b558'
          theme_color_light='#eac985'
          ;;
        -Green)
          theme_color_dark='#82ac5d'
          theme_color_light='#a0c082'
          ;;
        -Blue)
          theme_color_dark='#5e81ac'
          theme_color_light='#89a3c2'
          ;;
        -Grey)
          theme_color_dark='#3a4150'
          theme_color_light='#d9dce3'
          ;;
      esac
    fi

    if [[ "$type" == '-Dracula' ]]; then
      background_light='#f0f1f4'
      background_dark='#242632'

      case "$theme" in
        '')
          theme_color_dark='#20eed9'
          theme_color_light='#50fae9'
          ;;
        -Purple)
          theme_color_dark='#a679ec'
          theme_color_light='#bd93f9'
          ;;
        -Pink)
          theme_color_dark='#f04cab'
          theme_color_light='#ff79c6'
          ;;
        -Red)
          theme_color_dark='#f44d4d'
          theme_color_light='#ff5555'
          ;;
        -Orange)
          theme_color_dark='#f8a854'
          theme_color_light='#ffb86c'
          ;;
        -Yellow)
          theme_color_dark='#e8f467'
          theme_color_light='#f1fa8c'
          ;;
        -Green)
          theme_color_dark='#4be772'
          theme_color_light='#50fa7b'
          ;;
        -Blue)
          theme_color_dark='#a679ec'
          theme_color_light='#bd93f9'
          ;;
        -Grey)
          theme_color_dark='#3c3f51'
          theme_color_light='#d9dae3'
          ;;
      esac
    fi

    if [[ "$type" != '' ]]; then
      rm -rf "thumbnail${theme}${type}.svg"
      cp -rf "thumbnail.svg" "thumbnail${theme}${type}.svg"
      sed -i "s/#009688/${theme_color_dark}/g" "thumbnail${theme}${type}.svg"
      sed -i "s/#4db6ac/${theme_color_light}/g" "thumbnail${theme}${type}.svg"
      sed -i "s/#f2f2f2/${background_light}/g" "thumbnail${theme}${type}.svg"
      sed -i "s/#2c2c2c/${background_dark}/g" "thumbnail${theme}${type}.svg"
      sed -i "s/thumbnail/thumbnail${theme}${type}/g" "thumbnail${theme}${type}.svg"
    elif [[ "$theme" != '' ]]; then
      rm -rf "thumbnail${theme}.svg"
      cp -rf "thumbnail.svg" "thumbnail${theme}.svg"
      sed -i "s/#009688/${theme_color_dark}/g" "thumbnail${theme}.svg"
      sed -i "s/#4db6ac/${theme_color_light}/g" "thumbnail${theme}.svg"
      sed -i "s/thumbnail/thumbnail${theme}/g" "thumbnail${theme}.svg"
    fi
  done
done

echo -e "DONE!"
