	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.section .text.sub_8098850, "ax", %progbits
@ sub_8098850 @ JP 0x08098850 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098850
	.thumb_func
sub_8098850:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0809886C
	adds r0, r5, #0
	bl sub_8002DE4
_0809886C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

