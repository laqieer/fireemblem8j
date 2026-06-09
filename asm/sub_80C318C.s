	.syntax unified
	.set MapUnitC_GetPosition, 0x080BFD74 + 1
	.section .text.sub_80C318C, "ax", %progbits
@ sub_80C318C @ JP 0x080C318C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C318C
	.thumb_func
sub_80C318C:
	push {r4, lr}
	adds r4, r3, #0
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapUnitC_GetPosition
	ldrh r0, [r4]
	subs r0, #6
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

