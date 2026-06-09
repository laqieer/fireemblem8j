	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80CD474, "ax", %progbits
@ sub_80CD474 @ JP 0x080CD474 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CD474
	.thumb_func
sub_80CD474:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0
	bne _080CD4B8
	ldr r2, _080CD4E0 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #3
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
_080CD4B8:
	ldrh r3, [r4, #0x2a]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	ldr r1, _080CD4E0 @ =0x03003020
	adds r1, #0x46
	strb r0, [r1]
	ldrh r0, [r4, #0x2a]
	cmp r0, #8
	bne _080CD4E4
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CD4E8
	.align 2, 0
_080CD4E0: .4byte 0x03003020
_080CD4E4:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CD4E8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

