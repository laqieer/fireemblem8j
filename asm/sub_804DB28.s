	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_804DB28, "ax", %progbits
@ sub_804DB28 @ JP 0x0804DB28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804DB28
	.thumb_func
sub_804DB28:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, _0804DB64 @ =0x085D4B68
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8002BCC
	str r5, [r0, #0x34]
	str r5, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	movs r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	movs r1, #1
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804DB64: .4byte 0x085D4B68

