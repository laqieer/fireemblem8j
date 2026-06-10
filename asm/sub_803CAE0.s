	.syntax unified
	.set sub_803F9C0, 0x0803F9C0 + 1
	.section .text.sub_803CAE0, "ax", %progbits
@ sub_803CAE0 @ JP 0x0803CAE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CAE0
	.thumb_func
sub_803CAE0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803CAF8 @ =sub_803C7A8
	bl sub_803F9C0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CAF8: .4byte 0x0803C7A9  @ sub_803C7A8

