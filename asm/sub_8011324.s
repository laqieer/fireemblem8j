	.syntax unified
	.set StartBgmVolumeChange, 0x08002680 + 1
	.section .text.sub_8011324, "ax", %progbits
@ sub_8011324 @ JP 0x08011324 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011324
	.thumb_func
sub_8011324:
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801133C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
_0801133C:
	pop {r0}
	bx r0

