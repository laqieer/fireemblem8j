	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8069DD0, "ax", %progbits
@ StartSubSpell_efxEvilEyeOBJ @ JP 0x08069DD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartSubSpell_efxEvilEyeOBJ
	.thumb_func
StartSubSpell_efxEvilEyeOBJ:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	mov sb, r1
	ldr r0, _08069E64 @ =0x080E3D70
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r6, #0
	bl GetAnimPosition
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08069E68 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08069E6C @ =0x086026E8
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	adds r0, r6, #0
	bl GetAnimAnotherSide
	str r0, [r5, #0x5c]
	movs r0, #0
	mov r8, r0
	mov r1, r8
	strh r1, [r5, #0x2c]
	mov r0, sb
	strh r0, [r5, #0x2e]
	lsls r4, r4, #2
	add r4, sp
	adds r4, #4
	ldr r3, [r4]
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r5, #0x60]
	ldrh r1, [r0, #4]
	adds r1, #0x18
	strh r1, [r0, #4]
	mov r1, r8
	strh r1, [r0, #6]
	movs r1, #0x14
	strh r1, [r0, #0xa]
	bl AnimSort
	ldr r0, _08069E70 @ =0x086F5FD4
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08069E74 @ =0x086F5C7C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069E64: .4byte 0x080E3D70
_08069E68: .4byte 0x0201774C
_08069E6C: .4byte 0x086026E8
_08069E70: .4byte 0x086F5FD4
_08069E74: .4byte 0x086F5C7C

