	.syntax unified
	.set DrawBattleForecastContents, 0x08036DD0 + 1
	.set GetBattleForecastPanelSide, 0x080365D8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8036E4C, 0x08036E4C + 1
	.set sub_8036F2C, 0x08036F2C + 1
	.set sub_8036FA8, 0x08036FA8 + 1
	.set sub_803704C, 0x0803704C + 1
	.set sub_80370E8, 0x080370E8 + 1
	.section .text.sub_803715C, "ax", %progbits
@ sub_803715C @ JP 0x0803715C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803715C
	.thumb_func
sub_803715C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080371A4
	bl GetBattleForecastPanelSide
	adds r1, r0, #0
	cmp r1, #0
	beq _08037194
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _08037194
	adds r0, r4, #0
	bl sub_8002DE4
	b _080371C0
_08037194:
	adds r0, r4, #0
	bl DrawBattleForecastContents
	adds r0, r4, #0
	bl sub_8036F2C
	bl sub_8036E4C
_080371A4:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #1
	bne _080371C0
	adds r0, r4, #0
	bl sub_8036FA8
	adds r0, r4, #0
	bl sub_803704C
	adds r0, r4, #0
	bl sub_80370E8
_080371C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

