	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8070D50, "ax", %progbits
@ sub_8070D50 @ JP 0x08070D50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070D50
	.thumb_func
sub_8070D50:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov sb, r0
	ldr r4, [r0, #0x5c]
	ldr r0, _08070E14 @ =0x02000000
	mov r8, r0
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	add r0, r8
	ldr r3, [r0]
	adds r0, r4, #0
	str r3, [sp]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	add r0, r8
	ldr r2, [r0]
	ldrh r0, [r4, #0x10]
	movs r6, #0x40
	orrs r0, r6
	strh r0, [r4, #0x10]
	ldrh r1, [r4]
	ldr r5, _08070E18 @ =0x0000FFF7
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r4]
	ldr r3, [sp]
	ldrh r0, [r3, #0x10]
	orrs r0, r6
	strh r0, [r3, #0x10]
	ldrh r1, [r3]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2, #0x10]
	orrs r0, r6
	strh r0, [r2, #0x10]
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r2]
	mov r1, sb
	ldr r0, [r1, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	add r0, r8
	ldr r3, [r0]
	adds r0, r4, #0
	str r3, [sp]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	add r0, r8
	ldr r2, [r0]
	ldrh r0, [r4, #0x10]
	orrs r0, r6
	strh r0, [r4, #0x10]
	ldrh r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r4]
	ldr r3, [sp]
	ldrh r0, [r3, #0x10]
	orrs r0, r6
	strh r0, [r3, #0x10]
	ldrh r1, [r3]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2, #0x10]
	orrs r6, r0
	strh r6, [r2, #0x10]
	ldrh r0, [r2]
	ands r5, r0
	strh r5, [r2]
	mov r0, sb
	bl sub_8002DE4
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070E14: .4byte 0x02000000
_08070E18: .4byte 0x0000FFF7

