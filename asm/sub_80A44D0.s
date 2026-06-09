	.syntax unified
	.set sub_800783C, 0x0800783C + 1
	.section .text.sub_80A44D0, "ax", %progbits
@ sub_80A44D0 @ JP 0x080A44D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A44D0
	.thumb_func
sub_80A44D0:
	push {lr}
	sub sp, #4
	ldr r3, _080A44EC @ =0x00000202
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #0xd4
	movs r2, #0x52
	bl sub_800783C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080A44EC: .4byte 0x00000202

