	.syntax unified
	.set sub_80329D8, 0x080329D8 + 1
	.section .text.sub_8032AB8, "ax", %progbits
@ sub_8032AB8 @ JP 0x08032AB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8032AB8
	.thumb_func
sub_8032AB8:
	push {r4, lr}
	movs r4, #0
_08032ABC:
	ldr r2, _08032ADC @ =0x02033EF8
	adds r1, r4, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xa
	bhi _08032ABC
	lsls r0, r0, #2
	ldr r1, _08032AE0 @ =_08032AE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08032ADC: .4byte 0x02033EF8
_08032AE0: .4byte _08032AE4
_08032AE4: @ jump table
	.4byte _08032BA8 @ case 0
	.4byte _08032B10 @ case 1
	.4byte _08032B2C @ case 2
	.4byte _08032B7C @ case 3
	.4byte _08032B58 @ case 4
	.4byte _08032BA8 @ case 5
	.4byte _08032ABC @ case 6
	.4byte _08032ABC @ case 7
	.4byte _08032ABC @ case 8
	.4byte _08032ABC @ case 9
	.4byte _08032ABC @ case 10
_08032B10:
	ldr r0, _08032B28 @ =0x085C6080
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	b _08032B40
	.align 2, 0
_08032B28: .4byte 0x085C6080
_08032B2C:
	ldr r0, _08032B54 @ =0x085C6080
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #1
_08032B40:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80329D8
	b _08032ABC
	.align 2, 0
_08032B54: .4byte 0x085C6080
_08032B58:
	ldr r0, _08032B78 @ =0x085C6080
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	subs r1, #1
	b _08032B9A
	.align 2, 0
_08032B78: .4byte 0x085C6080
_08032B7C:
	ldr r0, _08032BA4 @ =0x085C6080
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #1
_08032B9A:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80329D8
	b _08032ABC
	.align 2, 0
_08032BA4: .4byte 0x085C6080
_08032BA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

