#!/bin/bash
set -e

mkdir -pv icons

node generate_svg.js

IMG_INDEX=00
TARGET=output

mkdir -pv $TARGET

function gen() {
    if [ "$#" -eq 2 ]; then
        template/generate_png.sh "$1"       "$TARGET/$(printf %02d $IMG_INDEX)-$2.png" &
    else
        template/generate_png.sh "$1" "$2"  "$TARGET/$(printf %02d $IMG_INDEX)-$3.png" &
    fi
    IMG_INDEX=$(expr $IMG_INDEX + 1)
}

# Generate list.png
FONT_SIZE=36px SIZE=70,50 \
gen "Git"   list

gen "git push"                  git_push
gen "git push -f"               git_push_f

gen "git pull"                  git_pull

gen "git rm -rf"   "."          git_rm_all

gen "git stash"    "push"       git_stash_push
gen "git stash"    "pop"        git_stash_pop

gen "git reset"    "--hard"     git_reset_hard
gen "git reset"    "--mixed"    git_reset_mixed
gen "git reset"    "--soft"     git_reset_soft

gen "git switch"   "master"     git_switch_master
gen "git switch"   "slave"      git_switch_slave
gen "git switch"   "프갤"       git_switch_pg
gen "git switch"   "느그갤"     git_switch_yg
gen "git switch"   "일베"       git_switch_ib
gen "git switch"   "루리웹"     git_switch_rw

gen "git tag"      "힙"         git_tag_hipster
gen "git tag"      "함"         git_tag_functional
gen "git tag"      "땔"         git_tag_firewood
gen "git tag"      "찐"         git_tag_wls
gen "git tag"      "틀"         git_tag_xmf
gen "git tag"      "씹"         git_tag_tlq
gen "git tag"      "러"         git_tag_rust

gen "git add"                   git_add
gen "git add"      "-A"         git_add_all

gen "git commit"                git_commit
gen "git clone"                 git_clone
gen "git merge"                 git_merge
gen "git blame"                 git_blame
gen "git fetch"                 git_fetch
gen "git init"                  git_init
gen "git diff"                  git_diff
gen "git log"                   git_log
gen "git gc"                    git_gc

wait
