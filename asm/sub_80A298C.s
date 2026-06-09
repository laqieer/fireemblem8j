	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8097D18, 0x08097D18 + 1
	.set sub_809A7D8, 0x0809A7D8 + 1
	.section .text.sub_80A298C, "ax", %progbits
@ sub_80A298C @ JP 0x080A298C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A298C
	.thumb_func
sub_80A298C:
	push {lr}
	bl sub_8097D18
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl sub_809A7D8
	pop {r0}
	bx r0
	.align 2, 0

