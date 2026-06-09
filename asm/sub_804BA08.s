	.syntax unified
	.set sub_807A888, 0x0807A888 + 1
	.section .text.sub_804BA08, "ax", %progbits
@ sub_804BA08 @ JP 0x0804BA08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804BA08
	.thumb_func
sub_804BA08:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	bl sub_807A888
	ldr r1, _0804BA44 @ =0x03001830
	lsls r4, r4, #2
	adds r4, r4, r1
	str r0, [r4]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	mov r1, r8
	str r0, [r1]
	ldr r0, [r5, #0xc]
	ldr r1, _0804BA48 @ =0xFFFFFDFF
	ands r0, r1
	str r0, [r5, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA44: .4byte 0x03001830
_0804BA48: .4byte 0xFFFFFDFF

