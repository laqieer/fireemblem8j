	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_8098C14, "ax", %progbits
@ sub_8098C14 @ JP 0x08098C14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098C14
	.thumb_func
sub_8098C14:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _08098C38 @ =0x08A942F0
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
_08098C38: .4byte 0x08A942F0

