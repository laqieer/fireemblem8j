	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_80056AC, 0x080056AC + 1
	.set sub_80130AC, 0x080130AC + 1
	.section .text.sub_8005EE4, "ax", %progbits
@ sub_8005EE4 @ JP 0x08005EE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005EE4
	.thumb_func
sub_8005EE4:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl sub_80056AC
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0
	bne _08005F38
	ldr r0, [r4, #0x2c]
	bl sub_80056AC
	movs r1, #8
	ands r1, r0
	movs r3, #0
	cmp r1, #0
	bne _08005F0A
	movs r3, #0x18
_08005F0A:
	adds r3, #0x10
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r3, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _08005F30 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _08005F34 @ =0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl sub_80130AC
	b _08005FA8
	.align 2, 0
_08005F30: .4byte 0x000003FF
_08005F34: .4byte 0x06010000
_08005F38:
	ldrh r0, [r4, #0x32]
	subs r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08005FA8
	ldr r0, [r4, #0x2c]
	bl sub_80056AC
	movs r1, #8
	ands r1, r0
	movs r5, #0
	cmp r1, #0
	bne _08005F56
	movs r5, #0x18
_08005F56:
	bl AdvanceGetLCGRNValue
	lsrs r0, r0, #0x10
	movs r1, #7
	ands r0, r1
	adds r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08005F82
	cmp r0, #1
	ble _08005F88
	cmp r0, #2
	beq _08005F86
	cmp r0, #3
	bne _08005F88
_08005F82:
	adds r5, #8
	b _08005F88
_08005F86:
	adds r5, #0x10
_08005F88:
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r5, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _08006028 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _0800602C @ =0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl sub_80130AC
_08005FA8:
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x2c]
	ldrb r2, [r1, #0x14]
	movs r1, #4
	subs r5, r1, r2
	bl sub_80056AC
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	bne _08005FC0
	rsbs r5, r5, #0
_08005FC0:
	lsls r1, r5, #3
	ldr r0, [r4, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r5, r1, #0
	subs r5, #0x10
	ldr r1, _08006030 @ =0x000001FF
	ands r5, r1
	bl sub_80056AC
	ands r0, r6
	cmp r0, #0
	beq _08005FE2
	movs r0, #0x80
	lsls r0, r0, #5
	adds r5, r5, r0
_08005FE2:
	ldr r0, [r4, #0x2c]
	bl sub_80056AC
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	rsbs r2, r2, #0
	asrs r2, r2, #0x1f
	ands r2, r0
	ldr r4, [r4, #0x2c]
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #0x15]
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0xff
	ands r1, r0
	adds r2, r2, r1
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _08006034 @ =0x085B8D24
	ldrh r1, [r4, #0x3c]
	adds r1, #0x1c
	str r1, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006028: .4byte 0x000003FF
_0800602C: .4byte 0x06010000
_08006030: .4byte 0x000001FF
_08006034: .4byte 0x085B8D24

