	.syntax unified
	.section .text.InitTalkTextWin, "ax", %progbits
@ InitTalkTextWin @ JP 0x08008360 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitTalkTextWin
	.thumb_func
InitTalkTextWin:
	push {r4, r5, r6, lr}
	ldr r4, _080083D8 @ =0x03003020
	mov ip, r4
	ldrb r4, [r4, #1]
	movs r5, #0x20
	orrs r4, r5
	movs r5, #0x41
	rsbs r5, r5, #0
	ands r4, r5
	movs r5, #0x7f
	ands r4, r5
	mov r5, ip
	strb r4, [r5, #1]
	adds r4, r0, #1
	lsls r4, r4, #3
	adds r5, #0x2d
	strb r4, [r5]
	adds r4, r1, #1
	lsls r4, r4, #3
	adds r5, #4
	strb r4, [r5]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #3
	mov r2, ip
	adds r2, #0x2c
	strb r0, [r2]
	adds r1, r1, r3
	subs r1, #1
	lsls r1, r1, #3
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	adds r2, #8
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080083D8: .4byte 0x03003020

