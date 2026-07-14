.include "ap.inc"
.section .data.frontier_ending_cg.tail_ap,"aw",%progbits
.global SpriteAnim_FrontierEndingCgTail_B3B334
.align 1, 0
.type SpriteAnim_FrontierEndingCgTail_B3B334, %object
SpriteAnim_FrontierEndingCgTail_B3B334:
    .hword .Lftab-SpriteAnim_FrontierEndingCgTail_B3B334
    .hword .Latab-SpriteAnim_FrontierEndingCgTail_B3B334
.Lftab:
    .hword .Lf0-.Lftab, .Lf1-.Lftab, .Lf2-.Lftab, .Lf3-.Lftab, .Lf4-.Lftab
.Latab:
    .hword .La0-.Latab, .La1-.Latab
.Lf0: ap_rotscale 1
    ap_affine 0x100, 0x40, 0x40
    ap_objs 1
    ap_obj 0x01F0, 0x81F0, 0
.Lf1: ap_rotscale 1
    ap_affine 0x100, 0x73, 0x73
    ap_objs 1
    ap_obj 0x01F0, 0x81F0, 0
.Lf2: ap_rotscale 1
    ap_affine 0x100, 0xA6, 0xA6
    ap_objs 1
    ap_obj 0x01F0, 0x81F0, 0
.Lf3: ap_rotscale 1
    ap_affine 0x100, 0xD8, 0xD9
    ap_objs 1
    ap_obj 0x01F0, 0x81F0, 0
.Lf4:
    ap_objs 1
    ap_obj 0x00F0, 0x81F0, 0
.La0:
    ap_anim 4,0
    ap_anim 3,1
    ap_anim 3,2
    ap_anim 3,3
    ap_anim 4,4
    ap_anim 3,3
    ap_anim 3,2
    ap_anim 3,1
    .hword 0,2
    ap_anim_loop
.La1:
    ap_anim 2,0
    ap_anim 2,1
    ap_anim 2,2
    ap_anim 2,3
    ap_anim 2,4
    .hword 0,2
    ap_anim_loop
    .hword 0
.size SpriteAnim_FrontierEndingCgTail_B3B334, .-SpriteAnim_FrontierEndingCgTail_B3B334
