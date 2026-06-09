	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8007BD4, "ax", %progbits
@ sub_8007BD4 @ JP 0x08007BD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007BD4
	.thumb_func
sub_8007BD4:
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08007BFC @ =0x085B9188
	adds r1, r3, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007BFC: .4byte 0x085B9188

