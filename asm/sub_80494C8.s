	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DrawUiFrame, 0x0804EF40 + 1
	.section .text.sub_80494C8, "ax", %progbits
@ sub_80494C8 @ JP 0x080494C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80494C8
	.thumb_func
sub_80494C8:
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _080494F8 @ =0x020234A8
	movs r1, #6
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #2
	movs r2, #9
	movs r3, #0x10
	bl DrawUiFrame
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r5, #0x68
	strh r4, [r5]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080494F8: .4byte 0x020234A8

