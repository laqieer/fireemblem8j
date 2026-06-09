	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B5238, "ax", %progbits
@ sub_80B5238 @ JP 0x080B5238 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5238
	.thumb_func
sub_80B5238:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B524C @ =0x08A9E4D0
	bl Proc_Find
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B524C: .4byte 0x08A9E4D0

