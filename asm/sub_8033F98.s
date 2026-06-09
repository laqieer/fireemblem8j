	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80310F4, 0x080310F4 + 1
	.section .text.sub_8033F98, "ax", %progbits
@ sub_8033F98 @ JP 0x08033F98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033F98
	.thumb_func
sub_8033F98:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08033FB4 @ =0x03004DF0
	ldr r2, [r5]
	cmp r2, #0
	bne _08033FB8
	bl sub_80310F4
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0803400A
	.align 2, 0
_08033FB4: .4byte 0x03004DF0
_08033FB8:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, _08034010 @ =0x0202E4D4
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl sub_80310F4
	ldr r2, [r5]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
_0803400A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034010: .4byte 0x0202E4D4

