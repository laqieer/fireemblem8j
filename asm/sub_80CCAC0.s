	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CB720, 0x080CB720 + 1
	.set sub_80CB7D8, 0x080CB7D8 + 1
	.set sub_80CC590, 0x080CC590 + 1
	.section .text.sub_80CCAC0, "ax", %progbits
@ sub_80CCAC0 @ JP 0x080CCAC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CCAC0
	.thumb_func
sub_80CCAC0:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #5
	bl BG_EnableSyncByMask
	ldrh r0, [r6, #0x2a]
	cmp r0, #1
	bhi _080CCAF8
	ldr r3, _080CCC20 @ =0x08B3F1CE
	ldr r0, _080CCC24 @ =0x00002046
	str r0, [sp]
	movs r0, #1
	movs r1, #0xaa
	movs r2, #0x78
	bl PutSpriteExt
	ldr r3, _080CCC28 @ =0x08B3F1DC
	ldr r0, _080CCC2C @ =0x00002066
	str r0, [sp]
	movs r0, #1
	movs r1, #0x98
	movs r2, #0x88
	bl PutSpriteExt
_080CCAF8:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bhi _080CCB3C
	adds r3, r0, #0
	movs r5, #0x10
	str r5, [sp]
	movs r0, #1
	movs r1, #0x78
	movs r2, #0xa0
	bl sub_8012E84
	ldr r4, _080CCC30 @ =0x02022188
	strh r0, [r4, #6]
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r6, #0x2a]
	str r5, [sp]
	movs r0, #1
	movs r1, #0xe8
	bl sub_8012E84
	adds r5, r0, #0
	movs r0, #6
	ldrsh r1, [r4, r0]
	adds r1, #0x10
	adds r0, r5, #0
	bl sub_80CC590
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bne _080CCB3C
	movs r0, #0
	bl SetPrimaryHBlankHandler
_080CCB3C:
	ldrh r2, [r6, #0x2a]
	mov r8, r2
	mov r7, r8
	subs r7, #4
	cmp r7, #0
	blt _080CCC3C
	cmp r7, #0x18
	bgt _080CCB7E
	ldrh r1, [r6, #0x34]
	movs r2, #0xb8
	lsls r2, r2, #1
	movs r0, #0x18
	str r0, [sp]
	movs r0, #1
	adds r3, r7, #0
	bl sub_8012E84
	adds r5, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x30
	ldrsh r1, [r6, r3]
	ldr r2, _080CCC34 @ =0x02021188
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0x88
	movs r3, #2
	bl sub_80CB720
	strh r5, [r6, #0x30]
_080CCB7E:
	movs r0, #0xb
	rsbs r0, r0, #0
	add r0, r8
	mov sb, r0
	cmp r0, #0
	blt _080CCC3C
	cmp r7, #0x18
	bne _080CCBAC
	movs r4, #0
	str r4, [sp]
	movs r0, #1
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
_080CCBAC:
	cmp r7, #0x17
	ble _080CCBD8
	mov r3, r8
	subs r3, #0x1b
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	adds r5, r0, #0
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetBlendConfig
_080CCBD8:
	ldrh r1, [r6, #0x36]
	movs r2, #0xc0
	lsls r2, r2, #1
	movs r0, #0x18
	str r0, [sp]
	movs r0, #1
	mov r3, sb
	bl sub_8012E84
	adds r5, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	ldr r2, _080CCC38 @ =0x02020188
	str r2, [sp]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r2, r3
	str r2, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r2, #0xc8
	movs r3, #0
	bl sub_80CB7D8
	strh r5, [r6, #0x32]
	mov r0, sb
	cmp r0, #0x18
	bne _080CCC3C
	strh r4, [r6, #0x2a]
	adds r0, r6, #0
	bl sub_8002DE4
	b _080CCC42
	.align 2, 0
_080CCC20: .4byte 0x08B3F1CE
_080CCC24: .4byte 0x00002046
_080CCC28: .4byte 0x08B3F1DC
_080CCC2C: .4byte 0x00002066
_080CCC30: .4byte 0x02022188
_080CCC34: .4byte 0x02021188
_080CCC38: .4byte 0x02020188
_080CCC3C:
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CCC42:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

