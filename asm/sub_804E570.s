	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_804E570, "ax", %progbits
@ sub_804E570 @ JP 0x0804E570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E570
	.thumb_func
sub_804E570:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _0804E59C @ =0x085D4C7C
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8002BCC
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804E59C: .4byte 0x085D4C7C

