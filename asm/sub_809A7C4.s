	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_809A7C4, "ax", %progbits
@ sub_809A7C4 @ JP 0x0809A7C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A7C4
	.thumb_func
sub_809A7C4:
	push {lr}
	ldr r0, _0809A7D4 @ =0x08A94688
	bl Proc_Find
	movs r1, #0
	str r1, [r0, #0x38]
	pop {r0}
	bx r0
	.align 2, 0
_0809A7D4: .4byte 0x08A94688

