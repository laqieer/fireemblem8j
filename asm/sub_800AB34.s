	.syntax unified
	.set Spline_PrepareSegmentControls, 0x0800A844 + 1
	.set sub_800A874, 0x0800A874 + 1
	.set sub_800A9DC, 0x0800A9DC + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_800AB34, "ax", %progbits
@ Spline_BuildCubicCoeffs @ JP 0x0800AB34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Spline_BuildCubicCoeffs
	.thumb_func
Spline_BuildCubicCoeffs:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	str r0, [sp, #0x44]
	ldr r0, [r4, #0x10]
	mov r8, r0
	ldr r1, [r4, #0x1c]
	mov sb, r1
	adds r0, r4, #0
	mov r1, sp
	bl Spline_PrepareSegmentControls
	add r5, sp, #0x34
	mov r0, sp
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_800A9DC
	adds r4, #0xc
	adds r0, r4, #0
	mov r1, sp
	bl Spline_PrepareSegmentControls
	add r4, sp, #0x24
	mov r0, sp
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_800A874
	mov sl, r8
	str r5, [sp, #0x48]
	str r4, [sp, #0x4c]
	ldr r0, [sp, #0x44]
	cmp r0, #0
	ble _0800AC22
	movs r6, #0x80
	lsls r6, r6, #5
	mov r8, r0
_0800AB90:
	mov r0, sl
	ldr r1, [r0]
	lsls r1, r1, #0xd
	adds r0, r6, #0
	bl sub_80D6378
	adds r4, r0, #0
	mov r0, sb
	ldr r1, [r0]
	lsls r1, r1, #0xd
	adds r0, r6, #0
	bl sub_80D6378
	subs r4, r4, r0
	ldr r1, [sp, #0x48]
	ldr r0, [r1]
	adds r4, r4, r0
	ldr r1, [sp, #0x4c]
	ldr r0, [r1]
	adds r4, r4, r0
	str r4, [r7]
	mov r1, sl
	ldr r0, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0xc
	rsbs r1, r1, #0
	adds r0, r6, #0
	bl sub_80D6378
	adds r4, r0, #0
	mov r1, sb
	adds r1, #4
	mov sb, r1
	subs r1, #4
	ldm r1!, {r0}
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0xc
	adds r0, r6, #0
	bl sub_80D6378
	adds r5, r0, #0
	ldr r0, [sp, #0x48]
	ldr r1, [r0]
	lsls r1, r1, #0xd
	adds r0, r6, #0
	bl sub_80D6378
	adds r4, r4, r5
	subs r4, r4, r0
	ldr r1, [sp, #0x4c]
	ldm r1!, {r0}
	str r1, [sp, #0x4c]
	subs r4, r4, r0
	str r4, [r7, #4]
	ldr r1, [sp, #0x48]
	ldm r1!, {r0}
	str r1, [sp, #0x48]
	str r0, [r7, #8]
	mov r1, sl
	adds r1, #4
	mov sl, r1
	subs r1, #4
	ldm r1!, {r0}
	str r0, [r7, #0xc]
	adds r7, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bne _0800AB90
_0800AC22:
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

