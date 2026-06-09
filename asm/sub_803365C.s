	.syntax unified
	.set sub_80976D0, 0x080976D0 + 1
	.section .text.sub_803365C, "ax", %progbits
@ sub_803365C @ JP 0x0803365C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803365C
	.thumb_func
sub_803365C:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80976D0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08033676
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	beq _08033676
	movs r0, #1
	b _08033678
_08033676:
	movs r0, #0
_08033678:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

