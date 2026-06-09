	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_804CA24, "ax", %progbits
@ sub_804CA24 @ JP 0x0804CA24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804CA24
	.thumb_func
sub_804CA24:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0804CAC4 @ =0x085D4858
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r2, #0
	strh r4, [r0]
	ldr r0, _0804CAC8 @ =0x03003020
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #1
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r7, ip
	adds r7, #0x35
	ldrb r1, [r7]
	mov r0, r8
	orrs r1, r0
	orrs r1, r6
	orrs r1, r5
	orrs r1, r4
	orrs r1, r3
	mov r3, ip
	adds r3, #0x36
	ldrb r2, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	subs r2, #2
	ands r0, r2
	subs r2, #4
	ands r0, r2
	subs r2, #8
	ands r0, r2
	strb r0, [r3]
	movs r0, #0x20
	orrs r1, r0
	strb r1, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CAC4: .4byte 0x085D4858
_0804CAC8: .4byte 0x03003020

