	.syntax unified
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80B79D8, "ax", %progbits
@ sub_80B79D8 @ JP 0x080B79D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B79D8
	.thumb_func
sub_80B79D8:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	asrs r0, r0, #1
	movs r3, #0x10
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBlendConfig
	movs r0, #1
	bl SetBlendBackdropA
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne _080B7A10
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
_080B7A10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

