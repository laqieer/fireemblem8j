	.syntax unified
	.set sub_80153B0, 0x080153B0 + 1
	.set sub_80184D4, 0x080184D4 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80861E0, 0x080861E0 + 1
	.section .text.sub_8015434, "ax", %progbits
@ sub_8015434 @ JP 0x08015434 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015434
	.thumb_func
sub_8015434:
	push {lr}
	bl sub_80184D4
	bl sub_8027144
	bl sub_80153B0
	bl sub_80861E0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08015452
	movs r0, #1
	b _08015454
_08015452:
	movs r0, #0
_08015454:
	pop {r1}
	bx r1

