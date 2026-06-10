	.syntax unified
	.set AiClearDecision, 0x08039C78 + 1
	.set AiUpdateNoMoveFlag, 0x08041010 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_803E284, 0x0803E284 + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_8039B78, "ax", %progbits
@ sub_8039B78 @ JP 0x08039B78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039B78
	.thumb_func
sub_8039B78:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
_08039B7C:
	ldr r4, _08039BC0 @ =0x0203AA00
	adds r0, r4, #0
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r4, #0x74]
	ldrb r0, [r2]
	cmp r0, #0
	beq _08039C6C
	adds r0, r4, #0
	adds r0, #0x7c
	strb r1, [r0]
	ldr r1, _08039BC4 @ =0x0202BE40
	ldrb r0, [r2]
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnit
	adds r1, r0, #0
	ldr r6, _08039BC8 @ =0x03004DF0
	str r1, [r6]
	ldr r5, [r1, #0xc]
	movs r0, #6
	ands r5, r0
	cmp r5, #0
	bne _08039BB6
	ldr r0, [r1]
	cmp r0, #0
	bne _08039BCC
_08039BB6:
	ldr r0, [r4, #0x74]
	adds r0, #1
	str r0, [r4, #0x74]
	b _08039B7C
	.align 2, 0
_08039BC0: .4byte 0x0203AA00
_08039BC4: .4byte 0x0202BE40
_08039BC8: .4byte 0x03004DF0
_08039BCC:
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	ldr r0, [r6]
	bl AiUpdateNoMoveFlag
	ldr r0, [r6]
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #0xf8
	ands r0, r1
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x7d
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x7a
	strb r5, [r0]
	bl sub_803E284
	bl AiClearDecision
	ldr r0, _08039C48 @ =0x03004F00
	ldr r0, [r0]
	bl sub_80D65BC
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0xc]
	ldr r1, _08039C4C @ =0x0203AA90
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08039C36
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	ldrb r3, [r1, #2]
	cmp r0, r3
	bne _08039C50
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldrb r2, [r1, #3]
	cmp r0, r2
	bne _08039C50
	ldrb r0, [r1]
	cmp r0, #0
	bne _08039C50
_08039C36:
	ldr r0, [r4, #0x74]
	adds r0, #1
	str r0, [r4, #0x74]
	adds r0, r7, #0
	movs r1, #0
	bl Proc_Goto
	b _08039C72
	.align 2, 0
_08039C48: .4byte 0x03004F00
_08039C4C: .4byte 0x0203AA90
_08039C50:
	ldr r0, _08039C64 @ =0x0203AA00
	ldr r1, [r0, #0x74]
	adds r1, #1
	str r1, [r0, #0x74]
	ldr r0, _08039C68 @ =0x085D1F2C
	adds r1, r7, #0
	bl Proc_StartBlocking
	b _08039C72
	.align 2, 0
_08039C64: .4byte 0x0203AA00
_08039C68: .4byte 0x085D1F2C
_08039C6C:
	adds r0, r7, #0
	bl Proc_End
_08039C72:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

