	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set ResetFaces, 0x08005430 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.section .text.sub_80D23A0, "ax", %progbits
@ sub_80D23A0 @ JP 0x080D23A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D23A0
	.thumb_func
sub_80D23A0:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x38
	ldrb r0, [r0]
	strh r0, [r4, #0x2a]
	ldrh r0, [r4, #0x2a]
	bl GetUnitFromCharId
	cmp r0, #0
	beq _080D23C4
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	b _080D23CC
_080D23C4:
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0
	strb r0, [r1]
_080D23CC:
	bl ResetFaces
	bl ResetText
	bl sub_804F8F4
	bl sub_801569C
	ldr r4, _080D2478 @ =0x03003020
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r5, #1
	orrs r1, r5
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8097CFC
	ldr r0, _080D247C @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldrb r0, [r4, #1]
	orrs r0, r5
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl sub_8006710
	movs r0, #1
	movs r1, #0xe
	movs r2, #8
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2478: .4byte 0x03003020
_080D247C: .4byte 0x02023CA8

