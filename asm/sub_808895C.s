	.syntax unified
	.section .text.sub_808895C, "ax", %progbits
@ sub_808895C @ JP 0x0808895C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808895C
	.thumb_func
sub_808895C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r5, [sp, #0x20]
	ldr r6, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	ldr r4, _08088A58 @ =0x03001CC0
	lsls r7, r0, #3
	mov sl, r7
	add sl, r4
	movs r4, #0x3f
	ands r5, r4
	mov r7, sl
	ldrb r7, [r7]
	mov r8, r7
	subs r4, #0x7f
	mov sb, r4
	mov r7, r8
	ands r4, r7
	orrs r4, r5
	mov r5, sl
	strb r4, [r5]
	movs r7, #0x3f
	ands r6, r7
	lsls r6, r6, #6
	ldrh r5, [r5]
	ldr r4, _08088A5C @ =0xFFFFF03F
	mov r8, r4
	ands r4, r5
	orrs r4, r6
	mov r5, sl
	strh r4, [r5]
	ldr r4, [r5]
	ldr r5, _08088A60 @ =0xFFFC0FFF
	ands r4, r5
	mov r7, sl
	str r4, [r7]
	movs r4, #0
	strb r4, [r7, #3]
	ldr r4, _08088A64 @ =0x0000FFFF
	strh r4, [r7, #4]
	movs r6, #0
	movs r4, #0x1e
	strh r4, [r7, #6]
	ldr r4, _08088A68 @ =0x03001CE0
	mov ip, r4
	lsls r5, r0, #2
	adds r5, r5, r0
	lsls r5, r5, #2
	adds r4, r5, r4
	movs r7, #1
	strb r7, [r4]
	strb r1, [r4, #1]
	strb r6, [r4, #2]
	ldrb r1, [r4, #3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #7
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #7
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #3]
	movs r0, #0x3f
	ands r2, r0
	ldrb r0, [r4, #4]
	mov r1, sb
	ands r1, r0
	orrs r1, r2
	strb r1, [r4, #4]
	movs r0, #0x3f
	ands r3, r0
	lsls r3, r3, #6
	ldrh r0, [r4, #4]
	mov r1, r8
	ands r1, r0
	orrs r1, r3
	strh r1, [r4, #4]
	ldrb r1, [r4, #5]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #5]
	strb r6, [r4, #6]
	strb r7, [r4, #7]
	movs r7, #8
	add ip, r7
	add r5, ip
	mov r0, sl
	str r0, [r5]
	strb r6, [r4, #0xc]
	strb r6, [r4, #0xd]
	strb r6, [r4, #0xe]
	strb r6, [r4, #0xf]
	strb r6, [r4, #0x10]
	strb r6, [r4, #0x11]
	strb r6, [r4, #0x12]
	strb r6, [r4, #0x13]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088A58: .4byte 0x03001CC0
_08088A5C: .4byte 0xFFFFF03F
_08088A60: .4byte 0xFFFC0FFF
_08088A64: .4byte 0x0000FFFF
_08088A68: .4byte 0x03001CE0

