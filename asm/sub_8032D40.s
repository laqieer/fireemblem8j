	.syntax unified
	.set SetLastCoords, 0x08032924 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8032938, 0x08032938 + 1
	.set sub_80329D8, 0x080329D8 + 1
	.set sub_8032DCC, 0x08032DCC + 1
	.section .text.sub_8032D40, "ax", %progbits
@ PathArrowDisp_Init @ JP 0x08032D40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PathArrowDisp_Init
	.thumb_func
PathArrowDisp_Init:
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	ldr r0, _08032DB0 @ =0x08A7510C
	ldr r1, _08032DB4 @ =0x06015E00
	bl sub_8013008
	ldr r0, _08032DB8 @ =0x08A75344
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	cmp r4, #0
	bne _08032DA8
	ldr r5, _08032DBC @ =0x085C6080
	ldr r2, [r5]
	ldr r4, _08032DC0 @ =0x03004DF0
	ldr r1, [r4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x12]
	ldrb r1, [r1, #0x1d]
	adds r0, r0, r1
	ldr r1, _08032DC4 @ =0x0203A954
	ldrb r1, [r1, #0x10]
	subs r0, r0, r1
	adds r2, #0x2b
	strb r0, [r2]
	movs r0, #0
	bl sub_8032938
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80329D8
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	adds r0, #0x55
	strb r1, [r0]
	ldr r1, _08032DC8 @ =0x0000FFFF
	adds r0, r1, #0
	bl SetLastCoords
	bl sub_8032DCC
_08032DA8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032DB0: .4byte 0x08A7510C
_08032DB4: .4byte 0x06015E00
_08032DB8: .4byte 0x08A75344
_08032DBC: .4byte 0x085C6080
_08032DC0: .4byte 0x03004DF0
_08032DC4: .4byte 0x0203A954
_08032DC8: .4byte 0x0000FFFF

