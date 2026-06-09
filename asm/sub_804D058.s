	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.sub_804D058, "ax", %progbits
@ sub_804D058 @ JP 0x0804D058 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D058
	.thumb_func
sub_804D058:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _0804D078 @ =0x080DEFC2
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D078: .4byte 0x080DEFC2

