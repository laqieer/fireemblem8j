	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_807C270, 0x0807C270 + 1
	.section .text.sub_807C1DC, "ax", %progbits
@ MuCtr_StartMoveTowards @ JP 0x0807C1DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MuCtr_StartMoveTowards
	.thumb_func
MuCtr_StartMoveTowards:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r0, [sp, #0x1c]
	mov r8, r0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r0, _0807C264 @ =0x08A13438
	movs r1, #5
	bl sub_8002BCC
	adds r2, r0, #0
	adds r2, #0x44
	movs r1, #0x3f
	ands r4, r1
	ldrb r3, [r2]
	movs r1, #0x40
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r4
	strb r1, [r2]
	movs r1, #0x3f
	ands r5, r1
	lsls r5, r5, #6
	ldrh r3, [r2]
	ldr r1, _0807C268 @ =0xFFFFF03F
	ands r1, r3
	orrs r1, r5
	strh r1, [r2]
	movs r1, #0x3f
	ands r6, r1
	lsls r6, r6, #0xc
	ldr r1, [r0, #0x44]
	ldr r3, _0807C26C @ =0xFFFC0FFF
	ands r1, r3
	orrs r1, r6
	str r1, [r0, #0x44]
	movs r1, #0
	strb r1, [r2, #3]
	strh r1, [r2, #4]
	strh r1, [r2, #6]
	mov r1, r8
	str r1, [sp]
	mov r1, sb
	movs r3, #1
	bl sub_807C270
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C264: .4byte 0x08A13438
_0807C268: .4byte 0xFFFFF03F
_0807C26C: .4byte 0xFFFC0FFF

