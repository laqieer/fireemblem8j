	.syntax unified
	.set sub_804EEEC, 0x0804EEEC + 1
	.set sub_80B6934, 0x080B6934 + 1
	.section .text.sub_80B68B0, "ax", %progbits
@ sub_80B68B0 @ JP 0x080B68B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B68B0
	.thumb_func
sub_80B68B0:
	push {lr}
	bl sub_80B6934
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B68C4
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_804EEEC
_080B68C4:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

