	.syntax unified
	.set GetUnitMu, 0x0807BFCC + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_80376A8, 0x080376A8 + 1
	.set sub_8037720, 0x08037720 + 1
	.set sub_807B4C8, 0x0807B4C8 + 1
	.section .text.sub_8037888, "ax", %progbits
@ sub_8037888 @ JP 0x08037888 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037888
	.thumb_func
sub_8037888:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl sub_80376A8
	cmp r0, #0
	beq _080378A8
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl sub_8037720
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080378C0
_080378A8:
	adds r0, r4, #0
	bl GetUnitMu
	bl sub_807B4C8
	bl sub_8019914
	bl RefreshEntityBmMaps
	bl sub_8026F38
	movs r0, #1
_080378C0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

