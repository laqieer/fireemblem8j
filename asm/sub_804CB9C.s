	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_804CB9C, "ax", %progbits
@ Sio_StartBoxTransitionClose @ JP 0x0804CB9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_StartBoxTransitionClose
	.thumb_func
Sio_StartBoxTransitionClose:
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0804CC20 @ =0x085D4890
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r2, #0
	strh r4, [r0]
	ldr r3, _0804CC24 @ =0x03003020
	ldrb r1, [r3, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x35
	ldrb r2, [r4]
	movs r0, #1
	orrs r2, r0
	movs r0, #2
	orrs r2, r0
	movs r0, #4
	orrs r2, r0
	movs r0, #8
	orrs r2, r0
	movs r0, #0x10
	orrs r2, r0
	adds r3, #0x36
	ldrb r1, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CC20: .4byte 0x085D4890
_0804CC24: .4byte 0x03003020

