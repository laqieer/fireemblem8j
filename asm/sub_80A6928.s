	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set sub_8097D18, 0x08097D18 + 1
	.set sub_80A5868, 0x080A5868 + 1
	.set sub_80B2874, 0x080B2874 + 1
	.section .text.sub_80A6928, "ax", %progbits
@ sub_80A6928 @ JP 0x080A6928 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6928
	.thumb_func
sub_80A6928:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80B2874
	bl sub_8097D18
	movs r0, #0
	bl EndFaceById
	ldr r0, [r4, #0x2c]
	bl sub_80A5868
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

