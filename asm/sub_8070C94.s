	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8070C94, "ax", %progbits
@ sub_8070C94 @ JP 0x08070C94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070C94
	.thumb_func
sub_8070C94:
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	ldr r4, [r0, #0x5c]
	ldr r0, _08070D4C @ =0x02000000
	mov sb, r0
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
	movs r2, #0x20
	mov r8, r2
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
	mov r1, sl
	ldr r0, [r1, #0x5c]
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
	mov r2, r8
	orrs r0, r2
	strh r0, [r4, #0x10]
	ldrh r0, [r4]
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
	orrs r5, r0
	strh r5, [r1]
	mov r0, sl
	bl sub_8002DE4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070D4C: .4byte 0x02000000

