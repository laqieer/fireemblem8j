	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.section .text.sub_8097E10, "ax", %progbits
@ sub_8097E10 @ JP 0x08097E10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097E10
	.thumb_func
sub_8097E10:
	push {r4, r5, lr}
	ldr r5, _08097E3C @ =0x020111A4
	movs r4, #4
_08097E16:
	adds r0, r5, #0
	bl sub_8003CF8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08097E16
	ldr r0, _08097E40 @ =0x02023E42
	movs r1, #0xf
	movs r2, #0xa
	movs r3, #0
	bl j_TmFillRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097E3C: .4byte 0x020111A4
_08097E40: .4byte 0x02023E42

