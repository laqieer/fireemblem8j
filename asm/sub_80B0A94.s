	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80B0A94, "ax", %progbits
@ sub_80B0A94 @ JP 0x080B0A94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0A94
	.thumb_func
sub_80B0A94:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x38
	movs r5, #4
_080B0A9E:
	adds r0, r4, #0
	bl sub_8003CF8
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080B0A9E
	adds r4, r6, #0
	adds r4, #0x38
	ldr r1, _080B0AD4 @ =0x08A9D970
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_8009FA8
_080B0AC2:
	adds r1, r0, #0
_080B0AC4:
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B0AE0
	cmp r0, #1
	bne _080B0AD8
	adds r4, #8
	adds r1, #1
	b _080B0AC4
	.align 2, 0
_080B0AD4: .4byte 0x08A9D970
_080B0AD8:
	adds r0, r4, #0
	bl sub_80040B8
	b _080B0AC2
_080B0AE0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

