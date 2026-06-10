	.syntax unified
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8028BB8, 0x08028BB8 + 1
	.set sub_8028E0C, 0x08028E0C + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_804FCAC, 0x0804FCAC + 1
	.set sub_80502F4, 0x080502F4 + 1
	.section .text.sub_8023734, "ax", %progbits
@ sub_8023734 @ JP 0x08023734 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023734
	.thumb_func
sub_8023734:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	bne _0802376C
	ldr r0, _08023764 @ =0x03004DF0
	ldr r0, [r0]
	ldr r1, _08023768 @ =0x0203A954
	ldrb r2, [r1, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_8028BB8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80502F4
	movs r0, #8
	b _080237A8
	.align 2, 0
_08023764: .4byte 0x03004DF0
_08023768: .4byte 0x0203A954
_0802376C:
	bl sub_804F610
	ldr r0, _080237B0 @ =0x03004DF0
	ldr r0, [r0]
	ldr r1, _080237B4 @ =0x0203A954
	ldrb r2, [r1, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_8028E0C
	ldr r0, _080237B8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08023798
	movs r0, #0x6a
	bl m4aSongNumStart
_08023798:
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl sub_804FCAC
	movs r0, #0x21
_080237A8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080237B0: .4byte 0x03004DF0
_080237B4: .4byte 0x0203A954
_080237B8: .4byte 0x0202BCEC

