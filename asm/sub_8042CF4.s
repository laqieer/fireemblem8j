	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8042CF4, "ax", %progbits
@ sub_8042CF4 @ JP 0x08042CF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042CF4
	.thumb_func
sub_8042CF4:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _08042D1C @ =0x085D320C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	adds r2, r0, #0
	adds r2, #0x3b
	movs r1, #0
	strb r1, [r2]
	movs r2, #0
	strh r1, [r0, #0x38]
	adds r0, #0x3c
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042D1C: .4byte 0x085D320C

