	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8015710, 0x08015710 + 1
	.section .text.sub_804D0DC, "ax", %progbits
@ sub_804D0DC @ JP 0x0804D0DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D0DC
	.thumb_func
sub_804D0DC:
	push {lr}
	sub sp, #0x18
	ldr r1, _0804D134 @ =0x080DEFD0
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl sub_8001ACC
	ldr r3, _0804D138 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl sub_8015710
	ldr r0, _0804D13C @ =0x085D7F68
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_8000D68
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_0804D134: .4byte 0x080DEFD0
_0804D138: .4byte 0x03003020
_0804D13C: .4byte 0x085D7F68

