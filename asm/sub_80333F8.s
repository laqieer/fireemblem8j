	.syntax unified
	.set sub_80138B8, 0x080138B8 + 1
	.section .text.sub_80333F8, "ax", %progbits
@ sub_80333F8 @ JP 0x080333F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80333F8
	.thumb_func
sub_80333F8:
	push {lr}
	sub sp, #0x14
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, _08033420 @ =0xFF00FFF0
	str r1, [sp, #8]
	movs r1, #0x40
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl sub_80138B8
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_08033420: .4byte 0xFF00FFF0

