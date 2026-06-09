	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.section .text.sub_801496C, "ax", %progbits
@ sub_801496C @ JP 0x0801496C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801496C
	.thumb_func
sub_801496C:
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _0801498C @ =0x085C2660
	bl Proc_StartBlocking
	adds r4, r0, #0
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801498C: .4byte 0x085C2660

