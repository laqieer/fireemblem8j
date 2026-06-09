	.syntax unified
	.set sub_8021A2C, 0x08021A2C + 1
	.section .text.sub_8012A14, "ax", %progbits
@ sub_8012A14 @ JP 0x08012A14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012A14
	.thumb_func
sub_8012A14:
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	bl sub_8021A2C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

