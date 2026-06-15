	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80B8AA8, "ax", %progbits
@ sub_80B8AA8 @ JP 0x080B8AA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8AA8
	.thumb_func
sub_80B8AA8:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x30]
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r2, r4, #0
	adds r2, #0x34
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #0x64
	strb r0, [r1]
	movs r5, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B8B02
	adds r6, r2, #0
_080B8AD4:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetClassDisplayFontInfo
	ldrb r1, [r0, #5]
	ldrb r0, [r0, #4]
	subs r1, r1, r0
	ldrb r0, [r6]
	adds r1, r1, r0
	strb r1, [r6]
	adds r5, #1
	cmp r5, #0xd
	bgt _080B8B02
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B8AD4
_080B8B02:
	ldr r0, _080B8B1C @ =0x08AB7164
	ldr r1, _080B8B20 @ =0x06010000
	bl sub_8013008
	ldr r0, _080B8B24 @ =0x08AB8044
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_8000D68
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8B1C: .4byte 0x08AB7164
_080B8B20: .4byte 0x06010000
_080B8B24: .4byte 0x08AB8044

