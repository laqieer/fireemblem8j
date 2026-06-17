	.syntax unified
	.set GetItemIconId, 0x080174A8 + 1
	.set sub_8003520, 0x08003520 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8014328, 0x08014328 + 1
	.set sub_801729C, 0x0801729C + 1
	.section .text.sub_8011080, "ax", %progbits
@ ParsePopupInstAndGetLen @ JP 0x08011080 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ParsePopupInstAndGetLen
	.thumb_func
ParsePopupInstAndGetLen:
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r4, #0
	ldr r5, [r6, #0x2c]
	b _08011172
_0801108C:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #9
	bhi _08011170
	lsls r0, r0, #2
	ldr r1, _080110A0 @ =_080110A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080110A0: .4byte _080110A4
_080110A4: @ jump table
	.4byte _0801116C @ case 0
	.4byte _08011158 @ case 1
	.4byte _08011140 @ case 2
	.4byte _0801112C @ case 3
	.4byte _08011138 @ case 4
	.4byte _08011170 @ case 5
	.4byte _080110E8 @ case 6
	.4byte _08011108 @ case 7
	.4byte _080110D6 @ case 8
	.4byte _080110CC @ case 9
_080110CC:
	ldr r1, [r5, #4]
	adds r0, r6, #0
	adds r0, #0x48
	strh r1, [r0]
	b _08011170
_080110D6:
	ldr r0, _080110E4 @ =0x030005F0
	ldr r0, [r0]
	mov r1, sp
	bl sub_8014328
	lsls r0, r0, #3
	b _0801116E
	.align 2, 0
_080110E4: .4byte 0x030005F0
_080110E8:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, _08011104 @ =0x030005EC
	ldrh r0, [r0]
	bl GetItemIconId
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #0
	b _0801111E
	.align 2, 0
_08011104: .4byte 0x030005EC
_08011108:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, _08011128 @ =0x030005EC
	ldrh r0, [r0]
	adds r0, #0x70
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #1
_0801111E:
	bl sub_8003520
	adds r4, #0x10
	b _08011170
	.align 2, 0
_08011128: .4byte 0x030005EC
_0801112C:
	ldr r0, [r5, #4]
	bl sub_8009FA8
	bl sub_8003E0C
	b _0801116E
_08011138:
	ldr r0, [r5, #4]
	bl sub_8003E0C
	b _0801116E
_08011140:
	ldr r0, _08011154 @ =0x030005E8
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	bl sub_8003E0C
	b _0801116E
	.align 2, 0
_08011154: .4byte 0x030005E8
_08011158:
	ldr r0, _08011168 @ =0x030005EC
	ldrh r0, [r0]
	bl sub_801729C
	bl sub_8003E0C
	b _0801116E
	.align 2, 0
_08011168: .4byte 0x030005EC
_0801116C:
	ldr r0, [r5, #4]
_0801116E:
	adds r4, r4, r0
_08011170:
	adds r5, #8
_08011172:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801108C
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

