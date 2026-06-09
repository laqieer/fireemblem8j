	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set IsCharacterForceDeployed_, 0x08086ACC + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_80976D0, "ax", %progbits
@ sub_80976D0 @ JP 0x080976D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80976D0
	.thumb_func
sub_80976D0:
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080976F4
	bl sub_80C1E74
	cmp r0, #0
	bne _080976F4
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl IsCharacterForceDeployed_
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080976F6
_080976F4:
	movs r0, #0
_080976F6:
	pop {r4}
	pop {r1}
	bx r1

