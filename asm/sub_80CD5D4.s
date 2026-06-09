	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80CD5D4, "ax", %progbits
@ sub_80CD5D4 @ JP 0x080CD5D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CD5D4
	.thumb_func
sub_80CD5D4:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc
	bl sub_8012E84
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #3
	movs r1, #8
	movs r2, #8
	bl SetBlendConfig
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0x28
	bne _080CD612
	adds r0, r5, #0
	bl sub_8002DE4
	b _080CD616
_080CD612:
	adds r0, r1, #1
	strh r0, [r4]
_080CD616:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

