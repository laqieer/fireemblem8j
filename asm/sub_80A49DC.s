	.syntax unified
	.set GetUnitsAverageSupportValue, 0x080A7EAC + 1
	.set SGM_SetCharacterKnown, 0x080A81EC + 1
	.set sub_8086AC4, 0x08086AC4 + 1
	.set sub_80A8168, 0x080A8168 + 1
	.section .text.sub_80A49DC, "ax", %progbits
@ sub_80A49DC @ JP 0x080A49DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A49DC
	.thumb_func
sub_80A49DC:
	push {r4, r5, r6, r7, lr}
	bl sub_8086AC4
	adds r6, r0, #0
	ldrh r0, [r6]
	ldr r1, _080A4A24 @ =0x0000FFFF
	cmp r0, r1
	beq _080A4A1C
	adds r7, r1, #0
_080A49EE:
	ldrh r0, [r6]
	movs r1, #0
	bl SGM_SetCharacterKnown
	ldrh r0, [r6, #2]
	movs r1, #0
	bl SGM_SetCharacterKnown
	ldrh r4, [r6]
	ldrh r5, [r6, #2]
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetUnitsAverageSupportValue
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A8168
	adds r6, #0x10
	ldrh r0, [r6]
	cmp r0, r7
	bne _080A49EE
_080A4A1C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4A24: .4byte 0x0000FFFF

