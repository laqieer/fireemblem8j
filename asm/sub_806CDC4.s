	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set AnimSort, 0x08004EB4 + 1
	.set efxCrimsonEyeOBJ_GetAdjustedOffsetX, 0x0806C988 + 1
	.set efxCrimsonEyeOBJ_GetAdjustedOffsetY, 0x0806C9E8 + 1
	.set efxCrimsonEyeOBJ_SetAffineScaleEx, 0x0806CA20 + 1
	.set efxCrimsonEyeOBJ_SetDrawPriority, 0x0806C89C + 1
	.set efxCrimsonEyeOBJ_WrapAngle, 0x0806C884 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_806CDC4, "ax", %progbits
@ sub_806CDC4 @ JP 0x0806CDC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806CDC4
	.thumb_func
sub_806CDC4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
_0806CDD4:
	mov r1, r8
	cmp r1, #4
	bhi _0806CE20
	lsls r0, r1, #2
	ldr r1, _0806CDE4 @ =_0806CDE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806CDE4: .4byte _0806CDE8
_0806CDE8: @ jump table
	.4byte _0806CDFC @ case 0
	.4byte _0806CE04 @ case 1
	.4byte _0806CE0A @ case 2
	.4byte _0806CE12 @ case 3
	.4byte _0806CE1A @ case 4
_0806CDFC:
	ldr r7, [r5, #0x60]
	movs r2, #0x1f
	mov sb, r2
	b _0806CE20
_0806CE04:
	ldr r7, [r5, #0x64]
	movs r0, #0x1e
	b _0806CE1E
_0806CE0A:
	ldr r7, [r5, #0x68]
	movs r1, #0x1d
	mov sb, r1
	b _0806CE20
_0806CE12:
	ldr r7, [r5, #0x44]
	movs r2, #0x1c
	mov sb, r2
	b _0806CE20
_0806CE1A:
	ldr r7, [r5, #0x48]
	movs r0, #0x1b
_0806CE1E:
	mov sb, r0
_0806CE20:
	mov r1, r8
	lsls r0, r1, #3
	add r0, r8
	lsls r0, r0, #1
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	adds r6, r0, r1
	adds r0, r6, #0
	bl efxCrimsonEyeOBJ_WrapAngle
	adds r6, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl efxCrimsonEyeOBJ_SetDrawPriority
	movs r0, #0x18
	adds r1, r6, #0
	bl efxCrimsonEyeOBJ_GetAdjustedOffsetX
	adds r1, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #8
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8012E84
	ldrh r1, [r5, #0x32]
	adds r1, r1, r0
	strh r1, [r7, #2]
	movs r0, #0x18
	adds r1, r6, #0
	bl efxCrimsonEyeOBJ_GetAdjustedOffsetY
	adds r1, r0, #0
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8012E84
	ldrh r1, [r5, #0x3a]
	adds r1, r1, r0
	strh r1, [r7, #4]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	str r4, [sp]
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl sub_8012E84
	adds r1, r0, #0
	mov r0, sb
	adds r2, r6, #0
	bl efxCrimsonEyeOBJ_SetAffineScaleEx
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #4
	ble _0806CDD4
	bl AnimSort
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0806CEDE
	ldr r1, _0806CEEC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r5, #0x60]
	bl AnimDelete
	ldr r0, [r5, #0x64]
	bl AnimDelete
	ldr r0, [r5, #0x68]
	bl AnimDelete
	ldr r0, [r5, #0x44]
	bl AnimDelete
	ldr r0, [r5, #0x48]
	bl AnimDelete
	adds r0, r5, #0
	bl sub_8002DE4
_0806CEDE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CEEC: .4byte 0x0201774C

