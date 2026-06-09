	.syntax unified
	.set sub_809C5EC, 0x0809C5EC + 1
	.section .text.sub_809AE20, "ax", %progbits
@ sub_809AE20 @ JP 0x0809AE20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809AE20
	.thumb_func
sub_809AE20:
	push {lr}
	sub sp, #4
	ldr r0, _0809AE3C @ =0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x59
	movs r2, #9
	movs r3, #4
	bl sub_809C5EC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809AE3C: .4byte 0x0000A440

