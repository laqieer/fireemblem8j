	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.section .text.sub_80B2744, "ax", %progbits
@ sub_80B2744 @ JP 0x080B2744 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2744
	.thumb_func
sub_80B2744:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	bl SetTextFont
	adds r2, r4, #0
	adds r2, #0x5a
	adds r1, r4, #0
	adds r1, #0x5c
	ldrh r0, [r2]
	ldrh r1, [r1]
	cmp r0, r1
	bne _080B2762
	movs r0, #0
	strh r0, [r2]
_080B2762:
	ldrh r0, [r2]
	adds r7, r2, #0
	cmp r0, #0
	bne _080B27B0
	movs r6, #0
	adds r5, r4, #0
	adds r5, #0x5e
	b _080B279C
_080B2772:
	ldrb r0, [r1]
	cmp r0, #1
	bne _080B2788
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r4, #0x54]
	adds r0, #1
	b _080B2798
_080B2788:
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x44
	adds r0, r4, r0
	bl sub_80040B8
_080B2798:
	str r0, [r4, #0x54]
	adds r6, #1
_080B279C:
	ldrh r0, [r5]
	cmp r6, r0
	bge _080B27B0
	ldr r1, [r4, #0x54]
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B2772
	adds r0, r4, #0
	bl sub_8002DE4
_080B27B0:
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

