	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set EventShowTextBgDirect, 0x0800E9E0 + 1
	.set sub_800F2DC, 0x0800F2DC + 1
	.set sub_80B7344, 0x080B7344 + 1
	.set sub_80B7398, 0x080B7398 + 1
	.section .text.sub_800EADC, "ax", %progbits
@ Event21_TextBg @ JP 0x0800EADC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event21_TextBg
	.thumb_func
Event21_TextBg:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r2, [r5, #0x38]
	ldrb r0, [r2]
	movs r3, #0xf
	ands r3, r0
	movs r0, #2
	ldrsh r7, [r2, r0]
	cmp r7, #0
	bge _0800EAFA
	ldr r0, _0800EB08 @ =0x030004B0
	movs r1, #8
	ldrsh r7, [r0, r1]
_0800EAFA:
	cmp r3, #1
	beq _0800EB2A
	cmp r3, #1
	bgt _0800EB0C
	cmp r3, #0
	beq _0800EB1A
	b _0800EC8C
	.align 2, 0
_0800EB08: .4byte 0x030004B0
_0800EB0C:
	cmp r3, #2
	bne _0800EB12
	b _0800EC30
_0800EB12:
	cmp r3, #3
	bne _0800EB18
	b _0800EC6A
_0800EB18:
	b _0800EC8C
_0800EB1A:
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r1, r7, #0x10
	lsrs r1, r1, #0x10
	bl EventShowTextBgDirect
	b _0800EBDE
_0800EB2A:
	ldrh r6, [r2, #4]
	ldrh r2, [r2, #6]
	mov r8, r2
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800EC16
	lsls r0, r0, #2
	ldr r1, _0800EB44 @ =_0800EB48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800EB44: .4byte _0800EB48
_0800EB48: @ jump table
	.4byte _0800EB60 @ case 0
	.4byte _0800EBA0 @ case 1
	.4byte _0800EBA0 @ case 2
	.4byte _0800EB60 @ case 3
	.4byte _0800EB60 @ case 4
	.4byte _0800EB60 @ case 5
_0800EB60:
	cmp r6, #5
	bhi _0800EC16
	lsls r0, r6, #2
	ldr r1, _0800EB70 @ =_0800EB74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800EB70: .4byte _0800EB74
_0800EB74: @ jump table
	.4byte _0800EC58 @ case 0
	.4byte _0800EB8C @ case 1
	.4byte _0800EB8C @ case 2
	.4byte _0800EC58 @ case 3
	.4byte _0800EC58 @ case 4
	.4byte _0800EC58 @ case 5
_0800EB8C:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r4, #1
	ands r0, r4
	cmp r0, #0
	bne _0800EC7C
	ldr r0, _0800EB9C @ =0x085B9C3C
	b _0800EC0A
	.align 2, 0
_0800EB9C: .4byte 0x085B9C3C
_0800EBA0:
	cmp r6, #5
	bhi _0800EC16
	lsls r0, r6, #2
	ldr r1, _0800EBB0 @ =_0800EBB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800EBB0: .4byte _0800EBB4
_0800EBB4: @ jump table
	.4byte _0800EBCC @ case 0
	.4byte _0800EBFC @ case 1
	.4byte _0800EBFC @ case 2
	.4byte _0800EBCC @ case 3
	.4byte _0800EBCC @ case 4
	.4byte _0800EBCC @ case 5
_0800EBCC:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800EBE4
	adds r0, r5, #0
	bl sub_800F2DC
_0800EBDE:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0800EC8E
_0800EBE4:
	ldr r0, _0800EBF8 @ =0x085B9C94
	adds r1, r5, #0
	bl Proc_StartBlocking
	mov ip, r0
	mov r1, ip
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	b _0800EC16
	.align 2, 0
_0800EBF8: .4byte 0x085B9C94
_0800EBFC:
	ldrh r0, [r5, #0x3c]
	lsrs r4, r0, #2
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	bne _0800EC7C
	ldr r0, _0800EC2C @ =0x085B9BE4
_0800EC0A:
	adds r1, r5, #0
	bl Proc_StartBlocking
	mov ip, r0
	adds r0, #0x29
	strb r4, [r0]
_0800EC16:
	mov r1, ip
	adds r1, #0x2a
	movs r0, #0
	strb r6, [r1]
	mov r2, ip
	strh r7, [r2, #0x2c]
	mov r1, r8
	strh r1, [r2, #0x2e]
	strh r0, [r2, #0x30]
	str r5, [r2, #0x34]
	b _0800EC8C
	.align 2, 0
_0800EC2C: .4byte 0x085B9BE4
_0800EC30:
	ldrh r4, [r2, #4]
	ldrh r2, [r2, #6]
	mov r8, r2
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800EC7C
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r1, r7, #0x10
	lsrs r1, r1, #0x10
	bl EventShowTextBgDirect
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne _0800EC5C
_0800EC58:
	movs r0, #6
	b _0800EC8E
_0800EC5C:
	mov r0, r8
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80B7398
	b _0800EC8C
_0800EC6A:
	ldrh r4, [r2, #4]
	ldrh r2, [r2, #6]
	mov r8, r2
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800EC80
_0800EC7C:
	movs r0, #0
	b _0800EC8E
_0800EC80:
	mov r0, r8
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80B7344
_0800EC8C:
	movs r0, #2
_0800EC8E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

