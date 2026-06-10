	.syntax unified
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.section .text.sub_8029024, "ax", %progbits
@ sub_8029024 @ JP 0x08029024 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029024
	.thumb_func
sub_8029024:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8018E64
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_8018EA4
	cmp r5, r0
	beq _0802903C
	movs r0, #1
	b _0802903E
_0802903C:
	movs r0, #0
_0802903E:
	pop {r4, r5}
	pop {r1}
	bx r1

