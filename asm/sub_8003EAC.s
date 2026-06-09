	.syntax unified
	.set sub_8003E0C, 0x08003E0C + 1
	.section .text.sub_8003EAC, "ax", %progbits
@ sub_8003EAC @ JP 0x08003EAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003EAC
	.thumb_func
sub_8003EAC:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl sub_8003E0C
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

