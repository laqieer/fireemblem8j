	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80989AC, "ax", %progbits
@ sub_80989AC @ JP 0x080989AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80989AC
	.thumb_func
sub_80989AC:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _080989D0 @ =0x08A942B2
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080989D0: .4byte 0x08A942B2

