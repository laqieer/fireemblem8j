	.syntax unified
	.set ForceScreenToBlack, 0x08014268 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_8010F98, 0x08010F98 + 1
	.set sub_80156F0, 0x080156F0 + 1
	.set sub_8091544, 0x08091544 + 1
	.section .text.sub_80123F4, "ax", %progbits
@ sub_80123F4 @ JP 0x080123F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80123F4
	.thumb_func
sub_80123F4:
	push {lr}
	bl sub_8091544
	bl sub_8010F98
	movs r0, #0
	bl sub_8001ACC
	bl ForceScreenToBlack
	bl sub_80042E0
	bl sub_80156F0
	pop {r0}
	bx r0

