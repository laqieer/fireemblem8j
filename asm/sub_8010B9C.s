	.syntax unified
	.set GenerateScriptBattleHitFormEventQueue, 0x08010AD0 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002EB4, 0x08002EB4 + 1
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_8012038, 0x08012038 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.set sub_802CDF4, 0x0802CDF4 + 1
	.section .text.sub_8010B9C, "ax", %progbits
@ sub_8010B9C @ JP 0x08010B9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010B9C
	.thumb_func
sub_8010B9C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r0, [r6, #0x38]
	ldrb r1, [r0]
	movs r7, #0xf
	ands r7, r1
	movs r1, #2
	ldrsh r4, [r0, r1]
	movs r1, #4
	ldrsh r5, [r0, r1]
	ldrh r1, [r0, #6]
	ldrb r0, [r0, #6]
	str r0, [sp, #0xc]
	lsrs r1, r1, #8
	str r1, [sp, #0x10]
	ldr r0, _08010BD0 @ =0x030004B0
	ldr r0, [r0, #0x34]
	cmp r0, #0
	bne _08010BD4
	movs r0, #0
	b _08010BD8
	.align 2, 0
_08010BD0: .4byte 0x030004B0
_08010BD4:
	bl GenerateScriptBattleHitFormEventQueue
_08010BD8:
	mov r8, r0
	cmp r7, #0
	blt _08010C72
	cmp r7, #1
	ble _08010BE8
	cmp r7, #2
	beq _08010C68
	b _08010C72
_08010BE8:
	cmp r4, #0
	bge _08010BF0
	movs r4, #2
	rsbs r4, r4, #0
_08010BF0:
	cmp r5, #0
	bge _08010BF8
	movs r5, #2
	rsbs r5, r5, #0
_08010BF8:
	adds r0, r4, #0
	bl sub_800BF3C
	mov sl, r0
	adds r0, r5, #0
	bl sub_800BF3C
	mov sb, r0
	ldrh r2, [r6, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010C1E
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08010C22
_08010C1E:
	movs r5, #0
	b _08010C44
_08010C22:
	movs r5, #1
	ldr r0, _08010C64 @ =0x085B9CFC
	adds r1, r6, #0
	bl Proc_StartBlocking
	adds r4, r0, #0
	str r6, [r4, #0x58]
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #7
	bl sub_8002EB4
_08010C44:
	ldr r1, [sp, #0xc]
	str r1, [sp]
	mov r0, r8
	str r0, [sp, #4]
	rsbs r0, r7, #0
	orrs r0, r7
	lsrs r0, r0, #0x1f
	str r0, [sp, #8]
	mov r0, sl
	mov r1, sb
	ldr r2, [sp, #0x10]
	adds r3, r5, #0
	bl sub_8012038
	movs r0, #2
	b _08010C74
	.align 2, 0
_08010C64: .4byte 0x085B9CFC
_08010C68:
	mov r0, r8
	bl sub_802CDF4
	movs r0, #0
	b _08010C74
_08010C72:
	movs r0, #6
_08010C74:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

