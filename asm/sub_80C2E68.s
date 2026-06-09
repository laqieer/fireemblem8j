	.syntax unified
	.set sub_80BFE10, 0x080BFE10 + 1
	.section .text.sub_80C2E68, "ax", %progbits
@ sub_80C2E68 @ JP 0x080C2E68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2E68
	.thumb_func
sub_80C2E68:
	push {lr}
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r1, #2
	adds r3, r0, #0
	adds r3, #0x2c
	adds r3, r3, r1
	ldr r1, [r3]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80BFE10
	pop {r0}
	bx r0

