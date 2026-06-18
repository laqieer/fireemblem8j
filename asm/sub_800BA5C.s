	.syntax unified
	.set sub_800B4F0, 0x0800B4F0 + 1
	.set sub_800B6C0, 0x0800B6C0 + 1
	.section .text.sub_800BA5C, "ax", %progbits
@ Spline_SetupChannels @ JP 0x0800BA5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Spline_SetupChannels
	.thumb_func
Spline_SetupChannels:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov ip, r2
	mov sb, ip
	ldr r4, [r6]
	ldr r7, [r5, #4]
	ldr r0, [r5, #8]
	mov r8, r0
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0800BA9C
	ldr r1, [r7, #4]
	movs r0, #0
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #8
	ldr r2, [r5, #0x10]
	ldr r3, [r5]
	mov r1, ip
	str r1, [sp]
	adds r1, r7, #0
	bl sub_800B4F0
	adds r3, r0, #0
_0800BA9C:
	movs r0, #8
	ands r4, r0
	cmp r4, #0
	beq _0800BAC0
	mov r0, r8
	ldr r1, [r0, #4]
	movs r0, #0
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x1c
	ldr r2, [r5, #0x14]
	ldr r3, [r5]
	mov r1, sb
	str r1, [sp]
	mov r1, r8
	bl sub_800B6C0
	adds r3, r0, #0
_0800BAC0:
	adds r0, r3, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

