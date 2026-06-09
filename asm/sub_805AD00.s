	.syntax unified
	.set AnimCreate, 0x08004E50 + 1
	.section .text.sub_805AD00, "ax", %progbits
@ sub_805AD00 @ JP 0x0805AD00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805AD00
	.thumb_func
sub_805AD00:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, _0805ADE8 @ =0x080DFF00
	lsls r1, r5, #2
	adds r0, r1, r2
	ldrb r3, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r4, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r7, [r1]
	ldr r1, _0805ADEC @ =0x080DFF32
	ldr r0, _0805ADF0 @ =0x0203E11C
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, _0805ADF4 @ =0x02000030
	movs r1, #0
	strh r1, [r0, #2]
	ldr r0, _0805ADF8 @ =0x02000034
	strh r1, [r0, #2]
	ldr r0, _0805ADFC @ =0x02000028
	strh r2, [r0, #2]
	ldr r1, _0805AE00 @ =0x0200002C
	movs r0, #0x58
	strh r0, [r1, #2]
	ldr r0, _0805AE04 @ =0x02000060
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805AE08 @ =0x02011BC8
	adds r0, r1, r0
	cmp r3, #0xff
	bne _0805AD52
	ldr r0, _0805AE0C @ =0x085E3F8C
_0805AD52:
	adds r1, r4, #0
	bl AnimCreate
	adds r3, r0, #0
	ldr r2, _0805ADFC @ =0x02000028
	ldr r0, _0805AE10 @ =0x0201FB0C
	ldr r1, [r0]
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, _0805AE00 @ =0x0200002C
	ldrh r0, [r0, #2]
	strh r0, [r3, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0xc0
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r5, [r3, #0x12]
	ldr r0, _0805AE14 @ =0x02002088
	str r0, [r3, #0x2c]
	ldr r0, _0805AE18 @ =0x020099C8
	str r0, [r3, #0x30]
	ldr r0, _0805AE1C @ =0x02000000
	str r3, [r0, #8]
	ldr r0, _0805AE04 @ =0x02000060
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805AE08 @ =0x02011BC8
	adds r0, r1, r0
	cmp r6, #0xff
	bne _0805ADA4
	ldr r0, _0805AE0C @ =0x085E3F8C
_0805ADA4:
	adds r1, r7, #0
	bl AnimCreate
	adds r3, r0, #0
	ldr r2, _0805ADFC @ =0x02000028
	ldr r0, _0805AE10 @ =0x0201FB0C
	ldr r1, [r0]
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, _0805AE00 @ =0x0200002C
	ldrh r0, [r0, #2]
	strh r0, [r3, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0xe0
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r5, [r3, #0x12]
	ldr r0, _0805AE14 @ =0x02002088
	str r0, [r3, #0x2c]
	ldr r0, _0805AE18 @ =0x020099C8
	str r0, [r3, #0x30]
	ldr r0, _0805AE1C @ =0x02000000
	str r3, [r0, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805ADE8: .4byte 0x080DFF00
_0805ADEC: .4byte 0x080DFF32
_0805ADF0: .4byte 0x0203E11C
_0805ADF4: .4byte 0x02000030
_0805ADF8: .4byte 0x02000034
_0805ADFC: .4byte 0x02000028
_0805AE00: .4byte 0x0200002C
_0805AE04: .4byte 0x02000060
_0805AE08: .4byte 0x02011BC8
_0805AE0C: .4byte 0x085E3F8C
_0805AE10: .4byte 0x0201FB0C
_0805AE14: .4byte 0x02002088
_0805AE18: .4byte 0x020099C8
_0805AE1C: .4byte 0x02000000

