	.syntax unified
	.set MapUnitC_GetPosition, 0x080BFD74 + 1
	.section .text.sub_80C2E8C, "ax", %progbits
@ sub_80C2E8C @ JP 0x080C2E8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2E8C
	.thumb_func
sub_80C2E8C:
	push {r4, lr}
	lsls r1, r1, #2
	adds r4, r0, #0
	adds r4, #0x2c
	adds r4, r4, r1
	ldr r1, [r4]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapUnitC_GetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

