	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.sub_804E5C8, "ax", %progbits
@ sub_804E5C8 @ JP 0x0804E5C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E5C8
	.thumb_func
sub_804E5C8:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _0804E5E8 @ =0x080DF29C
	movs r0, #0x9d
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E5E8: .4byte 0x080DF29C

