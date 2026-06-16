	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8070918, "ax", %progbits
@ NewEfxSkillType01BG @ JP 0x08070918 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEfxSkillType01BG
	.thumb_func
NewEfxSkillType01BG:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r0, _0807096C @ =0x08603A40
	movs r1, #3
	bl sub_8002BCC
	adds r7, r0, #0
	str r4, [r7, #0x5c]
	movs r0, #0
	strh r0, [r7, #0x2c]
	str r0, [r7, #0x44]
	ldr r0, _08070970 @ =0x080E49B6
	str r0, [r7, #0x48]
	ldr r0, _08070974 @ =0x08603A58
	str r0, [r7, #0x4c]
	str r0, [r7, #0x50]
	ldr r0, _08070978 @ =0x08603A98
	str r0, [r7, #0x54]
	ldr r0, _0807097C @ =0x08603AD8
	str r0, [r7, #0x58]
	bl sub_8056158
	ldr r0, _08070980 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0807098E
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08070984
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0807098E
	.align 2, 0
_0807096C: .4byte 0x08603A40
_08070970: .4byte 0x080E49B6
_08070974: .4byte 0x08603A58
_08070978: .4byte 0x08603A98
_0807097C: .4byte 0x08603AD8
_08070980: .4byte 0x0203E11C
_08070984:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0807098E:
	ldr r4, [r7, #0x5c]
	ldr r2, _08070A44 @ =0x02000000
	mov sb, r2
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	add r0, sb
	ldr r6, [r0]
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	add r0, sb
	ldr r1, [r0]
	ldrh r0, [r4, #0x10]
	movs r3, #0x20
	mov r8, r3
	mov r2, r8
	orrs r0, r2
	strh r0, [r4, #0x10]
	ldrh r0, [r4]
	movs r5, #8
	orrs r0, r5
	strh r0, [r4]
	ldrh r0, [r6, #0x10]
	orrs r0, r2
	strh r0, [r6, #0x10]
	ldrh r0, [r6]
	orrs r0, r5
	strh r0, [r6]
	ldrh r0, [r1, #0x10]
	orrs r0, r2
	strh r0, [r1, #0x10]
	ldrh r0, [r1]
	orrs r0, r5
	strh r0, [r1]
	ldr r0, [r7, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	add r0, sb
	ldr r6, [r0]
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	add r0, sb
	ldr r1, [r0]
	ldrh r0, [r4, #0x10]
	mov r3, r8
	orrs r0, r3
	strh r0, [r4, #0x10]
	ldrh r0, [r4]
	orrs r0, r5
	strh r0, [r4]
	ldrh r0, [r6, #0x10]
	orrs r0, r3
	strh r0, [r6, #0x10]
	ldrh r0, [r6]
	orrs r0, r5
	strh r0, [r6]
	ldrh r0, [r1, #0x10]
	orrs r0, r3
	strh r0, [r1, #0x10]
	ldrh r0, [r1]
	orrs r5, r0
	strh r5, [r1]
	ldr r0, _08070A48 @ =0x000003D1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r7, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070A44: .4byte 0x02000000
_08070A48: .4byte 0x000003D1

