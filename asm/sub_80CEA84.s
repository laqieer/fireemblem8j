	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80CEA84, "ax", %progbits
@ sub_80CEA84 @ JP 0x080CEA84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CEA84
	.thumb_func
sub_80CEA84:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xd
	bl sub_8012E84
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x30
	bne _080CEABC
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CEAC0
_080CEABC:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CEAC0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

