	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80A0E90, "ax", %progbits
@ sub_80A0E90 @ JP 0x080A0E90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A0E90
	.thumb_func
sub_80A0E90:
	push {r4, lr}
	sub sp, #8
	ldr r4, _080A0ECC @ =0x02022D10
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080A0ED0 @ =0x00000534
	bl sub_8009FA8
	ldr r2, _080A0ED4 @ =0x020136D0
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0ECC: .4byte 0x02022D10
_080A0ED0: .4byte 0x00000534
_080A0ED4: .4byte 0x020136D0

