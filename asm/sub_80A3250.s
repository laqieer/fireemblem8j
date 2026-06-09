	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8091544, 0x08091544 + 1
	.set sub_8097D18, 0x08097D18 + 1
	.set sub_80B2874, 0x080B2874 + 1
	.section .text.sub_80A3250, "ax", %progbits
@ sub_80A3250 @ JP 0x080A3250 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3250
	.thumb_func
sub_80A3250:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8091544
	adds r0, r4, #0
	bl sub_80B2874
	bl sub_8097D18
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0

