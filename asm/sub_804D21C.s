	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_804D21C, "ax", %progbits
@ sub_804D21C @ JP 0x0804D21C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D21C
	.thumb_func
sub_804D21C:
	push {lr}
	sub sp, #4
	ldr r3, _0804D238 @ =0x085D4A10
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #8
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0804D238: .4byte 0x085D4A10

