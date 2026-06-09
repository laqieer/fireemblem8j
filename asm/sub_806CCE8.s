	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set efxCrimsonEyeOBJ_GetAdjustedOffsetX, 0x0806C988 + 1
	.set efxCrimsonEyeOBJ_GetAdjustedOffsetY, 0x0806C9E8 + 1
	.set efxCrimsonEyeOBJ_SetAffineScaleEx, 0x0806CA20 + 1
	.set efxCrimsonEyeOBJ_SetDrawPriority, 0x0806C89C + 1
	.set efxCrimsonEyeOBJ_WrapAngle, 0x0806C884 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_806CCE8, "ax", %progbits
@ sub_806CCE8 @ JP 0x0806CCE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806CCE8
	.thumb_func
sub_806CCE8:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x18
	bl sub_8012E84
	mov sb, r0
	movs r7, #0
_0806CD0A:
	cmp r7, #4
	bhi _0806CD52
	lsls r0, r7, #2
	ldr r1, _0806CD18 @ =_0806CD1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806CD18: .4byte _0806CD1C
_0806CD1C: @ jump table
	.4byte _0806CD30 @ case 0
	.4byte _0806CD36 @ case 1
	.4byte _0806CD3E @ case 2
	.4byte _0806CD44 @ case 3
	.4byte _0806CD4C @ case 4
_0806CD30:
	ldr r6, [r5, #0x60]
	movs r2, #0x1f
	b _0806CD50
_0806CD36:
	ldr r6, [r5, #0x64]
	movs r0, #0x1e
	mov r8, r0
	b _0806CD52
_0806CD3E:
	ldr r6, [r5, #0x68]
	movs r2, #0x1d
	b _0806CD50
_0806CD44:
	ldr r6, [r5, #0x44]
	movs r0, #0x1c
	mov r8, r0
	b _0806CD52
_0806CD4C:
	ldr r6, [r5, #0x48]
	movs r2, #0x1b
_0806CD50:
	mov r8, r2
_0806CD52:
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #1
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	adds r4, r0, r1
	adds r0, r4, #0
	bl efxCrimsonEyeOBJ_WrapAngle
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl efxCrimsonEyeOBJ_SetDrawPriority
	mov r0, sb
	adds r1, r4, #0
	bl efxCrimsonEyeOBJ_GetAdjustedOffsetX
	ldrh r1, [r5, #0x32]
	adds r1, r1, r0
	strh r1, [r6, #2]
	mov r0, sb
	adds r1, r4, #0
	bl efxCrimsonEyeOBJ_GetAdjustedOffsetY
	ldrh r1, [r5, #0x3a]
	adds r1, r1, r0
	strh r1, [r6, #4]
	mov r0, r8
	mov r1, sb
	adds r2, r4, #0
	bl efxCrimsonEyeOBJ_SetAffineScaleEx
	adds r7, #1
	cmp r7, #4
	ble _0806CD0A
	bl AnimSort
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0806CDB6
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_8002DE4
_0806CDB6:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

