	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_809927C, "ax", %progbits
@ sub_809927C @ JP 0x0809927C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809927C
	.thumb_func
sub_809927C:
	push {lr}
	ldr r1, [r0, #0x60]
	cmp r1, #0
	beq _0809928A
	ldr r0, [r0, #0x14]
	bl sub_80D65C0
_0809928A:
	pop {r0}
	bx r0
	.align 2, 0

