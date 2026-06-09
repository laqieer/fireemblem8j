	.syntax unified
	.set sub_809C5EC, 0x0809C5EC + 1
	.section .text.sub_809AE80, "ax", %progbits
@ sub_809AE80 @ JP 0x0809AE80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809AE80
	.thumb_func
sub_809AE80:
	push {lr}
	sub sp, #4
	ldr r0, _0809AE9C @ =0x0000A440
	str r0, [sp]
	movs r0, #8
	movs r1, #0x5c
	movs r2, #0xa
	movs r3, #5
	bl sub_809C5EC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809AE9C: .4byte 0x0000A440

