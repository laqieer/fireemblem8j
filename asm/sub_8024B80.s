	.syntax unified
	.set sub_801E3A4, 0x0801E3A4 + 1
	.section .text.sub_8024B80, "ax", %progbits
@ sub_8024B80 @ JP 0x08024B80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024B80
	.thumb_func
sub_8024B80:
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08024B94
	movs r0, #5
	bl sub_801E3A4
	b _08024B9E
_08024B94:
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #1
	bl sub_801E3A4
_08024B9E:
	pop {r1}
	bx r1
	.align 2, 0

