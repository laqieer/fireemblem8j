	.syntax unified
	.set StartMenuAt, 0x0804FA24 + 1
	.set sub_8023470, 0x08023470 + 1
	.section .text.ItemSelectMenu_Effect, "ax", %progbits
@ ItemSelectMenu_Effect @ JP 0x080233EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ItemSelectMenu_Effect
	.thumb_func
ItemSelectMenu_Effect:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08023444 @ =0x0203A954
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x2a]
	adds r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08023448 @ =0xFFFFFF00
	ands r5, r2
	orrs r5, r0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _0802344C @ =0xFFFF00FF
	ands r5, r1
	orrs r5, r0
	ldr r0, _08023450 @ =0xFF00FFFF
	ands r5, r0
	movs r0, #0xa0
	lsls r0, r0, #0xb
	orrs r5, r0
	ldr r0, _08023454 @ =0x00FFFFFF
	ands r5, r0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x10
	asrs r1, r1, #0x18
	bl sub_8023470
	ldr r0, _08023458 @ =0x085C55F8
	adds r1, r5, #0
	adds r2, r4, #0
	bl StartMenuAt
	movs r0, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023444: .4byte 0x0203A954
_08023448: .4byte 0xFFFFFF00
_0802344C: .4byte 0xFFFF00FF
_08023450: .4byte 0xFF00FFFF
_08023454: .4byte 0x00FFFFFF
_08023458: .4byte 0x085C55F8

