	.syntax unified
	.set sub_80B9F40, 0x080B9F40 + 1
	.section .text.sub_80D2C74, "ax", %progbits
@ sub_80D2C74 @ JP 0x080D2C74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2C74
	.thumb_func
sub_80D2C74:
	push {lr}
	movs r0, #0xe0
	movs r1, #3
	bl sub_80B9F40
	pop {r0}
	bx r0
	.align 2, 0

