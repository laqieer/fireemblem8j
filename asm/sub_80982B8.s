	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_80982B8, "ax", %progbits
@ sub_80982B8 @ JP 0x080982B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80982B8
	.thumb_func
sub_80982B8:
	push {lr}
	ldr r0, _080982DC @ =0x02022DEE
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080982E0 @ =0x020235EE
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl j_TmFillRect
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080982DC: .4byte 0x02022DEE
_080982E0: .4byte 0x020235EE

