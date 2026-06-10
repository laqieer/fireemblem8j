	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8007C00, "ax", %progbits
@ sub_8007C00 @ JP 0x08007C00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007C00
	.thumb_func
sub_8007C00:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08007C30 @ =0x085B9188
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007C30: .4byte 0x085B9188

