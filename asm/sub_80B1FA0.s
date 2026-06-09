	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B1FA0, "ax", %progbits
@ sub_80B1FA0 @ JP 0x080B1FA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1FA0
	.thumb_func
sub_80B1FA0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B1FB8 @ =0x08A9DB84
	bl Proc_Find
	cmp r0, #0
	beq _080B1FB0
	str r4, [r0, #0x30]
_080B1FB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1FB8: .4byte 0x08A9DB84

