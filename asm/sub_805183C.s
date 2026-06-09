	.syntax unified
	.set EkrGauge_Setup44, 0x08051EF4 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set NewEkrLvlupFan, 0x08051B18 + 1
	.set sub_8056130, 0x08056130 + 1
	.section .text.sub_805183C, "ax", %progbits
@ sub_805183C @ JP 0x0805183C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805183C
	.thumb_func
sub_805183C:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _08051880
	ldr r2, _08051864 @ =0x0203E1C4
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0805186C
	ldr r0, _08051868 @ =0x0203E1C0
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _08051876
	.align 2, 0
_08051864: .4byte 0x0203E1C4
_08051868: .4byte 0x0203E1C0
_0805186C:
	ldr r0, _080518CC @ =0x0203E1C0
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_08051876:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _08051880
	bl NewEkrLvlupFan
_08051880:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x28
	ble _0805195C
	bl sub_8056130
	movs r0, #0
	bl EkrGauge_Setup44
	bl GetBanimDragonStatusType
	cmp r0, #2
	bhi _080518D4
	cmp r0, #1
	blo _080518D4
	ldr r3, _080518D0 @ =0x03003020
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
	b _08051900
	.align 2, 0
_080518CC: .4byte 0x0203E1C0
_080518D0: .4byte 0x03003020
_080518D4:
	ldr r3, _08051930 @ =0x03003020
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
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
_08051900:
	adds r2, r3, #0
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	ldr r2, _08051934 @ =0x0203E1C4
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0805193C
	ldr r0, _08051938 @ =0x0203E1C0
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _08051946
	.align 2, 0
_08051930: .4byte 0x03003020
_08051934: .4byte 0x0203E1C4
_08051938: .4byte 0x0203E1C0
_0805193C:
	ldr r0, _08051950 @ =0x0203E1C0
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_08051946:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _08051958
	ldr r0, _08051954 @ =sub_8051968
	b _0805195A
	.align 2, 0
_08051950: .4byte 0x0203E1C0
_08051954: .4byte 0x08051969  @ sub_8051968
_08051958:
	ldr r0, _08051964 @ =sub_80519C4
_0805195A:
	str r0, [r4, #0xc]
_0805195C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051964: .4byte 0x080519C5  @ sub_80519C4

