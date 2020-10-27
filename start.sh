#!/bin/bash
set -e

mkdir -pv icons

node generate_svg.js

GEN=template/generate_png.sh
TARGET=output

mkdir -pv $TARGET

# Generate list.png
FONT_SIZE=36px SIZE=70,50 \
$GEN "Git"                          $TARGET/list.png                    &

$GEN "git push"                     $TARGET/git_push.png                &
$GEN "git push -f"                  $TARGET/git_push_f.png              &

$GEN "git pull"                     $TARGET/git_pull.png                &

$GEN "git rm -rf"   "."             $TARGET/git_rm_all.png              &

$GEN "git stash"    "push"          $TARGET/git_stash_push.png          &
$GEN "git stash"    "pop"           $TARGET/git_stash_pop.png           &

$GEN "git reset"    "--hard"        $TARGET/git_reset_hard.png          &
$GEN "git reset"    "--mixed"       $TARGET/git_reset_mixed.png         &
$GEN "git reset"    "--soft"        $TARGET/git_reset_soft.png          &

$GEN "git switch"   "master"        $TARGET/git_switch_master.png       &
$GEN "git switch"   "slave"         $TARGET/git_switch_slave.png        &
$GEN "git switch"   "프갤"          $TARGET/git_switch_pg.png           &
$GEN "git switch"   "느그갤"        $TARGET/git_switch_yg.png           &
$GEN "git switch"   "일베"          $TARGET/git_switch_ib.png           &
$GEN "git switch"   "루리웹"        $TARGET/git_switch_rw.png           &

$GEN "git tag"      "힙"            $TARGET/git_tag_hipster.png         &
$GEN "git tag"      "함"            $TARGET/git_tag_functional.png      &
$GEN "git tag"      "땔"            $TARGET/git_tag_firewood.png        &
$GEN "git tag"      "찐"            $TARGET/git_tag_wls.png             &
$GEN "git tag"      "틀"            $TARGET/git_tag_xmf.png             &
$GEN "git tag"      "씹"            $TARGET/git_tag_tlq.png             &
$GEN "git tag"      "러"            $TARGET/git_tag_rust.png            &

$GEN "git add"                      $TARGET/git_add.png                 &
$GEN "git add"      "-A"            $TARGET/git_add_all.png             &

$GEN "git commit"                   $TARGET/git_commit.png              &
$GEN "git clone"                    $TARGET/git_clone.png               &
$GEN "git merge"                    $TARGET/git_merge.png               &
$GEN "git blame"                    $TARGET/git_blame.png               &
$GEN "git fetch"                    $TARGET/git_fetch.png               &
$GEN "git init"                     $TARGET/git_init.png                &
$GEN "git diff"                     $TARGET/git_diff.png                &
$GEN "git log"                      $TARGET/git_log.png                 &
$GEN "git gc"                       $TARGET/git_gc.png                  &

wait
