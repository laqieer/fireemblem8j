	.syntax unified
	.set StartFaceAuto, 0x08005518 + 1
	.section .text.sub_800783C, "ax", %progbits
@ sub_800783C @ JP 0x0800783C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800783C
	.thumb_func
sub_800783C:
	push {r4, lr}
	ldr r4, [sp, #8]
	bl StartFaceAuto
	ldr r1, _08007858 @ =0x085B90D4
	ldr r1, [r1]
	lsls r4, r4, #2
	adds r1, #0x18
	adds r1, r1, r4
	str r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08007858: .4byte 0x085B90D4

