	.syntax unified
	.set sub_8091590, 0x08091590 + 1
	.set sub_809162C, 0x0809162C + 1
	.section .text.sub_809227C, "ax", %progbits
@ sub_809227C @ JP 0x0809227C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809227C
	.thumb_func
sub_809227C:
	push {r4, lr}
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl sub_8091590
	adds r1, r4, #0
	adds r1, #0x54
	movs r0, #0
	strb r0, [r1]
	adds r1, #5
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x5a
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_809162C
	pop {r4}
	pop {r0}
	bx r0

