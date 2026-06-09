	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set sub_8030C10, 0x08030C10 + 1
	.section .text.sub_807B890, "ax", %progbits
@ sub_807B890 @ JP 0x0807B890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B890
	.thumb_func
sub_807B890:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4a
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807B8A4
	adds r1, #0x80
_0807B8A4:
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807B8B4
	movs r0, #0x80
	lsls r0, r0, #1
	b _0807B944
_0807B8B4:
	cmp r1, #0x40
	beq _0807B930
	cmp r1, #0
	beq _0807B8FC
	adds r2, r1, #0
	movs r1, #0x40
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807B8CC
	eors r2, r1
	b _0807B8E8
_0807B8CC:
	ldr r0, _0807B8F4 @ =0x0202BCEC
	adds r0, #0x40
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #0
	bne _0807B8E6
	ldr r0, _0807B8F8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807B8E8
_0807B8E6:
	lsls r2, r2, #2
_0807B8E8:
	cmp r2, #0x80
	ble _0807B8EE
	movs r2, #0x80
_0807B8EE:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0807B944
	.align 2, 0
_0807B8F4: .4byte 0x0202BCEC
_0807B8F8: .4byte 0x085775CC
_0807B8FC:
	bl sub_8030C10
	cmp r0, #0
	bne _0807B91C
	ldr r0, _0807B918 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807B91C
	movs r0, #0x80
	b _0807B944
	.align 2, 0
_0807B918: .4byte 0x085775CC
_0807B91C:
	ldr r0, _0807B92C @ =0x0202BCEC
	adds r0, #0x40
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #0
	beq _0807B930
	movs r0, #0x40
	b _0807B944
	.align 2, 0
_0807B92C: .4byte 0x0202BCEC
_0807B930:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	bl GetClassData
	ldr r1, _0807B94C @ =0x08A13300
	ldrb r0, [r0, #7]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
_0807B944:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807B94C: .4byte 0x08A13300

