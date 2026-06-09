	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_809A7A4, "ax", %progbits
@ sub_809A7A4 @ JP 0x0809A7A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A7A4
	.thumb_func
sub_809A7A4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809A7C0 @ =0x08A94688
	bl Proc_Find
	movs r1, #1
	str r1, [r0, #0x38]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A7C0: .4byte 0x08A94688

