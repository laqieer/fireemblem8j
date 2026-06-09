	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_804D9B4, "ax", %progbits
@ sub_804D9B4 @ JP 0x0804D9B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D9B4
	.thumb_func
sub_804D9B4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	adds r7, r2, #0
	mov r8, r3
	ldr r6, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r4, _0804D9F8 @ =0x085D4B34
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8002BCC
	str r6, [r0, #0x3c]
	mov r1, sb
	str r1, [r0, #0x2c]
	mov r1, sl
	str r1, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	str r7, [r0, #0x38]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D9F8: .4byte 0x085D4B34

