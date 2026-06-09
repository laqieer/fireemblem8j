	.syntax unified
	.set MapUnitC_GetLayer, 0x080BFE38 + 1
	.section .text.sub_80C2EB0, "ax", %progbits
@ sub_80C2EB0 @ JP 0x080C2EB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2EB0
	.thumb_func
sub_80C2EB0:
	push {lr}
	lsls r1, r1, #2
	adds r2, r0, #0
	adds r2, #0x2c
	adds r2, r2, r1
	ldr r1, [r2]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapUnitC_GetLayer
	pop {r1}
	bx r1

