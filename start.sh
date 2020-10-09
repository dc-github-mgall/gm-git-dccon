#!/bin/sh

GEN=template/generate_png.sh
TARGET=output

mkdir -pv $TARGET

$GEN "git push -f"                  $TARGET/git_push.png            &
$GEN "git push -f"  "origin main"   $TARGET/git_push_main.png       &
$GEN "git push -f"  "origin master" $TARGET/git_push_master.png     &

$GEN "git reset"    "--hard"        $TARGET/git_reset_hard.png      &
$GEN "git reset"    "--mixed"       $TARGET/git_reset_mixed.png     &
$GEN "git reset"    "--soft"        $TARGET/git_reset_soft.png      &

wait
