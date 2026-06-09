	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80B7C78, "ax", %progbits
@ sub_80B7C78 @ JP 0x080B7C78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7C78
	.thumb_func
sub_80B7C78:
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	ldr r0, _080B7CE8 @ =0x020228A8
	movs r2, #0
	adds r1, r0, #0
	adds r1, #0x80
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r0, r0, r4
	movs r4, #0xf
_080B7C90:
	strh r2, [r0]
	strh r2, [r1]
	adds r1, #2
	adds r0, #2
	subs r4, #1
	cmp r4, #0
	bge _080B7C90
	adds r0, r3, #0
	adds r0, #0x2e
	movs r1, #0
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x2c
	adds r6, r0, #0
	adds r5, r2, #0
_080B7CB6:
	ldrb r0, [r7]
	bl GetClassData
	adds r0, #0x2c
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B7CD6
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080B7CD6:
	adds r4, #1
	cmp r4, #7
	ble _080B7CB6
	bl sub_8001EE4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7CE8: .4byte 0x020228A8

