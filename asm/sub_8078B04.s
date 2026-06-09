	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EkrDragonTmCpyWithDistance, 0x08072168 + 1
	.set SetEkrDragonStatusUnk1, 0x08072054 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80139E0, 0x080139E0 + 1
	.set sub_8013B3C, 0x08013B3C + 1
	.set sub_8056964, 0x08056964 + 1
	.set sub_80720DC, 0x080720DC + 1
	.set sub_8078A40, 0x08078A40 + 1
	.section .text.sub_8078B04, "ax", %progbits
@ sub_8078B04 @ JP 0x08078B04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078B04
	.thumb_func
sub_8078B04:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl sub_8078A40
	ldr r0, _08078B94 @ =0x60016001
	bl sub_8056964
	ldr r0, _08078B98 @ =0x020244A8
	movs r1, #1
	bl sub_80011D0
	movs r0, #8
	bl BG_EnableSyncByMask
	ldr r0, _08078B9C @ =0x08848CF0
	ldr r1, _08078BA0 @ =0x06008000
	bl sub_8013008
	ldr r0, _08078BA4 @ =0x0884BEE4
	ldr r1, _08078BA8 @ =0x02019790
	bl sub_8013008
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08078BAC @ =0x0201FB0C
	ldr r0, [r0]
	subs r0, #0x20
	movs r1, #0x50
	rsbs r1, r1, #0
	bl sub_80720DC
	ldr r3, _08078BB0 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	ldrb r0, [r3, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x14]
	movs r0, #6
	bl sub_8013B3C
	ldr r0, _08078BB4 @ =0x0884CB34
	movs r1, #6
	movs r2, #0x78
	adds r3, r4, #0
	bl sub_80139E0
	movs r0, #1
	bl SetEkrDragonStatusUnk1
	movs r0, #0
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078B94: .4byte 0x60016001
_08078B98: .4byte 0x020244A8
_08078B9C: .4byte 0x08848CF0
_08078BA0: .4byte 0x06008000
_08078BA4: .4byte 0x0884BEE4
_08078BA8: .4byte 0x02019790
_08078BAC: .4byte 0x0201FB0C
_08078BB0: .4byte 0x03003020
_08078BB4: .4byte 0x0884CB34

