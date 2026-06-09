	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80C086C, 0x080C086C + 1
	.section .text.sub_80C36D4, "ax", %progbits
@ sub_80C36D4 @ JP 0x080C36D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C36D4
	.thumb_func
sub_80C36D4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r5, #0
	bl sub_80C086C
	adds r5, r0, #0
	movs r0, #0x40
	adds r1, r5, #0
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl sub_80043B8
	pop {r4, r5}
	pop {r0}
	bx r0

