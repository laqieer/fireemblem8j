	.syntax unified
	.set sub_80C5314, 0x080C5314 + 1
	.section .text.sub_800CC14, "ax", %progbits
@ sub_800CC14 @ JP 0x0800CC14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CC14
	.thumb_func
sub_800CC14:
	push {lr}
	bl sub_80C5314
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CC24
	movs r0, #3
	b _0800CC26
_0800CC24:
	movs r0, #2
_0800CC26:
	pop {r1}
	bx r1
	.align 2, 0

