	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_80B5C24, "ax", %progbits
@ sub_80B5C24 @ JP 0x080B5C24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5C24
	.thumb_func
sub_80B5C24:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _080B5C36
	bl Proc_End
	movs r0, #0
	str r0, [r4, #0x34]
_080B5C36:
	pop {r4}
	pop {r0}
	bx r0

