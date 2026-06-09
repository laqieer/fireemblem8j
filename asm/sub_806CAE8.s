	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set efxCrimsonEyeOBJ_GetOffsetX, 0x0806C958 + 1
	.set efxCrimsonEyeOBJ_GetOffsetY, 0x0806C970 + 1
	.set efxCrimsonEyeOBJ_SetDrawPriority, 0x0806C89C + 1
	.set efxCrimsonEyeOBJ_WrapAngle, 0x0806C884 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_806C8B4, 0x0806C8B4 + 1
	.section .text.sub_806CAE8, "ax", %progbits
@ sub_806CAE8 @ JP 0x0806CAE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806CAE8
	.thumb_func
sub_806CAE8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov sl, r0
_0806CAFA:
	mov r1, sl
	cmp r1, #4
	bhi _0806CB46
	lsls r0, r1, #2
	ldr r1, _0806CB0C @ =_0806CB10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806CB0C: .4byte _0806CB10
_0806CB10: @ jump table
	.4byte _0806CB24 @ case 0
	.4byte _0806CB2A @ case 1
	.4byte _0806CB32 @ case 2
	.4byte _0806CB38 @ case 3
	.4byte _0806CB40 @ case 4
_0806CB24:
	ldr r6, [r7, #0x60]
	movs r0, #0x1f
	b _0806CB44
_0806CB2A:
	ldr r6, [r7, #0x64]
	movs r1, #0x1e
	str r1, [sp, #4]
	b _0806CB46
_0806CB32:
	ldr r6, [r7, #0x68]
	movs r0, #0x1d
	b _0806CB44
_0806CB38:
	ldr r6, [r7, #0x44]
	movs r1, #0x1c
	str r1, [sp, #4]
	b _0806CB46
_0806CB40:
	ldr r6, [r7, #0x48]
	movs r0, #0x1b
_0806CB44:
	str r0, [sp, #4]
_0806CB46:
	mov r1, sl
	lsls r0, r1, #3
	add r0, sl
	lsls r0, r0, #1
	bl efxCrimsonEyeOBJ_WrapAngle
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl efxCrimsonEyeOBJ_SetDrawPriority
	adds r0, r5, #0
	movs r1, #0
	bl efxCrimsonEyeOBJ_GetOffsetX
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	adds r0, r5, #0
	mov r1, r8
	bl efxCrimsonEyeOBJ_GetOffsetX
	adds r2, r0, #0
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r0, #0x10
	mov sb, r0
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl sub_8012E84
	ldrh r1, [r7, #0x32]
	adds r1, r1, r0
	strh r1, [r6, #2]
	adds r0, r5, #0
	movs r1, #0
	bl efxCrimsonEyeOBJ_GetOffsetY
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, r8
	bl efxCrimsonEyeOBJ_GetOffsetY
	adds r2, r0, #0
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl sub_8012E84
	ldrh r1, [r7, #0x3a]
	adds r1, r1, r0
	strh r1, [r6, #4]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	movs r1, #2
	mov r2, r8
	bl sub_8012E84
	adds r1, r0, #0
	ldr r0, [sp, #4]
	adds r2, r5, #0
	bl sub_806C8B4
	movs r1, #1
	add sl, r1
	mov r0, sl
	cmp r0, #4
	ble _0806CAFA
	bl AnimSort
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0806CBFA
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl sub_8002DE4
_0806CBFA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

