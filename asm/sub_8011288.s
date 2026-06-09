	.syntax unified
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.set sub_8011080, 0x08011080 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.section .text.sub_8011288, "ax", %progbits
@ sub_8011288 @ JP 0x08011288 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011288
	.thumb_func
sub_8011288:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080112D8 @ =0x06002000
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	movs r3, #0
	bl sub_8003BE8
	bl sub_80034D0
	bl sub_804F8F4
	bl SetDefaultColorEffects
	ldr r2, _080112DC @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	bl sub_8011080
	adds r4, #0x46
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080112D8: .4byte 0x06002000
_080112DC: .4byte 0x03003020

