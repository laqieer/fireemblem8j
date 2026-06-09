	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set ShowGmUnit, 0x080C4338 + 1
	.set sub_80C31F8, 0x080C31F8 + 1
	.section .text.sub_80C7FD8, "ax", %progbits
@ sub_80C7FD8 @ JP 0x080C7FD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7FD8
	.thumb_func
sub_80C7FD8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C7FF8 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	movs r2, #0x1e
	bl sub_80C31F8
	ldrh r0, [r4, #0x2c]
	bl ShowGmUnit
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7FF8: .4byte 0x08AC1108

