	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set efxCrimsonEyeOBJ_GetOffsetX, 0x0806C958 + 1
	.set efxCrimsonEyeOBJ_GetOffsetY, 0x0806C970 + 1
	.set efxCrimsonEyeOBJ_SetDrawPriority, 0x0806C89C + 1
	.set efxCrimsonEyeOBJ_WrapAngle, 0x0806C884 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806C8B4, 0x0806C8B4 + 1
	.section .text.sub_806CC0C, "ax", %progbits
@ sub_806CC0C @ JP 0x0806CC0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806CC0C
	.thumb_func
sub_806CC0C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	movs r0, #0
	mov r8, r0
_0806CC1A:
	mov r1, r8
	cmp r1, #4
	bhi _0806CC68
	lsls r0, r1, #2
	ldr r1, _0806CC2C @ =_0806CC30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806CC2C: .4byte _0806CC30
_0806CC30: @ jump table
	.4byte _0806CC44 @ case 0
	.4byte _0806CC4C @ case 1
	.4byte _0806CC52 @ case 2
	.4byte _0806CC5A @ case 3
	.4byte _0806CC62 @ case 4
_0806CC44:
	ldr r7, [r6, #0x60]
	movs r2, #0x1f
	mov sb, r2
	b _0806CC68
_0806CC4C:
	ldr r7, [r6, #0x64]
	movs r0, #0x1e
	b _0806CC66
_0806CC52:
	ldr r7, [r6, #0x68]
	movs r1, #0x1d
	mov sb, r1
	b _0806CC68
_0806CC5A:
	ldr r7, [r6, #0x44]
	movs r2, #0x1c
	mov sb, r2
	b _0806CC68
_0806CC62:
	ldr r7, [r6, #0x48]
	movs r0, #0x1b
_0806CC66:
	mov sb, r0
_0806CC68:
	mov r1, r8
	lsls r0, r1, #3
	add r0, r8
	lsls r0, r0, #1
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	adds r5, r0, r1
	adds r0, r5, #0
	bl efxCrimsonEyeOBJ_WrapAngle
	adds r5, r0, #0
	adds r0, r7, #0
	adds r1, r5, #0
	bl efxCrimsonEyeOBJ_SetDrawPriority
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl efxCrimsonEyeOBJ_GetOffsetX
	ldrh r1, [r6, #0x32]
	adds r1, r1, r0
	strh r1, [r7, #2]
	adds r0, r5, #0
	adds r1, r4, #0
	bl efxCrimsonEyeOBJ_GetOffsetY
	ldrh r1, [r6, #0x3a]
	adds r1, r1, r0
	strh r1, [r7, #4]
	mov r0, sb
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_806C8B4
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #4
	ble _0806CC1A
	bl AnimSort
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7e
	bne _0806CCDC
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl sub_8002DE4
_0806CCDC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

