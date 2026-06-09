	.syntax unified
	.set _Balloc, 0x080D9968 + 1
	.section .text._i2b, "ax", %progbits
@ _i2b @ JP 0x080D9BD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _i2b
	.thumb_func
_i2b:
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #1
	bl _Balloc
	str r4, [r0, #0x14]
	movs r1, #1
	str r1, [r0, #0x10]
	pop {r4, pc}
	.align 2, 0

