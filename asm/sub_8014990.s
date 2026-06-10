	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.section .text.sub_8014990, "ax", %progbits
@ sub_8014990 @ JP 0x08014990 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014990
	.thumb_func
sub_8014990:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bne _080149AE
	adds r0, r4, #0
	bl sub_8002DE4
_080149AE:
	pop {r4}
	pop {r0}
	bx r0

