	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutText, 0x08003DA0 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_80B0AE8, "ax", %progbits
@ sub_80B0AE8 @ JP 0x080B0AE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0AE8
	.thumb_func
sub_80B0AE8:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _080B0B24 @ =0x02022E76
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0xa
	movs r3, #0
	bl j_TmFillRect
	movs r6, #0xe0
	lsls r6, r6, #1
	adds r5, #0x38
	ldr r0, _080B0B28 @ =0xFFFFFE56
	adds r7, r4, r0
	movs r4, #4
_080B0B06:
	adds r1, r6, r7
	adds r0, r5, #0
	bl PutText
	adds r6, #0x80
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080B0B06
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0B24: .4byte 0x02022E76
_080B0B28: .4byte 0xFFFFFE56

