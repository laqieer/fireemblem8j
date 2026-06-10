	.syntax unified
	.set StartBgmVolumeChange, 0x08002680 + 1
	.section .text.sub_80112E0, "ax", %progbits
@ sub_80112E0 @ JP 0x080112E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80112E0
	.thumb_func
sub_80112E0:
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _080112F8
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
_080112F8:
	pop {r0}
	bx r0

