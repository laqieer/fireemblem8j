	.syntax unified
	.set Minimap_HandleMoveInput, 0x080ACFFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80ACEB4, 0x080ACEB4 + 1
	.set sub_80ACEF0, 0x080ACEF0 + 1
	.set sub_80ACF34, 0x080ACF34 + 1
	.set sub_80ACF80, 0x080ACF80 + 1
	.section .text.sub_80AD120, "ax", %progbits
@ sub_80AD120 @ JP 0x080AD120 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD120
	.thumb_func
sub_80AD120:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_80ACEB4
	adds r0, r4, #0
	bl sub_80ACEF0
	adds r0, r4, #0
	bl sub_80ACF80
	adds r0, r4, #0
	bl sub_80ACF34
	adds r0, r4, #0
	bl Minimap_HandleMoveInput
	ldr r0, _080AD180 @ =0x085775CC
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _080AD184
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetBlendConfig
	b _080AD1AC
	.align 2, 0
_080AD180: .4byte 0x085775CC
_080AD184:
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #3
	movs r1, #0x10
	movs r2, #0
	movs r3, #4
	bl SetBlendConfig
_080AD1AC:
	ldr r0, _080AD1D4 @ =0x0202BCAC
	ldr r0, [r0, #0xc]
	ldr r1, _080AD1D8 @ =0x000F000F
	ands r0, r1
	cmp r0, #0
	bne _080AD1CC
	ldr r0, _080AD1DC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080AD1CC
	adds r0, r4, #0
	bl sub_8002DE4
_080AD1CC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD1D4: .4byte 0x0202BCAC
_080AD1D8: .4byte 0x000F000F
_080AD1DC: .4byte 0x085775CC

