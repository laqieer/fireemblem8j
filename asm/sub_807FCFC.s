	.syntax unified
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807FCFC, "ax", %progbits
@ sub_807FCFC @ JP 0x0807FCFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807FCFC
	.thumb_func
sub_807FCFC:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x40
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0807FD18
	adds r0, r4, #0
	bl sub_8002DE4
_0807FD18:
	ldrh r1, [r5]
	movs r0, #0x16
	subs r0, r0, r1
	adds r2, r4, #0
	adds r2, #0x42
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _0807FD30
	movs r0, #0x10
	strh r0, [r2]
_0807FD30:
	ldrb r1, [r5]
	ldrb r2, [r2]
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropB
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

