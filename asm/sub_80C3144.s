	.syntax unified
	.set MapUnitC_SetPosition, 0x080BFD64 + 1
	.section .text.sub_80C3144, "ax", %progbits
@ sub_80C3144 @ JP 0x080C3144 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3144
	.thumb_func
sub_80C3144:
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	adds r4, r3, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r6, [r0]
	movs r0, #0xc0
	lsls r0, r0, #0xb
	adds r4, r4, r0
	asrs r4, r4, #0x10
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r5, #0
	adds r3, r4, #0
	bl MapUnitC_SetPosition
	adds r0, r6, #0
	adds r0, #0x44
	movs r1, #0
	strh r5, [r0]
	adds r0, #2
	strh r4, [r0]
	subs r0, #6
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

