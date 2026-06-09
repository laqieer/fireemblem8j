	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80B8C9C, 0x080B8C9C + 1
	.section .text.sub_80D17C8, "ax", %progbits
@ sub_80D17C8 @ JP 0x080D17C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D17C8
	.thumb_func
sub_80D17C8:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	movs r0, #0
	strh r0, [r2]
	adds r5, r4, #0
	adds r5, #0x46
	strb r3, [r5]
	adds r2, #3
	movs r0, #0x78
	strb r0, [r2]
	movs r6, #0
	ldr r2, _080D1834 @ =0x089CF318
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _080D181A
	adds r4, r1, #0
_080D17FA:
	ldrb r0, [r4]
	bl sub_80B8C9C
	ldrb r1, [r0, #5]
	ldrb r0, [r0, #4]
	subs r1, r1, r0
	ldrb r0, [r5]
	adds r1, r1, r0
	strb r1, [r5]
	adds r4, #1
	adds r6, #1
	cmp r6, #0x13
	bgt _080D181A
	ldrb r0, [r4]
	cmp r0, #0
	bne _080D17FA
_080D181A:
	ldr r0, _080D1838 @ =0x08AB7164
	ldr r1, _080D183C @ =0x06011000
	bl sub_8013008
	ldr r0, _080D1840 @ =0x08AB8044
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_8000D68
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D1834: .4byte 0x089CF318
_080D1838: .4byte 0x08AB7164
_080D183C: .4byte 0x06011000
_080D1840: .4byte 0x08AB8044

